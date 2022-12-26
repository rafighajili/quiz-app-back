-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 26, 2022 at 12:29 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20063322_hwprojectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `isCorrect` float NOT NULL,
  `questionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `isCorrect`, `questionId`) VALUES
(53, 'Hyper Text Markup Language', 33.3333, 151),
(54, 'Hyperlinks and Text Markup Language', -33.3333, 151),
(55, 'Homepage Text Markup Language', -33.3333, 151),
(56, 'section', 16.6667, 152),
(57, 'aside', 16.6667, 152),
(58, 'nav', 16.6667, 152),
(59, 'div', -16.6667, 152),
(60, 'page', -16.6667, 152),
(61, 'sidebar', -16.6667, 152),
(62, 'True', 100, 153),
(63, 'False', 0, 153),
(64, 'I agree', 0, 154),
(65, 'I do not agree', 100, 154),
(66, 'Suggest a text tooltip for this image, when mouse is moving over.', 0, 155),
(67, 'Propose a text that will be displayed instead of the image if the browser does not a', 100, 155),
(68, '40', 100, 156),
(69, 'bd', 100, 157);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `feedback` text COLLATE utf8_unicode_ci NOT NULL,
  `mark` float NOT NULL,
  `typeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `feedback`, `mark`, `typeId`) VALUES
(151, 'What does HTML stand for?', 'HTML (HyperText Markup Language) is the code that is used to structure a web page and its content.', 1, 1),
(152, 'Which, among the following elements, is (are) new HTML5 semantic layout markup?', 'A lot of new elements are added in HTML5, mainly to organize your content.', 1, 1),
(153, 'To create a web document, we use first semantic content markup for the content, then we use semantic layout markup to organize our content.', 'Semantic HTML elements are those that clearly describe their meaning, firstly for the content, sec', 1, 2),
(154, 'It is best to include a header and a footer only in the web page, the body element, and not in an article or section.', 'HTML5 header and footer can be include in the body, but also in the article or section elements fo', 1, 2),
(155, 'The alt attribute of an image is mainly used to :', 'For accessibility reason, to take into account, for instance, reading in Braille.', 1, 3),
(156, 'To move two elements, main and aside, side by side in a parent div container, using the CSS property display with the value inline-block, if for the main element a width of 60% is set, what should be the width, in %, for the aside element, in order to fill the whole available width?', 'The sum of the width of the main element and the aside element must be less than or equal to the w', 1, 4),
(157, 'Which statements are correct?\r\n\r\nWrite the sequence of letters (in lowercase) corresponding to the correct statements in ascending alphabetical order.\r\n\r\nExample: acd or bc, but not cb!\r\n\r\nYour character string will be compared to the correct character string expected, to earn the point, or not.\r\n\r\n[a] CSS must be declared preferably in each element for easier maintenance\r\n[b] For positioning two elements side by side, inline-block for the display property can be used\r\n[c] Grid is a 1 dimensional layout\r\n[d] Units which can be used for the grid-template are px, % or fr', ' CSS are preferably declared in an external file. The CSS Grid is a 2 dimensional layout.', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'Multiple choice'),
(2, 'True/False'),
(3, 'Double choice'),
(4, 'Numerical'),
(5, 'Short answer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionId` (`questionId`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `typeId` (`typeId`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
