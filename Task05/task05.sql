--Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk
DROP FUNCTION IF EXISTS delete_user;

DELIMITER //

CREATE FUNCTION vk.delete_user (user_id INT)
RETURNS INT deterministic
BEGIN

DELETE FROM messages WHERE messages.from_user_id = user_id;
DELETE FROM likes  WHERE likes.user_id = user_id;
DELETE FROM profiles WHERE profiles.user_id = user_id;
DELETE FROM media WHERE media.user_id = user_id;
DELETE FROM friend_requests WHERE friend_requests.initiator_user_id = user_id;
DELETE FROM friend_requests WHERE friend_requests.target_user_id = user_id;
DELETE FROM users_communities WHERE users_communities.user_id = user_id;
DELETE FROM users WHERE users.id = user_id;
	RETURN user_id;
END //

DELIMITER ;

SELECT vk.delete_user (40);

--Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.

DROP PROCEDURE IF EXISTS vk.vk_deletes_user ;
DELIMITER //
CREATE PROCEDURE vk.vk_deletes_user (IN user_id INT)
BEGIN

START TRANSACTION;
	DELETE FROM messages WHERE messages.from_user_id = user_id;
	DELETE FROM likes  WHERE likes.user_id = user_id;
	DELETE FROM profiles WHERE profiles.user_id = user_id;
	DELETE FROM media WHERE media.user_id = user_id;
	DELETE FROM friend_requests WHERE friend_requests.initiator_user_id = user_id;
	DELETE FROM friend_requests WHERE friend_requests.target_user_id = user_id;
	DELETE FROM users_communities WHERE users_communities.user_id = user_id;
	DELETE FROM users WHERE users.id = user_id;
	
	SELECT user_id;
END //
DELIMITER ;

--Написать триггер, который проверяет новое появляющееся сообщество/Длина названия сообщества (поле name) должна быть не менее 5 символов
CALL  vk.vk_deletes_user(39);


 DROP TRIGGER IF EXISTS check_new_communities;
 DELIMITER //
 CREATE TRIGGER check_new_communities
 BEFORE INSERT ON communities
 FOR EACH ROW
 begin 
	IF length(NEW.name) <5 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Длина названия сообщества должна быть не менее 5 символов.';
        END IF;
END //

DELIMITER ;