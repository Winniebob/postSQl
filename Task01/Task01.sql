-- 1. Создал новую базу данных. Добаляем три новые таблицы и заполняем произвольные две по 10 записей.


DROP TABLE IF EXISTS dislikes;
CREATE TABLE dislikes(
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()
    );
    
DROP TABLE IF EXISTS blacklist;
CREATE TABLE blacklist(
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()
    );
    
DROP TABLE IF EXISTS spouse;
CREATE TABLE spouse(
	id SERIAL,
    `status` ENUM('в отношениях', 'любовник', 'в поисках', 'все сложно'),
    user_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()
    );



INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0001', 'Anna', 'Poster', 'annaPo@gmail.com', '3344WWE', 8800445533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0002', 'Dosy', 'Poster', 'dosyPo@gmail.com', '3eeSSE', 8805645533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0003', 'Noah', 'Liam', 'LiamNo@gmail.com', '123SE', 8835641233);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0004', 'Jacob', 'William', 'Sosf@gmail.com', '314E', 885545533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0005', 'Ethan', 'Charily', 'EEETPo@gmail.com', '312414wwE', 8878945533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0006', 'Michael', 'Hatry', 'SAAPo@gmail.com', '3sdgdsdE', 8803456533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0007', 'Alexander', 'Tonysad', 'ddddyPo@gmail.com', '3eqt32', 8875903533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0008', 'James', 'Opxser', 'hjhyPo@gmail.com', '314221SSE', 8805285033);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0009', 'George', 'Viroplols', 'WOOPsyPo@gmail.com', '3gsgssdE', 8804225533);
    
INSERT INTO users (id, firstname, lastname, email, password_hash, phone)
	VALUES ('0010', 'Oscar', 'Ivanov', 'ddropyPo@gmail.com', '3567567E', 8809505533);

INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0001', 'W', '2000-10-20', 033 , 'Moscow'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0002', 'W', '1995-11-23', 133 , 'Moscow'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0003', 'M', '2010-3-23', 23 , 'Kazan'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0004', 'M', '1995-7-3', 05 , 'Tula');
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0005', 'M', '2000-1-12', 12 , 'Saratov'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0006', 'M', '1995-4-7', 01 , 'Noriksk'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0007', 'M', '2010-9-9', 523 , 'Brest'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0008', 'M', '2000-12-1', 132 , 'Kiev'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0009', 'M', '1995-5-5', 777 , 'Berlin'); 
INSERT INTO profiles(user_id,gender,birthday,photo_id,hometown)
	VALUES ('0010', 'M', '2010-6-6', 888 , 'Tokyo'); 

-- 2. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных
    
AlTER TABLE profiles 
 ADD is_active BOOLEAN ;

UPDATE profiles 
SET is_active = true
WHERE (YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d'));

INSERT INTO messages(id,from_user_id,to_user_id,body)
	VALUES ('1', '1', '1', 'OLOLOLOL' ); 

UPDATE messages
	SET created_at = '3333-01-01 00:00:01'
    WHERE id = 1;

-- 3. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)

DELETE FROM messages
WHERE created_at > now()