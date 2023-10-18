/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(255) NOT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `account` int NOT NULL,
  `code` varchar(255) NOT NULL,
  `arr_sub_id` varchar(255) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) NOT NULL,
  `sub_price` float NOT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Cheeseburger', 'cheeseburger.jpg', 10.99, 'Delicious cheeseburger with all the fixings.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Margherita Pizza', 'margherita_pizza.jpg', 12.99, 'Classic Margherita pizza with fresh tomatoes and basil.', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Caesar Salad', 'caesar_salad.jpg', 8.99, 'Fresh Caesar salad with grilled chicken.', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Turkey Sandwich', 'turkey_sandwich.jpg', 7.99, 'Turkey sandwich with lettuce, tomato, and mayo.', 4),
(5, 'Spaghetti Bolognese', 'spaghetti_bolognese.jpg', 9.99, 'Spaghetti with a rich Bolognese sauce.', 5),
(6, 'Sushi Platter', 'sushi_platter.jpg', 14.99, 'Assorted sushi rolls and sashimi.', 6),
(7, 'Chocolate Cake', 'chocolate_cake.jpg', 6.99, 'Decadent chocolate cake with frosting.', 7),
(8, 'Soda', 'soda.jpg', 1.99, 'Refreshing carbonated beverage.', 8),
(9, 'Grilled Salmon', 'grilled_salmon.jpg', 15.99, 'Grilled salmon with steamed vegetables.', 9),
(10, 'Tacos', 'tacos.jpg', 8.99, 'Mexican tacos with various fillings.', 10);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Burger');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Pizza');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Salad');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Sandwich'),
(5, 'Pasta'),
(6, 'Sushi'),
(7, 'Dessert'),
(8, 'Drink'),
(9, 'Seafood'),
(10, 'Mexican');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2023-10-06 10:30:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 2, '2023-10-06 15:10:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 2, '2023-10-06 11:45:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 3, '2023-10-06 16:30:00'),
(3, 3, '2023-10-06 12:20:00'),
(3, 4, '2023-10-06 17:45:00'),
(4, 4, '2023-10-06 13:15:00'),
(4, 5, '2023-10-06 18:20:00'),
(5, 1, '2023-10-06 19:00:00'),
(5, 5, '2023-10-06 14:00:00');

INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `account`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 1000, 'ORDER123', 'ARRSUBID001');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `account`, `code`, `arr_sub_id`) VALUES
(2, 2, 3, 1500, 'ORDER456', 'ARRSUBID002');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `account`, `code`, `arr_sub_id`) VALUES
(3, 3, 2, 1200, 'ORDER789', 'ARRSUBID003');
INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `account`, `code`, `arr_sub_id`) VALUES
(4, 1, 4, 1800, 'ORDER321', 'ARRSUBID004'),
(5, 4, 5, 2000, 'ORDER555', 'ARRSUBID005'),
(6, 5, 6, 1400, 'ORDER777', 'ARRSUBID006'),
(7, 6, 1, 900, 'ORDER888', 'ARRSUBID007'),
(8, 2, 4, 1700, 'ORDER999', 'ARRSUBID008'),
(9, 3, 6, 1100, 'ORDER000', 'ARRSUBID009'),
(10, 4, 3, 1600, 'ORDER111', 'ARRSUBID010'),
(11, 1, 10, 3555, 'ORDER345', 'ARRSUBID014');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2023-10-06 10:30:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, 4, '2023-10-06 15:10:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 3, 3, '2023-10-18 09:44:12');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 4, '2023-10-06 11:45:00'),
(2, 3, 5, '2023-10-06 16:30:00'),
(3, 3, 3, '2023-10-06 12:20:00'),
(3, 4, 3, '2023-10-06 17:45:00'),
(4, 4, 5, '2023-10-06 13:15:00'),
(4, 5, 4, '2023-10-06 18:20:00'),
(5, 1, 5, '2023-10-06 19:00:00'),
(5, 5, 2, '2023-10-06 14:00:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Restaurant A', 'image_path_a.jpg', 'A cozy restaurant serving delicious food.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(2, 'Restaurant B', 'image_path_b.jpg', 'A popular restaurant with a variety of cuisines.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(3, 'Restaurant C', 'image_path_c.jpg', 'A fine dining restaurant known for its gourmet meals.');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(4, 'Restaurant D', 'image_path_d.jpg', 'A family-friendly restaurant offering great ambiance.'),
(5, 'Restaurant E', 'image_path_e.jpg', 'A casual dining restaurant perfect for gatherings.'),
(6, 'Restaurant F', 'image_path_f.jpg', 'A vegetarian restaurant with a focus on healthy options.'),
(7, 'Restaurant G', 'image_path_g.jpg', 'A seafood restaurant known for its fresh catches.'),
(8, 'Restaurant H', 'image_path_h.jpg', 'A fusion restaurant blending different culinary styles.'),
(9, 'Restaurant I', 'image_path_i.jpg', 'A dessert cafe specializing in sweet treats.'),
(10, 'Restaurant J', 'image_path_j.jpg', 'A sports bar and restaurant for sports enthusiasts.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 1.5, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Bacon', 2, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Extra Cheese', 1, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Pepperoni', 1.5, 2),
(5, 'Grilled Shrimp', 2.5, 3),
(6, 'Avocado', 1.5, 3),
(7, 'Bacon', 1, 4),
(8, 'Avocado', 1.5, 4);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'jane.smith@example.com', 'securepass');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Michael Johnson', 'michael.johnson@example.com', 'mikepass');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Sarah Davis', 'sarah.davis@example.com', 'password456'),
(5, 'Robert Brown', 'robert.brown@example.com', 'pass123word'),
(6, 'Emily Johnson', 'emily.johnson@example.com', 'mysecurepassword'),
(7, 'Chris Evans', 'chris.evans@example.com', 'superpass123'),
(8, 'Jessica Parker', 'jessica.parker@example.com', 'password789'),
(9, 'Matthew Thompson', 'matthew.thompson@example.com', 'mypass456'),
(10, 'Amanda Williams', 'amanda.williams@example.com', 'pass321word');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;