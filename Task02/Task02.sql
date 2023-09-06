-- Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке.
SELECT firstname
FROM users
ORDER BY  firstname ;

-- Выведите количество мужчин старше 35 лет
SELECT COUNT(*)
FROM profiles
WHERE gender = 'm' AND birthday >  NOW() - INTERVAL 35 YEAR  ;

-- Сколько заявок в друзья в каждом статусе?
SELECT status, count(*)
FROM friend_requests
GROUP BY status;


-- Выведите номер пользователя, который отправил больше всех заявок в друзья первый вариант
SELECT initiator_user_id
FROM friend_requests
group by initiator_user_id
HAVING count(*) > 2;

-- Выведите номер пользователя, который отправил больше всех заявок в друзья второй вариант
SELECT initiator_user_id, count(*), max(status)
FROM friend_requests
GROUP BY initiator_user_id
LIMIT 1;

-- Выведите названия и номера групп, имена которых состоят из 5 символов
SELECT name, id
FROM communities
WHERE name LIKE '_____';





