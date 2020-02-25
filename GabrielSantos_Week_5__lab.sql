 # IS 361 GABRIEL SANTOS 02/25/2020
 # 1. My SCHEMA is called video_reviews.
 # 2. Create one table to keep track of the videos.
DROP TABLE IF EXISTS tblVideos;
CREATE TABLE tblVideos
( video_id int PRIMARY KEY,
  title varchar(80) NOT NULL,
  lenght int NOT NULL,
  url varchar(100) NOT NULL
);
# Insert records
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 1, 'F1 2019 Season Review', 85 , 'https://www.youtube.com/watch?v=7oWv927tOwI');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 2, 'Top 10 Best Video Games of 2019', 13 , 'https://www.youtube.com/watch?v=yq3F7BKl0Fg');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 3, 'Introducing SQL Server 2019 | Data Exposed', 13, 'https://www.youtube.com/watch?v=TZrsxrz6w34');
INSERT INTO tblVideos ( video_id, title, lenght, url ) VALUES ( 4, 'Optimizing Tableau Server for High Availability', 49, 'https://www.youtube.com/watch?v=P1OC3Ejc6VU');

 # 3. Ceate a second table that provides at least two user reviews for each of at least two of the videos. 
DROP TABLE IF EXISTS tblReviews;
CREATE TABLE tblReviews
(
  review_id int PRIMARY KEY,
  video_id int NOT NULL REFERENCES tblVideos,
  user varchar(30) NOT NULL,
  rating int,
  review varchar(30) NOT NULL
);

# Insert records
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 1, 1,'Gabriel', 5 ,'Love Formula 1');
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 2, 1,'Maria', 5 ,'Cant wait for season 2020');
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 3, 4,'John', 3 ,'Tableau is easy to learn');
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 4, 4,'Michael', 4 ,'Nice tool for data scientists');
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 5, 3,'Joseph', 5 ,'Stll working with SQL2016');
INSERT INTO tblReviews ( review_id, video_id, user, rating, review ) VALUES ( 6, 2,'Mia', 4 ,'Sekiro is #1');

# 4. Write a JOIN statement that shows information from both tables.
SELECT 
a.title As 'Title',
a.lenght AS 'Lenght',
a.url AS 'URL',
b.user As 'User',
b.rating As 'Rating',
b.review AS 'Review'
FROM tblVideos a 
JOIN tblReviews b 
ON a.video_id = b.video_id
order by b.rating;

