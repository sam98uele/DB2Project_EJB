delimiter //
DROP TRIGGER IF EXISTS db2_project.update_points_marketing;
CREATE TRIGGER db2_project.update_points_marketing 
AFTER INSERT ON marketing_answer 
FOR EACH ROW
BEGIN
    IF(NEW.answer IS NOT NULL) THEN
		UPDATE user SET points=points+1 
        WHERE id IN 
			(
				SELECT user_id FROM questionnaire_response
                WHERE id = NEW.response_id
			);
	END IF;
END; //
delimiter ;