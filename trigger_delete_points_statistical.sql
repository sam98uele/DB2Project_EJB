delimiter //
DROP TRIGGER IF EXISTS db2_project.delete_points_statistical;
CREATE TRIGGER db2_project.delete_points_statistical
AFTER DELETE ON statistical_answer
FOR EACH ROW
BEGIN
    IF(OLD.q1 IS NOT NULL) THEN
		UPDATE user SET points=points-2 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = OLD.response_id
			);
	END IF;
    IF(OLD.q2 IS NOT NULL) THEN
		UPDATE user SET points=points-2 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = OLD.response_id
			);
	END IF;
    IF(OLD.q3 IS NOT NULL) THEN
		UPDATE user SET points=points-2 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = OLD.response_id
			);
	END IF;
END; //
delimiter ;