/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `ProjectP4`;
CREATE SCHEMA `ProjectP4`;
USE `ProjectP4`;
DROP TABLE IF EXISTS `COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMENT` (
  `comment_id` int NOT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `Commented_post_id` int DEFAULT NULL,
  `Commented_user_id` int DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `Commented_post_id` (`Commented_post_id`),
  KEY `Commented_user_id` (`Commented_user_id`),
  CONSTRAINT `COMMENT_ibfk_1` FOREIGN KEY (`Commented_post_id`) REFERENCES `POST` (`post_id`),
  CONSTRAINT `COMMENT_ibfk_2` FOREIGN KEY (`Commented_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `COMMENT` WRITE;
/*!40000 ALTER TABLE `COMMENT` DISABLE KEYS */;
INSERT INTO `COMMENT` VALUES (1,'Great post! Really enjoyed reading this.','2024-01-02 04:45:00',1,2),(2,'Thanks for sharing!','2024-01-02 05:30:00',1,3),(3,'Looks like you had a fun day!','2024-01-03 08:15:00',2,4),(4,'Can’t wait to see your project!','2024-01-04 04:15:00',3,5),(5,'So true! We should appreciate every moment.','2024-01-05 05:00:00',4,6),(6,'I love that song!','2024-01-05 05:50:00',5,7),(7,'Congratulations on finishing the marathon!','2024-01-08 09:20:00',7,8),(8,'I’m in for game night!','2024-01-14 15:45:00',14,9),(9,'What book are you reading?','2024-01-07 03:15:00',6,10),(10,'Sounds amazing! Where did you go?','2024-01-13 13:40:00',12,11),(11,'Let’s plan a catch-up soon!','2024-01-19 14:55:00',18,12),(12,'I want to see pictures of your puppy!','2024-01-16 04:00:00',15,13),(13,'What recipe are you trying out?','2024-01-17 06:20:00',16,14),(14,'Happy to hear you’re back home!','2024-01-18 11:05:00',17,15),(15,'I’d love to join for dinner next time!','2024-01-09 14:15:00',9,16),(16,'That dinner sounds delicious! Where did you go?','2024-01-06 04:30:00',7,4),(17,'I can’t wait for my vacation too!','2024-01-07 06:00:00',8,4),(18,'Congratulations on the new puppy! What’s its name?','2024-01-08 06:45:00',9,9),(19,'I love that book! It’s one of my favorites.','2024-01-09 08:15:00',10,9),(20,'Feeling grateful is so important! Thanks for sharing.','2024-01-10 09:00:00',16,11),(21,'Welcome back! I hope you had an amazing trip!','2024-01-11 09:30:00',18,11);
/*!40000 ALTER TABLE `COMMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT` (
  `event_id` int NOT NULL,
  `event_name` varchar(100) DEFAULT NULL,
  `event_description` text,
  `venue` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_by_user_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  CONSTRAINT `EVENT_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `EVENT` WRITE;
/*!40000 ALTER TABLE `EVENT` DISABLE KEYS */;
INSERT INTO `EVENT` VALUES (1,'Book Club Meeting','Monthly meeting for book discussions.','Community Center','New York','USA','2024-01-20 15:00:00','2024-01-20 17:00:00',1),(2,'Yoga Retreat','A weekend retreat for yoga and meditation.','Mountain Resort','Los Angeles','USA','2024-02-05 09:00:00','2024-02-07 17:00:00',2),(3,'Tech Conference 2024','Annual tech conference featuring industry leaders.','Convention Center','San Francisco','USA','2024-03-10 09:00:00','2024-03-12 18:00:00',3),(4,'Art Exhibition Opening','Opening night for the new art exhibition.','Art Gallery','Chicago','USA','2024-04-01 18:00:00','2024-04-01 21:00:00',4),(5,'Summer Music Festival','A festival celebrating music and culture.','City Park','Miami','USA','2024-06-15 12:00:00','2024-06-15 22:00:00',5),(6,'Cooking Class with Chef John','Learn to cook Italian cuisine.','Culinary School','Boston','USA','2024-05-10 10:00:00','2024-05-10 14:00:00',6),(7,'Photography Workshop','Hands-on workshop to improve your photography skills.','City Park','Seattle','USA','2024-07-20 09:30:00','2024-07-20 16:30:00',7),(8,'Charity Run for Health Awareness','Participate in a charity run for health awareness.','Downtown Square','Austin','USA','2024-08-25 08:00:00','2024-08-25 11:00:00',8),(9,'Film Screening Night','Join us for a night of classic films.','Local Theater','San Diego','USA','2024-09-10 18:00:00','2024-09-10 21:00:00',9),(10,'Community Garden Day','Help us plant and maintain our community garden.','Community Garden','Phoenix','USA','2024-10-05 09:00:00','2024-10-05 12:00:00',10),(11,'Annual Science Fair','Showcasing innovative projects from local schools.','High School Gym','Denver','USA','2024-11-15 09:00:00','2024-11-15 16:00:00',11),(12,'Annual Technology Conference','A conference to discuss the latest in technology.','Convention Center','New York','USA','2024-06-15 09:00:00','2024-06-15 17:00:00',1),(13,'International Business Conference','Networking and discussions on global business trends.','Grand Hotel','Los Angeles','USA','2024-07-20 10:00:00','2024-07-20 16:00:00',2);
/*!40000 ALTER TABLE `EVENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `EVENTS_ATTEND_BY_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENTS_ATTEND_BY_USER` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `EVENTS_ATTEND_BY_USER_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`),
  CONSTRAINT `EVENTS_ATTEND_BY_USER_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `EVENT` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `EVENTS_ATTEND_BY_USER` WRITE;
/*!40000 ALTER TABLE `EVENTS_ATTEND_BY_USER` DISABLE KEYS */;
INSERT INTO `EVENTS_ATTEND_BY_USER` VALUES (1,1),(4,1),(7,1),(10,1),(13,1),(1,2),(2,2),(11,2),(13,2),(1,3),(3,3),(13,3),(14,3),(2,4),(3,4),(14,4),(2,5),(3,5),(5,5),(14,5),(16,5),(4,6),(6,6),(16,6),(5,7),(17,7),(3,8),(4,8),(6,8),(16,8),(17,8),(4,9),(5,9),(7,9),(17,9),(18,9),(5,10),(7,10),(9,10),(18,10),(6,11),(8,11),(10,11),(21,11);
/*!40000 ALTER TABLE `EVENTS_ATTEND_BY_USER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `FRIENDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRIENDS` (
  `user_id1` int NOT NULL,
  `user_id2` int NOT NULL,
  PRIMARY KEY (`user_id1`,`user_id2`),
  KEY `user_id2` (`user_id2`),
  CONSTRAINT `FRIENDS_ibfk_1` FOREIGN KEY (`user_id1`) REFERENCES `USER` (`user_id`),
  CONSTRAINT `FRIENDS_ibfk_2` FOREIGN KEY (`user_id2`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `FRIENDS` WRITE;
/*!40000 ALTER TABLE `FRIENDS` DISABLE KEYS */;
INSERT INTO `FRIENDS` VALUES (1,2),(1,3),(2,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(4,5),(1,6),(3,6),(4,6),(5,6),(3,7),(5,7),(6,7),(6,8),(7,9),(8,10),(9,10),(9,11),(10,12),(11,12),(13,14),(14,15),(15,16),(16,17);
/*!40000 ALTER TABLE `FRIENDS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP` (
  `group_id` int NOT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `group_description` text,
  `Timestamp` timestamp NULL DEFAULT NULL,
  `created_by_user_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `created_by_user_id` (`created_by_user_id`),
  CONSTRAINT `GROUP_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `GROUP` WRITE;
/*!40000 ALTER TABLE `GROUP` DISABLE KEYS */;
INSERT INTO `GROUP` VALUES (1,'Book Lovers','A group for people who love reading and discussing books.','2024-01-01 04:30:00',1),(2,'Travel Enthusiasts','Share your travel experiences and tips!','2024-01-02 07:00:00',2),(3,'Fitness Fanatics','For those passionate about fitness and healthy living.','2024-01-03 08:30:00',3),(4,'Foodies United','A place for food lovers to share recipes and reviews.','2024-01-04 03:45:00',4),(5,'Tech Talk','Discuss the latest in technology and gadgets.','2024-01-05 11:15:00',5),(6,'Music Lovers','For fans of all genres of music to share their favorites.','2024-01-06 03:00:00',6),(7,'Movie Buffs','A group for movie enthusiasts to discuss films and reviews.','2024-01-07 05:50:00',7),(8,'Nature Explorers','For those who love hiking and exploring the outdoors.','2024-01-08 12:20:00',8),(9,'Gaming Community','Connect with fellow gamers and share your experiences.','2024-01-09 13:30:00',9),(10,'Art & Craft Lovers','Share your art projects and craft ideas.','2024-01-10 09:40:00',10),(11,'Photography Enthusiasts','A group for photography lovers to share tips and photos.','2024-01-11 05:00:00',11),(12,'Pet Owners','A community for pet lovers to share stories and advice.','2024-01-12 08:30:00',12),(13,'DIY Projects','Share your do-it-yourself projects and get inspired!','2024-01-13 06:15:00',13),(14,'Mindfulness and Meditation','A space for sharing mindfulness practices and meditation techniques.','2024-01-14 03:30:00',14),(15,'Food Lovers','A group for people who love food and sharing recipes.','2024-11-29 09:55:05',1),(16,'Healthy Food Enthusiasts','Discussing healthy eating and recipes.','2024-11-29 09:55:05',2);
/*!40000 ALTER TABLE `GROUP` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `GROUP_MEMBERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_MEMBERS` (
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `GROUP_MEMBERS_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`),
  CONSTRAINT `GROUP_MEMBERS_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `GROUP` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `GROUP_MEMBERS` WRITE;
/*!40000 ALTER TABLE `GROUP_MEMBERS` DISABLE KEYS */;
INSERT INTO `GROUP_MEMBERS` VALUES (1,1),(2,1),(8,1),(13,1),(1,2),(3,2),(4,2),(9,2),(1,3),(2,3),(4,3),(10,3),(15,3),(3,4),(5,4),(11,4),(16,4),(2,5),(3,5),(4,5),(12,5),(1,6),(3,6),(5,6),(15,6),(18,6),(5,7),(6,7),(16,7),(19,7),(1,8),(6,8),(7,8),(18,8),(20,8),(2,9),(7,9),(8,9),(19,9),(3,10),(8,10),(9,10),(20,10),(1,11),(5,11),(9,11),(10,11),(2,12),(6,12),(10,12),(11,12),(3,13),(7,13),(11,13);
/*!40000 ALTER TABLE `GROUP_MEMBERS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `MEDIA_LINKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEDIA_LINKS` (
  `Media_link` varchar(255) NOT NULL,
  `Post_id` int DEFAULT NULL,
  PRIMARY KEY (`Media_link`),
  KEY `Post_id` (`Post_id`),
  CONSTRAINT `MEDIA_LINKS_ibfk_1` FOREIGN KEY (`Post_id`) REFERENCES `POST` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `MEDIA_LINKS` WRITE;
/*!40000 ALTER TABLE `MEDIA_LINKS` DISABLE KEYS */;
INSERT INTO `MEDIA_LINKS` VALUES ('http://example.com/media1.jpg',1),('http://example.com/media2.mp4',2),('http://example.com/media3.png',3),('http://example.com/media4.gif',4),('http://example.com/media5.jpg',5),('http://example.com/media6.mp4',6),('http://example.com/media7.png',7),('http://example.com/media8.gif',8),('http://example.com/media9.jpg',9),('http://example.com/media10.mp4',10),('http://example.com/media11.png',11),('http://example.com/media12.gif',12),('http://example.com/media13.jpg',13),('http://example.com/media14.mp4',14),('http://example.com/media15.png',15),('http://example.com/media16.gif',16),('http://example.com/media17.jpg',17),('http://example.com/media18.mp4',18),('http://example.com/media19.png',19),('http://example.com/media20.gif',20),('http://example.com/media21.jpg',21),('http://example.com/media22.mp4',22),('http://example.com/media23.png',23),('http://example.com/media24.gif',24),('http://example.com/media25.jpg',25),('http://example.com/media26.mp4',26),('http://example.com/media27.png',27),('http://example.com/media28.gif',28),('http://example.com/media29.jpg',29),('http://example.com/media30.mp4',30),('http://example.com/media31.png',31),('http://example.com/media32.gif',32);
/*!40000 ALTER TABLE `MEDIA_LINKS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MESSAGE` (
  `message_id` int NOT NULL,
  `Text` text,
  `Sender_id` int DEFAULT NULL,
  `Receiver_id` int DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `Sender_id` (`Sender_id`),
  KEY `Receiver_id` (`Receiver_id`),
  CONSTRAINT `MESSAGE_ibfk_1` FOREIGN KEY (`Sender_id`) REFERENCES `USER` (`user_id`),
  CONSTRAINT `MESSAGE_ibfk_2` FOREIGN KEY (`Receiver_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `MESSAGE` WRITE;
/*!40000 ALTER TABLE `MESSAGE` DISABLE KEYS */;
INSERT INTO `MESSAGE` VALUES (1,'Hey! How are you?',1,2),(2,'I am good, thanks! And you?',2,1),(3,'Did you finish the project?',3,4),(4,'Yes, I submitted it yesterday.',4,3),(5,'Let’s catch up this weekend!',5,6),(6,'Sounds great! What time?',6,5),(7,'Looking forward to the concert!',7,8),(8,'Me too! It’s going to be amazing.',8,7),(9,'Are we still on for the meeting tomorrow?',9,10),(10,'Yes, I’ll be there at 10 AM.',10,9),(11,'Can you send me the report?',11,12),(12,'Sure! I’ll send it over shortly.',12,11),(13,'What movie do you want to watch tonight?',13,14),(14,'How about the new action film?',14,13),(15,'I had a great time at the event!',15,16),(16,'Me too! Let’s go again next year.',16,15),(17,'Hey, how’s the project going?',1,3),(18,'Did you catch the game last night?',1,14),(19,'Let me know if you need any help.',1,10),(20,'Can’t wait for the concert!',4,8),(21,'How are you doing? It’s been a while.',4,2),(22,'Are you free this weekend?',4,6),(23,'Hey! Are you coming to the party?',2,7),(24,'I found an amazing restaurant we should try!',2,14),(25,'Can you send me the details for the meeting?',2,11),(26,'What time are we meeting tomorrow?',2,3),(27,'Just checking in! How have you been?',13,1),(28,'Did you finish that report I sent?',13,3),(29,'Let’s catch up soon!',13,6);
/*!40000 ALTER TABLE `MESSAGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `MESSAGE_SEEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MESSAGE_SEEN` (
  `id` int NOT NULL,
  `message_id` int DEFAULT NULL,
  `seenAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `MESSAGE_SEEN_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `MESSAGE` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `MESSAGE_SEEN` WRITE;
/*!40000 ALTER TABLE `MESSAGE_SEEN` DISABLE KEYS */;
INSERT INTO `MESSAGE_SEEN` VALUES (1,1,'2024-01-01 04:40:00'),(2,2,'2024-01-01 04:50:00'),(3,3,'2024-01-03 08:40:00'),(4,4,'2024-01-03 08:55:00'),(5,5,'2024-01-05 10:35:00'),(6,6,'2024-01-05 11:05:00'),(7,7,'2024-01-07 06:25:00'),(8,8,'2024-01-07 06:35:00'),(9,9,'2024-01-09 05:05:00'),(10,10,'2024-01-09 05:20:00'),(11,11,'2024-01-11 07:50:00'),(12,12,'2024-01-11 08:05:00'),(13,13,'2024-01-13 09:55:00'),(14,14,'2024-01-13 10:10:00'),(15,15,'2024-01-15 12:45:00'),(16,16,'2024-01-15 13:00:00');
/*!40000 ALTER TABLE `MESSAGE_SEEN` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `MESSAGE_SENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MESSAGE_SENT` (
  `id` int NOT NULL,
  `message_id` int DEFAULT NULL,
  `sented` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`),
  CONSTRAINT `MESSAGE_SENT_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `MESSAGE` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `MESSAGE_SENT` WRITE;
/*!40000 ALTER TABLE `MESSAGE_SENT` DISABLE KEYS */;
INSERT INTO `MESSAGE_SENT` VALUES (1,1,'2024-01-01 04:35:00'),(2,2,'2024-01-01 04:30:00'),(3,3,'2024-01-03 08:35:00'),(4,4,'2024-01-03 08:50:00'),(5,5,'2024-01-05 10:30:00'),(6,6,'2024-01-05 11:00:00'),(7,7,'2024-01-07 06:20:00'),(8,8,'2024-01-07 06:30:00'),(9,9,'2024-01-09 05:00:00'),(10,10,'2024-01-09 05:10:00'),(11,11,'2024-01-11 07:45:00'),(12,12,'2024-01-11 08:00:00'),(13,13,'2024-01-13 09:50:00'),(14,14,'2024-01-13 10:05:00'),(15,15,'2024-01-15 12:40:00'),(16,16,'2024-01-15 12:55:00');
/*!40000 ALTER TABLE `MESSAGE_SENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `PAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAGE` (
  `page_name` varchar(100) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT NULL,
  `created_by_user_id` int DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`page_name`),
  KEY `created_by_user_id` (`created_by_user_id`),
  CONSTRAINT `PAGE_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `PAGE` WRITE;
/*!40000 ALTER TABLE `PAGE` DISABLE KEYS */;
INSERT INTO `PAGE` VALUES ('Book Lovers Club','Books','2024-01-01 04:30:00',1,'A community for book enthusiasts.'),('DIY Crafts Corner','Arts & Crafts','2024-01-11 06:45:00',11,'Share and discover DIY projects.'),('Fitness Journey','Health & Fitness','2024-01-03 08:30:00',3,'Join us in our fitness adventures.'),('Gourmet Recipes','Food','2024-01-04 03:45:00',4,'Explore delicious recipes from around the world.'),('Mindfulness and Wellness','Health','2024-01-12 04:15:00',12,'Promoting mental health and wellness.'),('Movie Buffs Unite','Movies','2024-01-07 05:50:00',7,'Discuss and review your favorite films.'),('Music Vibes','Music','2024-01-06 03:00:00',6,'Share your favorite music and playlists.'),('Nature Explorers','Nature','2024-01-08 12:20:00',8,'Discover the beauty of nature together.'),('Pet Lovers Community','Pets','2024-01-10 08:30:00',10,'A place for pet owners to connect.'),('Photography Enthusiasts','Photography','2024-01-09 05:00:00',9,'Showcase your photography skills.'),('Tech Innovations','Technology','2024-01-05 11:15:00',5,'Stay updated with the latest tech trends.'),('Travel Diaries','Travel','2024-01-02 07:00:00',2,'Share your travel experiences and tips.');
/*!40000 ALTER TABLE `PAGE` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `PAGE_FOLLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAGE_FOLLOWS` (
  `Page_Name` varchar(100) NOT NULL,
  `Created_user_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`Page_Name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `PAGE_FOLLOWS_ibfk_1` FOREIGN KEY (`Page_Name`) REFERENCES `PAGE` (`page_name`),
  CONSTRAINT `PAGE_FOLLOWS_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `PAGE_FOLLOWS` WRITE;
/*!40000 ALTER TABLE `PAGE_FOLLOWS` DISABLE KEYS */;
INSERT INTO `PAGE_FOLLOWS` VALUES ('Book Lovers Club',1,1),('Book Lovers Club',1,8),('DIY Crafts Corner',11,1),('DIY Crafts Corner',11,14),('Fitness Journey',3,2),('Fitness Journey',3,10),('Fitness Journey',3,17),('Gourmet Recipes',4,2),('Gourmet Recipes',4,9),('Gourmet Recipes',4,20),('Mindfulness and Wellness',12,2),('Mindfulness and Wellness',12,15),('Movie Buffs Unite',7,3),('Movie Buffs Unite',7,13),('Music Vibes',6,4),('Nature Explorers',8,4),('Nature Explorers',8,16),('Pet Lovers Community',10,6),('Photography Enthusiasts',9,7),('Tech Innovations',5,5),('Tech Innovations',5,11),('Tech Innovations',5,17);
/*!40000 ALTER TABLE `PAGE_FOLLOWS` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POST` (
  `post_id` int NOT NULL,
  `text` text,
  `visibility` enum('Private','Friends-only','Public') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `posted_user_id` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `posted_user_id` (`posted_user_id`),
  CONSTRAINT `POST_ibfk_1` FOREIGN KEY (`posted_user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `POST` WRITE;
/*!40000 ALTER TABLE `POST` DISABLE KEYS */;
INSERT INTO `POST` VALUES (1,'Hello, this is my first post!','Public','2023-01-16 03:30:00','2024-01-16 04:00:00',1),(2,'Just had a great day at the park!','Private','2023-02-21 05:00:00','2024-11-29 10:11:54',2),(3,'Excited to share my new project with everyone!','Public','2023-03-12 05:45:00','2024-03-12 06:00:00',3),(4,'Feeling grateful for my friends and family.','Private','2023-04-26 07:15:00','2024-04-26 06:45:00',4),(5,'What a wonderful world we live in!','Public','2023-05-31 08:50:00','2024-05-31 09:20:00',5),(6,'Can anyone recommend a good book?','Friends-only','2023-06-16 10:30:00','2024-06-16 11:05:00',6),(7,'Just finished a marathon! So proud of myself.','Public','2023-07-23 13:00:00','2024-07-23 13:15:00',7),(8,'Looking forward to the weekend!','Public','2023-08-19 14:40:00','2024-08-19 14:55:00',8),(9,'Had an amazing dinner last night.','Friends-only','2023-09-06 02:20:00','2024-09-06 02:35:00',9),(10,'Can’t wait for the concert next week!','Public','2023-10-13 06:55:00','2024-10-13 07:45:00',10),(11,'What’s everyone up to today?','Private','2023-11-02 10:05:00','2024-11-02 10:55:00',11),(12,'Just got back from vacation! It was fantastic!','Public','2023-12-15 03:35:00','2024-12-15 04:35:00',12),(13,'Feeling inspired to create something new.','Friends-only','2024-01-03 05:45:00',NULL,13),(14,'Anyone interested in a game night this Friday?','Public','2024-01-04 08:15:00',NULL,14),(15,'Just adopted a puppy! So excited!','Public','2024-01-05 11:00:00',NULL,15),(16,'Trying out a new recipe today.','Private','2024-01-06 13:50:00',NULL,16),(17,'Happy to be back home after a long trip.','Friends-only','2024-01-07 15:40:00',NULL,17),(18,'Let’s catch up soon!','Public','2024-01-08 18:25:00',NULL,18),(19,'Just got my new camera!','Public','2023-12-16 04:30:00',NULL,1),(20,'Can’t wait for the weekend getaway!','Public','2023-12-17 06:00:00',NULL,1),(21,'Finally finished my project!','Public','2023-12-18 08:30:00',NULL,2),(22,'Had a great time at the beach!','Public','2023-12-19 09:45:00',NULL,3),(23,'Excited for the new year!','Public','2023-12-20 11:15:00',NULL,4),(24,'What’s everyone’s new year resolution?','Friends-only','2023-12-21 13:00:00',NULL,5),(25,'Just finished a great book!','Public','2023-12-22 13:30:00',NULL,6),(26,'Looking forward to the holiday party!','Public','2023-12-23 15:00:00',NULL,7),(27,'Just finished a great book on personal development!','Public','2024-01-04 04:30:00',NULL,12),(28,'Excited to share my thoughts on this new recipe!','Public','2024-01-05 06:00:00',NULL,12),(29,'Just finished reading an amazing novel!','Public','2024-01-06 06:45:00',NULL,7),(30,'Can anyone recommend similar books?','Public','2024-01-07 08:15:00',NULL,7),(31,'I love discussing book themes with friends!','Public','2024-01-08 09:00:00',NULL,7),(32,'Looking forward to the author’s next release!','Public','2024-01-09 09:30:00',NULL,7),(33,'This is a sample post text.','Public','2024-11-29 12:00:27','2024-11-29 12:00:27',1);
/*!40000 ALTER TABLE `POST` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `REACTS_TO_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REACTS_TO_COMMENT` (
  `user_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `reaction_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`comment_id`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `REACTS_TO_COMMENT_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `REACTS_TO_COMMENT_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `COMMENT` (`comment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `REACTS_TO_COMMENT` WRITE;
/*!40000 ALTER TABLE `REACTS_TO_COMMENT` DISABLE KEYS */;
INSERT INTO `REACTS_TO_COMMENT` VALUES (1,1,'Like'),(1,2,'Love'),(2,1,'Laughing'),(2,3,'Sad'),(3,2,'Angry'),(3,4,'Like'),(4,1,'Love'),(4,5,'Laughing'),(5,3,'Like'),(5,6,'Sad'),(6,7,'Angry'),(7,8,'Like'),(8,9,'Love'),(9,10,'Laughing'),(10,11,'Sad'),(11,12,'Angry'),(12,13,'Like'),(13,14,'Love'),(14,15,'Laughing');
/*!40000 ALTER TABLE `REACTS_TO_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `REACTS_TO_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REACTS_TO_POST` (
  `user_id` int NOT NULL,
  `post_id` int NOT NULL,
  `reaction_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `REACTS_TO_POST_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `REACTS_TO_POST_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `POST` (`post_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `REACTS_TO_POST` WRITE;
/*!40000 ALTER TABLE `REACTS_TO_POST` DISABLE KEYS */;
INSERT INTO `REACTS_TO_POST` VALUES (1,1,'Like'),(1,2,'Love'),(1,3,'Laughing'),(2,1,'Like'),(2,3,'Sad'),(3,1,'Angry'),(3,4,'Like'),(4,2,'Love'),(4,5,'Laughing'),(5,5,'Like'),(5,6,'Sad'),(6,6,'Angry'),(7,7,'Love'),(8,8,'Laughing'),(9,9,'Like'),(10,10,'Love'),(11,11,'Laughing'),(12,12,'Sad'),(13,13,'Angry'),(14,14,'Like'),(15,15,'Love'),(16,16,'Laughing'),(17,17,'Sad'),(18,18,'Angry'),(19,19,'Like'),(20,20,'Love');
/*!40000 ALTER TABLE `REACTS_TO_POST` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `REACTS_TO_REPLY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REACTS_TO_REPLY` (
  `user_id` int NOT NULL,
  `reply_id` int NOT NULL,
  `reaction_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`reply_id`),
  KEY `reply_id` (`reply_id`),
  CONSTRAINT `REACTS_TO_REPLY_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `REACTS_TO_REPLY_ibfk_2` FOREIGN KEY (`reply_id`) REFERENCES `REPLY` (`reply_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `REACTS_TO_REPLY` WRITE;
/*!40000 ALTER TABLE `REACTS_TO_REPLY` DISABLE KEYS */;
INSERT INTO `REACTS_TO_REPLY` VALUES (1,1,'Like'),(2,1,'Love'),(3,2,'Laughing'),(4,3,'Sad'),(5,4,'Angry'),(6,5,'Like'),(7,6,'Love'),(8,7,'Laughing'),(9,8,'Sad'),(10,9,'Angry'),(11,10,'Like'),(12,11,'Love'),(13,12,'Laughing'),(14,13,'Sad'),(15,14,'Angry'),(16,15,'Like'),(17,16,'Love');
/*!40000 ALTER TABLE `REACTS_TO_REPLY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `REPLY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPLY` (
  `reply_id` int NOT NULL,
  `message` text,
  `sent_at` timestamp NULL DEFAULT NULL,
  `seen_at` timestamp NULL DEFAULT NULL,
  `comment_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `comment_id` (`comment_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `REPLY_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `COMMENT` (`comment_id`),
  CONSTRAINT `REPLY_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `REPLY` WRITE;
/*!40000 ALTER TABLE `REPLY` DISABLE KEYS */;
INSERT INTO `REPLY` VALUES (1,'I completely agree with you!','2024-01-02 05:00:00','2024-01-02 05:30:00',1,3),(2,'Thanks for your feedback!','2024-01-02 05:45:00','2024-01-02 06:30:00',1,4),(3,'That sounds like a great idea!','2024-01-03 09:20:00','2024-01-03 10:00:00',2,5),(4,'I can’t wait to join!','2024-01-04 04:00:00','2024-01-04 04:45:00',3,6),(5,'So true! Let’s make it happen.','2024-01-05 05:15:00','2024-01-05 06:00:00',4,7),(6,'I loved that part too!','2024-01-06 06:30:00','2024-01-06 07:15:00',5,8),(7,'Congratulations! You did amazing!','2024-01-08 08:50:00','2024-01-08 09:40:00',7,9),(8,'Looking forward to it!','2024-01-14 16:00:00','2024-01-14 16:45:00',14,10),(9,'I totally agree with your point!','2024-01-05 09:30:00','2024-01-05 10:15:00',5,11),(10,'That’s a great suggestion!','2024-01-06 08:00:00','2024-01-06 08:45:00',6,12),(11,'Thanks for sharing your thoughts!','2024-01-07 03:30:00','2024-01-07 04:00:00',7,13),(12,'I can’t wait to see what you create!','2024-01-08 04:50:00','2024-01-08 05:20:00',8,14),(13,'Let’s definitely plan something soon!','2024-01-09 11:00:00','2024-01-09 11:45:00',9,15),(14,'Your insights are always valuable!','2024-01-10 06:40:00','2024-01-10 07:10:00',10,16),(15,'Excited to join the next event!','2024-01-11 13:15:00','2024-01-11 13:45:00',11,17),(16,'I love this idea! Count me in!','2024-01-12 09:25:00','2024-01-12 10:00:00',12,18),(17,'This is a reply from user 1 to comment 1.','2024-11-29 09:35:24',NULL,1,1),(18,'This is a reply from user 1 to comment 2.','2024-11-29 09:35:24',NULL,2,1);
/*!40000 ALTER TABLE `REPLY` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `user_id` int NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'john.doe@example.com','johnny','1990-01-15','Male','John','Michael','Doe','2023-01-15 02:30:00'),(2,'jane.smith@example.com','janesmith','1992-05-22','Female','Jane',NULL,'Smith','2023-02-20 04:00:00'),(3,'alex.jones@example.com','alexjones','1988-11-30','Other','Alex',NULL,'Jones','2023-03-10 04:45:00'),(4,'emily.brown@example.com','emilyb','1995-07-14','Female','Emily',NULL,'Brown','2023-04-25 06:15:00'),(5,'mike.wilson@example.com','mike_wilson','1985-03-10','Male','Mike',NULL,'Wilson','2023-05-30 08:50:00'),(6,'sarah.connor@example.com','sarahc','1993-09-05','Female','Sarah',NULL,'Connor','2023-06-15 10:30:00'),(7,'chris.evans@example.com','chrisevans','1980-12-30','Male','Chris',NULL,'Evans','2023-07-22 13:00:00'),(8,'taylor.swift@example.com','taylorswift','1989-12-13','Female','Taylor',NULL,'Swift','2023-08-18 14:40:00'),(9,'olivia.johnson@example.com','oliviaj','1991-04-25','Female','Olivia',NULL,'Johnson','2023-09-05 02:20:00'),(10,'noah.williams@example.com','noahw','1987-08-19','Male','Noah',NULL,'Williams','2023-10-12 06:55:00'),(11,'ava.brown@example.com','avab','1994-06-30','Female','Ava',NULL,'Brown','2023-11-01 10:05:00'),(12,'liam.miller@example.com','liamm','1986-02-14','Male','Liam',NULL,'Miller','2023-12-14 03:35:00'),(13,'sophia.davis@example.com','sophiad','1993-11-11','Female','Sophia',NULL,'Davis','2024-01-02 05:45:00'),(14,'jacob.garcia@example.com','jacobg','1989-03-05','Male','Jacob',NULL,'Garcia','2024-01-03 08:15:00'),(15,'isabella.martinez@example.com','isabellam','1990-12-01','Female','Isabella',NULL,'Martinez','2024-01-04 11:00:00'),(16,'mason.hernandez@example.com','masonh','1988-09-20','Male','Mason',NULL,'Hernandez','2024-01-05 13:50:00'),(17,'mia.lopez@example.com','mialopez','1992-10-15','Female','Mia',NULL,'Lopez','2024-01-06 15:40:00'),(18,'ethan.perez@example.com','ethanperez','1984-07-28','Male','Ethan',NULL,'Perez','2024-01-07 18:25:00'),(19,'arjun.sharma@example.com','arjuns','1990-01-15','Male','Arjun',NULL,'Sharma','2024-11-26 19:45:15'),(20,'priya.verma@example.com','priyav','1995-05-22','Female','Priya',NULL,'Verma','2024-11-26 19:45:15'),(21,'rahul.kumar@example.com','rahulk','1988-12-30','Male','Rahul',NULL,'Kumar','2024-11-26 19:45:15'),(22,'nikhilesh@example.com','nilkesh','2008-05-15','Other','T',NULL,'nikhilesh','2024-11-29 09:26:57'),(23,'3d@s','eh','2005-11-10','Male','egr','dsjkf','sdajkg','2024-11-29 12:37:20');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `USER_PHONE_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_PHONE_NUMBER` (
  `user_id` int NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`phone_number`),
  CONSTRAINT `USER_PHONE_NUMBER_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `USER_PHONE_NUMBER` WRITE;
/*!40000 ALTER TABLE `USER_PHONE_NUMBER` DISABLE KEYS */;
INSERT INTO `USER_PHONE_NUMBER` VALUES (1,'+1-202-555-0171'),(1,'+1-202-555-0180'),(2,'+1-202-555-0190'),(3,'+1-202-555-0200'),(4,'+1-202-555-0210'),(4,'+1-202-555-0220'),(5,'+1-202-555-0230'),(6,'+1-202-555-0240'),(7,'+1-202-555-0250'),(8,'+1-202-555-0260'),(9,'+1-202-555-0270'),(10,'+1-202-555-0280'),(11,'+1-202-555-0290'),(12,'+1-202-555-0300'),(13,'+1-202-555-0310'),(14,'+1-202-555-0320'),(15,'+1-202-555-0330'),(16,'+1-202-555-0340'),(17,'+1-202-555-0350'),(18,'+1-202-555-0360');
/*!40000 ALTER TABLE `USER_PHONE_NUMBER` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `VERIFIED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERIFIED_USER` (
  `Verified_At` timestamp NULL DEFAULT NULL,
  `Verification_method` varchar(50) DEFAULT NULL,
  `Verified_user_id` int NOT NULL,
  PRIMARY KEY (`Verified_user_id`),
  CONSTRAINT `VERIFIED_USER_ibfk_1` FOREIGN KEY (`Verified_user_id`) REFERENCES `USER` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
LOCK TABLES `VERIFIED_USER` WRITE;
/*!40000 ALTER TABLE `VERIFIED_USER` DISABLE KEYS */;
INSERT INTO `VERIFIED_USER` VALUES ('2023-01-15 04:30:00','Email',1),('2023-02-20 09:00:00','Phone',2),('2023-03-05 04:15:00','Email',3),('2023-04-12 05:45:00','Social Media',4),('2023-05-22 10:50:00','Email',5),('2023-06-30 03:20:00','Phone',6),('2023-07-18 07:35:00','Email',7),('2023-08-25 10:10:00','Social Media',8),('2023-09-10 12:00:00','Email',9),('2023-10-01 06:30:00','Phone',10),('2023-11-05 13:45:00','Email',11),('2023-12-01 05:00:00','Social Media',13),('2024-01-10 09:15:00','Phone',14),('2024-02-15 05:30:00','Email',15),('2024-03-20 04:00:00','Phone',16),('2024-04-25 08:30:00','Social Media',17),('2024-05-10 11:15:00','Email',18),('2024-06-05 07:00:00','Phone',21);
/*!40000 ALTER TABLE `VERIFIED_USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;