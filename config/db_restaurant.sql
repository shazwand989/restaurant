CREATE TABLE IF NOT EXISTS `states` (
    `state_id` int(11) NOT NULL AUTO_INCREMENT,
    `state_name` varchar(255) NOT NULL,
    PRIMARY KEY (`state_id`)
);

INSERT
    IGNORE INTO `states` (`state_id`, `state_name`)
VALUES
    (1, 'Johor'),
    (2, 'Kedah'),
    (3, 'Kelantan'),
    (4, 'Kuala Lumpur'),
    (5, 'Labuan'),
    (6, 'Melaka'),
    (7, 'Negeri Sembilan'),
    (8, 'Pahang'),
    (9, 'Perak'),
    (10, 'Perlis'),
    (11, 'Pulau Pinang'),
    (12, 'Putrajaya'),
    (13, 'Sabah'),
    (14, 'Sarawak'),
    (15, 'Selangor'),
    (16, 'Terengganu');

-- users
CREATE TABLE IF NOT EXISTS `users` (
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_name` varchar(255) NOT NULL,
    `user_email` varchar(255) NOT NULL,
    `user_password` varchar(255) NOT NULL,
    `user_role` enum('admin', 'staff') NOT NULL DEFAULT 'staff',
    `user_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `user_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `user_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
);

INSERT
    IGNORE INTO `users` (
        `user_id`,
        `user_name`,
        `user_email`,
        `user_password`,
        `user_role`
    )
VALUES
    (
        1,
        'Ashikin Azman',
        'ashikinazman138@gmail.com',
        '$2y$10$wDYhoNaQwAd5GzRYjbjx4OQdrJkc8uP41d/ijeiqhCQIsUp5KdjTi',
        'admin'
    );

CREATE TABLE IF NOT EXISTS `forgot_password` (
    `forgot_password_id` int(11) NOT NULL AUTO_INCREMENT,
    `forgot_password_token` varchar(255) NOT NULL,
    `forgot_password_email` varchar(255) NOT NULL,
    `forgot_password_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `forgot_password_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `forgot_password_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`forgot_password_id`)
);

CREATE TABLE IF NOT EXISTS `restaurant` (
    `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
    `restaurant_name` varchar(255) NOT NULL,
    `restaurant_address` varchar(255) NOT NULL,
    `restaurant_city` varchar(255) NOT NULL,
    `restaurant_state_id` int(11) NOT NULL,
    `restaurant_postcode` varchar(255) NOT NULL,
    `restaurant_phone` varchar(255) NOT NULL,
    `restaurant_email` varchar(255) NOT NULL,
    `restaurant_website` varchar(255) NULL,
    `restaurant_description` text NULL,
    `restaurant_image` varchar(255) NULL,
    `restaurant_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `restaurant_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`restaurant_state_id`) REFERENCES `states` (`state_id`)
);

INSERT
    IGNORE INTO `restaurant` (
        `restaurant_id`,
        `restaurant_name`,
        `restaurant_address`,
        `restaurant_city`,
        `restaurant_state_id`,
        `restaurant_postcode`,
        `restaurant_phone`,
        `restaurant_email`,
    )
VALUES
    (
        1,
        'Restaurant A',
        'Address A',
        'City A',
        1,
        '12345',
        '123456789',
        'restaurant@example.com'
    );

CREATE TABLE IF NOT EXISTS `categories` (
    `category_id` int(11) NOT NULL AUTO_INCREMENT,
    `category_name` varchar(255) NOT NULL,
    `category_description` text NULL,
    `category_image` varchar(255) NULL,
    `category_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `category_restaurant_id` int(11) NOT NULL,
    `category_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `category_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`category_id`)
);

INSERT
    IGNORE INTO `categories` (
        `category_id`,
        `category_name`,
        `category_restaurant_id`
    )
VALUES
    (1, 'Foods', 1),
    (2, 'Drinks', 1);

-- Category Sub
CREATE TABLE IF NOT EXISTS `category_sub` (
    `category_sub_id` int(11) NOT NULL AUTO_INCREMENT,
    `category_sub_name` varchar(255) NOT NULL,
    `category_sub_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `category_sub_category_id` int(11) NOT NULL,
    `category_sub_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `category_sub_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`category_sub_id`),
    FOREIGN KEY (`category_sub_category_id`) REFERENCES `categories` (`category_id`)
);

INSERT
    IGNORE INTO `category_sub` (
        `category_sub_id`,
        `category_sub_name`,
        `category_sub_category_id`
    )
VALUES
    (1, 'Rice', 1),
    (2, 'Tom Yam', 1),
    (3, 'Chop', 1),
    (4, 'Bread', 1),
    (5, 'Kuey Teow', 1),
    (6, 'Mee', 1),
    (7, 'Maggi (Fried)', 1);

-- menu
CREATE TABLE IF NOT EXISTS `menu` (
    `menu_id` int(11) NOT NULL AUTO_INCREMENT,
    `menu_name` varchar(255) NOT NULL,
    `menu_description` text NULL,
    `menu_price` decimal(10, 2) NOT NULL,
    `menu_image` varchar(255) NULL,
    `menu_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `menu_category_sub_id` int(11) NOT NULL,
    `menu_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `menu_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`menu_id`),
    FOREIGN KEY (`menu_category_sub_id`) REFERENCES `category_sub` (`category_sub_id`)
);

INSERT
    IGNORE INTO `menu` (
        `menu_id`,
        `menu_name`,
        `menu_price`,
        `menu_category_sub_id`
    )
VALUES
    (1, 'Nasi Goreng', 5.00, 1),
    (2, 'Nasi Ayam', 6.00, 1),
    (3, 'Nasi Lemak', 4.00, 1),
    (4, 'Nasi Kandar', 7.00, 1),
    (5, 'Nasi Tomato', 5.00, 1),
    (6, 'Nasi Minyak', 6.00, 1),
    (7, 'Nasi Hujan Panas', 4.00, 1),
    (8, 'Nasi Kuning', 7.00, 1),
    (9, 'Nasi Dagang', 5.00, 1),
    (10, 'Nasi Kerabu', 6.00, 1),
    (11, 'Nasi Goreng Kampung', 4.00, 1),
    (12, 'Nasi Goreng Pattaya', 7.00, 1),
    (13, 'Nasi Goreng USA', 5.00, 1),
    (14, 'Nasi Goreng Daging', 6.00, 1),
    (15, 'Nasi Goreng Ayam', 4.00, 1),
    (16, 'Nasi Goreng Udang', 7.00, 1),
    (17, 'Nasi Goreng Ikan Bilis', 5.00, 1),
    (18, 'Nasi Goreng Cina', 6.00, 1),
    (19, 'Nasi Goreng Mamak', 4.00, 1);

-- MENU SUB
CREATE TABLE IF NOT EXISTS `menu_sub` (
    `menu_sub_id` int(11) NOT NULL AUTO_INCREMENT,
    `menu_sub_name` varchar(255) NOT NULL,
    `menu_sub_price` decimal(10, 2) NOT NULL,
    `menu_sub_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `menu_sub_menu_id` int(11) NOT NULL,
    `menu_sub_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `menu_sub_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`menu_sub_id`)
);

INSERT
    IGNORE INTO `menu_sub` (
        `menu_sub_id`,
        `menu_sub_name`,
        `menu_sub_price`,
        `menu_sub_menu_id`
    )
VALUES
    (1, 'Telur Mata', 1.00, 1),
    (2, 'Ayam Goreng', 5.00, 1);

CREATE TABLE IF NOT EXISTS `orders` (
    `order_id` int(11) NOT NULL AUTO_INCREMENT,
    `order_no` varchar(255) NOT NULL,
    `order_total` decimal(10, 2) NOT NULL,
    `order_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `order_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `order_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`order_id`)
);

CREATE TABLE IF NOT EXISTS `order_details` (
    `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
    `order_detail_quantity` int(11) NOT NULL,
    `order_detail_price` decimal(10, 2) NOT NULL,
    `order_detail_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `order_detail_order_id` int(11) NOT NULL,
    `order_detail_menu_id` int(11) NOT NULL,
    `order_detail_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `order_detail_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`order_detail_id`),
    FOREIGN KEY (`order_detail_order_id`) REFERENCES `orders` (`order_id`),
    FOREIGN KEY (`order_detail_menu_id`) REFERENCES `menu` (`menu_id`)
);

CREATE TABLE IF NOT EXISTS `order_detail_sub` (
    `order_detail_sub_id` int(11) NOT NULL AUTO_INCREMENT,
    `order_detail_sub_quantity` int(11) NOT NULL,
    `order_detail_sub_price` decimal(10, 2) NOT NULL,
    `order_detail_sub_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Inactive, 1=Active',
    `order_detail_sub_order_detail_id` int(11) NOT NULL,
    `order_detail_sub_menu_sub_id` int(11) NOT NULL,
    `order_detail_sub_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `order_detail_sub_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`order_detail_sub_id`),
    FOREIGN KEY (`order_detail_sub_order_detail_id`) REFERENCES `order_details` (`order_detail_id`),
    FOREIGN KEY (`order_detail_sub_menu_sub_id`) REFERENCES `menu_sub` (`menu_sub_id`)
);