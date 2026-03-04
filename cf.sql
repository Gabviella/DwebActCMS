--
-- Database: `digitaldb`
-- This is a database used for managing digital products like apps, software, ebooks, etc.
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `title`, `summary`, `content`, `created`, `category_id`, `member_id`, `image_id`, `published`) VALUES
(1, 'CodeMaster Software', 'Advanced coding platform for developers', 'CodeMaster is a powerful coding tool designed for professional developers. It offers advanced features like real-time collaboration, syntax highlighting, debugging, and supports multiple programming languages.', '2023-01-26 12:21:03', 1, 2, 1, 1),
(2, 'Mindful Meditation App', 'Mobile app for guided meditation', 'This app offers a variety of guided meditation sessions to promote mental well-being. With customizable reminders, relaxing soundscapes, and progress tracking, it helps users stay focused on their mindfulness journey.', '2023-02-15 14:32:19', 2, 3, 2, 1),
(3, 'PixelPro Editor', 'Photo editing software for professionals', 'PixelPro is an intuitive yet powerful photo editing software designed for professionals. It includes advanced features like layer masking, AI-based enhancement, and support for high-resolution images.', '2023-03-05 11:25:10', 1, 4, 4, 1),
(4, 'Ebook Collection', 'A series of ebooks on digital marketing', 'This collection includes 10 ebooks focused on various aspects of digital marketing, including SEO, content strategy, and social media advertising. Perfect for anyone looking to expand their marketing knowledge in the digital space.', '2023-03-15 13:50:22', 4, 2, 5, 1),
(5, 'SmartHome App', 'App for controlling smart home devices', 'This app provides seamless integration with a variety of smart home devices, from lights to thermostats. It also offers features like voice control, scheduling, and energy consumption tracking.', '2023-03-22 17:01:30', 2, 3, 6, 1),
(6, 'Virtual Reality Game', 'Immersive VR experience for gamers', 'Explore a detailed virtual world in this action-packed VR game. With engaging gameplay, realistic environments, and multiplayer modes, it offers an unparalleled experience for VR enthusiasts.', '2023-04-05 19:12:40', 3, 7, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `navigation`) VALUES
(1, 'Software', 'Tools and applications for developers and designers', 1),
(2, 'Mobile Apps', 'Apps for health, productivity, and lifestyle', 1),
(3, 'Design Resources', 'Digital assets for creatives', 1),
(4, 'Ebooks', 'Digital books on various topics', 1);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `file`, `alt`) VALUES
(1, 'codemaster.png', 'Screenshot of CodeMaster Software'),
(2, 'mindful-app.jpg', 'Mindful Meditation App Interface'),
(3, 'pixelpro-editor.png', 'PixelPro Photo Editor Interface'),
(4, 'ebooks.jpeg', 'Collection of Digital Marketing Ebooks'),
(5, 'smarthome-app.png', 'SmartHome App Interface'),
(6, 'vr-game.jpeg', 'Virtual Reality Game in Action');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'Ivy', 'Stone', 'ivy@eg.link', 'c63j-82ve-2sv9-qlb38', '2023-01-26 12:04:23', 'ivy.jpg'),
(2, 'Luke', 'Wood', 'luke@eg.link', 'saq8-2f2k-3nv7-fa4k', '2023-02-02 11:14:45', NULL),
(3, 'Emiko', 'Ito', 'emi@eg.link', 'sk3r-vd92-3vn1-exm2', '2023-02-18 13:28:19', 'emi.jpg'),
(4, 'James', 'Walker', 'james@eg.link', 'dk3s-94vj-2ab4-wnz9', '2023-03-01 09:25:12', 'james.jpg'),
(5, 'Sophia', 'Li', 'sophia@eg.link', 'dfk2-34vc-9za0-qjx7', '2023-03-20 14:08:45', 'sophia.jpg'),
(6, 'Michael', 'Chen', 'michael@eg.link', 'kr5w-32va-1lw8-mzx9', '2023-03-25 17:18:10', 'michael.jpg');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `image_id` (`image_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `member