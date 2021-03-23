delimiter //
DROP TRIGGER IF EXISTS db2_project.delete_points_marketing;
CREATE TRIGGER db2_project.delete_points_marketing 
AFTER DELETE ON marketing_answer 
FOR EACH ROW
BEGIN
    IF(OLD.answer IS NOT NULL) THEN
		UPDATE user SET points=points-1 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = OLD.response_id
			);
	END IF;
END; //
delimiter ;