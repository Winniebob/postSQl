 -- количество сообществ, в которые вступил каждый пользователь.

 -- 1. первый вариант
SELECT community_id, count(user_id) AS 'Количество вступивших пользователей'
FROM users_communities
GROUP BY community_id;

-- 2. второй вариант 
SELECT communities.name , count(user_id) AS ' количество сообществ в которые вступил пользователь'
FROM communities
	LEFT JOIN users_communities ON communities.id = users_communities.community_id
GROUP BY communities.name

-- количество пользователей в каждом сообществе.

SELECT users.lastname , users.id, count(communities.id) as ' количество сообществ в которые вступил пользователь'
FROM communities
	LEFT JOIN users_communities ON communities.id = users_communities.community_id
	LEFT JOIN users ON users.id = users_communities.user_id
GROUP BY users.id

--  задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

SELECT from_user_id, users.lastname, to_user_id,  count(messages.to_user_id) as send_messeg
FROM messages
	LEFT JOIN users ON users.id = messages.from_user_id
where to_user_id = '1'
group by from_user_id
order by send_messeg DESC
LIMIT 1;


-- общее количество лайков, которые получили пользователи младше 18 лет
SELECT likes.media_id, users.lastname, count(likes.id) 
FROM likes
	LEFT JOIN media ON media.id = likes.media_id
	LEFT JOIN users ON users.id = media.user_id
    LEFT JOIN profiles ON profiles.user_id = users.id 
WHERE (YEAR(NOW())-YEAR(birthday)) < 18
GROUP BY likes.media_id
LIMIT 1;

-- Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT profiles.gender, count(likes.id)
FROM profiles
    LEFT JOIN likes ON likes.user_id = profiles.user_id
GROUP BY profiles.gender