delimiter //
DROP TRIGGER IF EXISTS db2_project.update_points_statistical;
CREATE TRIGGER db2_project.update_points_statistical
AFTER INSERT ON statistical_answer
FOR EACH ROW
BEGIN
    IF(NEW.q1 IS NOT NULL) THEN
		UPDATE user SET points=points+2 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = NEW.response_id
			);
	END IF;
    IF(NEW.q2 IS NOT NULL) THEN
		UPDATE user SET points=points+2 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = NEW.response_id
			);
	END IF;
    IF(NEW.q3 IS NOT NULL) THEN
		UPDATE user SET points=points+2 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = NEW.response_id
			);
	END IF;
END; //
delimiter ;