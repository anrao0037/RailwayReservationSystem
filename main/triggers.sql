-- Trigger function for automatic seat allocation
CREATE OR REPLACE FUNCTION try_alloc_seat()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
    train_name VARCHAR(100);
    src_station_name VARCHAR(100);
    dest_station_name VARCHAR(100);
    waiting_ticket RECORD;
BEGIN
    IF TG_OP = 'INSERT' THEN
        -- Extract train_name, source/destination station names
        SELECT get_train_name(NEW.train_no)
        INTO train_name;
        SELECT get_station_name(NEW.src_station_id)
        INTO src_station_name;
        SELECT get_station_name(NEW.dest_station_id)
        INTO dest_station_name;

        -- Try allocating seat to this passenger
        CALL allocate_seat(NEW.pnr, train_name, src_station_name, dest_station_name, NEW.date, NEW.seat_type);
    ELSEIF TG_OP = 'UPDATE' AND NEW.booking_status = 'Cancelled' THEN
        -- Loop all the passengers in the waiting queue in order of booking time
        FOR waiting_ticket IN (SELECT pnr,
                                    train_no,
                                    src_station_id,
                                    dest_station_id,
                                    date,
                                    seat_type
                                FROM ticket
                                WHERE booking_status = 'Waiting'
                                    AND (date - get_journey_at_station(src_station_id, train_no) + 1) =
                                (NEW.date - get_journey_at_station(NEW.src_station_id, NEW.train_no) + 1)
                                    AND train_no = NEW.train_no
                                ORDER BY booking_time ASC)
        LOOP
            -- RAISE NOTICE '%', waiting_ticket;
            -- Extract train_name, source/destination station names
            SELECT get_train_name(waiting_ticket.train_no)
            INTO train_name;
            SELECT get_station_name(waiting_ticket.src_station_id)
            INTO src_station_name;
            SELECT get_station_name(waiting_ticket.dest_station_id)
            INTO dest_station_name;

            -- Try allocating seat to this passenger
            CALL allocate_seat(waiting_ticket.pnr, train_name, src_station_name, dest_station_name,
                waiting_ticket.date, waiting_ticket.seat_type);
        END LOOP;
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER seat_allocation
AFTER INSERT OR UPDATE
ON ticket
FOR EACH ROW
EXECUTE FUNCTION try_alloc_seat();
