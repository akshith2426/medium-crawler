-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2021 at 07:29 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medium-crawler`
--

-- --------------------------------------------------------

--
-- Table structure for table `postdetails`
--

CREATE TABLE `postdetails` (
  `postID` int(11) NOT NULL,
  `postTitle` varchar(255) NOT NULL,
  `postAuthor` varchar(255) NOT NULL,
  `postResponses` varchar(255) NOT NULL,
  `postLinkID` varchar(255) NOT NULL,
  `postDate` varchar(255) NOT NULL,
  `postLink` varchar(255) NOT NULL,
  `postReadingTime` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postdetails`
--

INSERT INTO `postdetails` (`postID`, `postTitle`, `postAuthor`, `postResponses`, `postLinkID`, `postDate`, `postLink`, `postReadingTime`, `userID`) VALUES
(1, 'I spent 3 months applying to jobs after a coding bootcamp. Here’s what I learned.', 'Felix Feng', '325 responses', '9a07468d2331', 'Nov 19, 2016', 'https://medium.com/free-code-camp/5-key-learnings-from-the-post-bootcamp-job-search-9a07468d2331?source=search_post---------0', '6 min read', 1),
(2, 'Tools I wish I had known about when I started coding', 'Mario Hoyos', '77 responses', '57849efd9248', 'Feb 16, 2018', 'https://medium.com/free-code-camp/tools-i-wish-i-had-known-about-when-i-started-coding-57849efd9248?source=search_post---------1', '6 min read', 1),
(3, 'How I went from zero coding skills to data scientist in 6 months', 'Kate Marie Lewis', '87 responses', 'c2207b65f2f3', 'Jan 24, 2020', 'https://towardsdatascience.com/how-i-went-from-zero-coding-skills-to-data-scientist-in-6-months-c2207b65f2f3?source=search_post---------2', '8 min read', 1),
(4, 'Sex, Beer, and Coding: Inside Facebook’s Wild Early Days in Palo Alto', 'WIRED', '69 responses', '7b447c143d52', 'Jul 30, 2018', 'https://medium.com/@WIRED/sex-beer-and-coding-inside-facebooks-wild-early-days-in-palo-alto-7b447c143d52?source=search_post---------3', '37 min read', 1),
(5, '', 'David Byttow', '65 responses', 'd5f8051afce2', 'May 21, 2013', 'https://medium.com/always-be-coding/abc-always-be-coding-d5f8051afce2?source=search_post---------4', '6 min read', 1),
(6, 'The 10 Best Coding Challenge Websites for 2018', 'Daniel Borowski', '48 responses', '12b57645b654', 'Jan 6, 2018', 'https://medium.com/coderbyte/the-10-best-coding-challenge-websites-for-2018-12b57645b654?source=search_post---------5', '5 min read', 1),
(7, 'The top data structures you should know for your next coding interview', 'Fahim ul Haq', '48 responses', '36af0831f5e3', 'Jul 30, 2018', 'https://medium.com/free-code-camp/the-top-data-structures-you-should-know-for-your-next-coding-interview-36af0831f5e3?source=search_post---------6', '9 min read', 1),
(8, 'Here are some app ideas you can build to level up your coding skills', 'Florin Pop', '28 responses', '39618291f672', 'Apr 4, 2019', 'https://medium.com/free-code-camp/here-are-some-app-ideas-you-can-build-to-level-up-your-coding-skills-39618291f672?source=search_post---------7', '17 min read', 1),
(9, 'Why Senior Engineers Hate Coding Interviews', 'Adam Storm', '142 responses', 'd583d2855757', 'Dec 1, 2020', 'https://medium.com/swlh/why-senior-engineers-hate-coding-interviews-d583d2855757?source=search_post---------8', '6 min read', 1),
(10, 'The 30-minute guide to rocking your next coding interview', 'Yangshun Tay', '53 responses', '5e048933b82b', 'Sep 21, 2017', 'https://medium.com/free-code-camp/coding-interviews-for-dummies-5e048933b82b?source=search_post---------9', '29 min read', 1),
(11, 'Top JavaScript VSCode Extensions for Faster Development ????', 'Arfat Salman', '86 responses', 'c687c39596f5', 'Mar 23, 2018', 'https://codeburst.io/top-javascript-vscode-extensions-for-faster-development-c687c39596f5?source=search_post---------0', '7 min read', 1),
(12, 'What 2 Years of Android Development Have Taught Me the Hard Way', 'Aritra Roy', '286 responses', '52b495ba5c51', 'Aug 31, 2016', 'https://blog.aritraroy.in/what-my-2-years-of-android-development-have-taught-me-the-hard-way-52b495ba5c51?source=search_post---------1', '13 min read', 1),
(13, 'Web development explained to a time traveler from ten years ago', 'Ivan Zarea', '90 responses', '600fad81170d', 'Oct 16, 2017', 'https://medium.com/free-code-camp/web-development-explained-to-a-time-traveler-from-ten-years-ago-600fad81170d?source=search_post---------2', '10 min read', 1),
(14, 'The Ultimate Guide to Learning Full Stack Web Development in 6 months, for $30', 'Brandon Morelli', '81 responses', '72b3854a7458', 'Oct 16, 2017', 'https://codeburst.io/the-ultimate-guide-to-learning-full-stack-web-development-in-6-months-for-30-72b3854a7458?source=search_post---------3', '7 min read', 1),
(15, '20+ Awesome Open-Source Android Apps To Boost Your Development Skills', 'Aritra Roy', '141 responses', 'b62832cf0fa4', 'Jan 21, 2017', 'https://blog.aritraroy.in/20-awesome-open-source-android-apps-to-boost-your-development-skills-b62832cf0fa4?source=search_post---------4', '10 min read', 1),
(16, 'Hype Driven Development', 'Marek Kirejczyk', '115 responses', '3469fc2e9b22', 'Nov 23, 2016', 'https://blog.daftcode.pl/hype-driven-development-3469fc2e9b22?source=search_post---------5', '9 min read', 1),
(17, 'How to get HTTPS working on your local development environment in 5 minutes', 'Daksh Shah', '130 responses', '7af615770eec', 'Jan 19, 2018', 'https://medium.com/free-code-camp/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec?source=search_post---------6', '5 min read', 1),
(18, 'Our large team of engineers use this front end development guide', 'Yangshun Tay', '53 responses', '484d4033cc41', 'Jun 13, 2017', 'https://medium.com/free-code-camp/grabs-front-end-guide-for-large-teams-484d4033cc41?source=search_post---------7', '26 min read', 1),
(19, 'Yes, React is taking over front-end development. The question is why.', 'Samer Buna', '96 responses', '40837af8ab76', 'Mar 30, 2017', 'https://medium.com/edge-coders/yes-react-is-taking-over-front-end-development-the-question-is-why-40837af8ab76?source=search_post---------8', '14 min read', 1),
(20, 'Goodbye, Object Oriented Programming', 'Charles Scalfani', '1,201 responses', 'a59cda4c0e53', 'Jul 23, 2016', 'https://medium.com/@cscalfani/goodbye-object-oriented-programming-a59cda4c0e53?source=search_post---------0', '10 min read', 2),
(21, 'Which programming language should you learn first? ʇdıɹɔsɐʌɐɾ :ɹǝʍsuɐ', 'Quincy Larson', '234 responses', '19a33b0a467d', 'Nov 2, 2016', 'https://medium.com/free-code-camp/what-programming-language-should-i-learn-first-%CA%87d%C4%B1%C9%B9%C9%94s%C9%90%CA%8C%C9%90%C9%BE-%C9%B9%C7%9D%CA%8Dsu%C9%90-19a33b0a467d?source=search_post---------1', '10 min read', 2),
(22, '‘The Art of Computer Programming’ by Donald Knuth', 'Carl Tashian', '198 responses', '82e275c8764f', 'Apr 22, 2016', 'https://medium.com/@tashian/the-art-of-computer-programming-by-donald-knuth-82e275c8764f?source=search_post---------2', '5 min read', 2),
(23, 'How I went from programming with a Nokia feature phone to working for an MIT Startup', 'Elvis Chidera', '199 responses', '40ca3be4fa0f', 'Dec 15, 2017', 'https://medium.com/free-code-camp/how-i-went-from-programming-with-a-feature-phone-to-working-for-an-mit-startup-40ca3be4fa0f?source=search_post---------3', '10 min read', 2),
(24, '10 Signs You Will Suck at Programming', 'Jonathan Bluks', '157 responses', '5497a6a52c5c', 'Jan 27, 2019', 'https://blog.usejournal.com/10-signs-you-will-suck-at-programming-5497a6a52c5c?source=search_post---------4', '13 min read', 2),
(25, 'Here are the best programming languages to learn in 2018', 'Alexander Petkov', '101 responses', 'bfc93e615b35', 'Jan 16, 2018', 'https://medium.com/free-code-camp/best-programming-languages-to-learn-in-2018-ultimate-guide-bfc93e615b35?source=search_post---------5', '10 min read', 2),
(26, 'Master the JavaScript Interview: What is Functional Programming?', 'Eric Elliott', '60 responses', '7f218c68b3a0', 'Jan 3, 2017', 'https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0?source=search_post---------6', '11 min read', 2),
(27, 'Why Python is not the programming language of the future', 'Rhea Moutafis', '166 responses', '30ddc5339b66', 'Mar 31, 2020', 'https://towardsdatascience.com/why-python-is-not-the-programming-language-of-the-future-30ddc5339b66?source=search_post---------7', '7 min read', 2),
(28, 'How to prepare for competitive programming ?', 'Andrei Margeloiu', '50 responses', '396d557e0c12', 'Sep 16, 2016', 'https://medium.com/@andreimargeloiu/how-to-prepare-for-competitive-programming-396d557e0c12?source=search_post---------8', '8 min read', 2),
(29, 'Warning: Your programming career', 'Vardan Grigoryan (vardanator)', '75 responses', 'b9579b3a878b', 'May 12, 2018', 'https://medium.com/sololearn/warning-your-programming-career-b9579b3a878b?source=search_post---------9', '11 min read', 2);

-- --------------------------------------------------------

--
-- Table structure for table `relatedtags`
--

CREATE TABLE `relatedtags` (
  `searchedTagName` varchar(255) NOT NULL,
  `relatedTagName` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  `rID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relatedtags`
--

INSERT INTO `relatedtags` (`searchedTagName`, `relatedTagName`, `userID`, `rID`) VALUES
('machine', 'Machine Learning', 1, 1),
('machine', 'Artificial Intelligence', 1, 2),
('machine', 'Technology', 1, 3),
('machine', 'Reusable', 1, 4),
('machine', 'Manufacturing', 1, 5),
('machine', 'Machinery', 1, 6),
('machine', 'Market Research Reports', 1, 7),
('machine', 'AI', 1, 8),
('machine', 'Manufacturers', 1, 9),
('programming', 'Software Development', 1, 10),
('programming', 'Python', 1, 11),
('programming', 'Data Science', 1, 12),
('programming', 'JavaScript', 1, 13),
('programming', 'Technology', 1, 14),
('programming', 'Web Development', 1, 15),
('programming', 'Coding', 1, 16),
('programming', 'Software Engineering', 1, 17),
('programming', 'Machine Learning', 1, 18),
('web', 'Web Development', 1, 19),
('web', 'Web Design', 1, 20),
('web', 'Website', 1, 21),
('web', 'JavaScript', 1, 22),
('web', 'Design', 1, 23),
('web', 'Internet', 1, 24),
('web', 'SEO', 1, 25),
('web', 'Google', 1, 26),
('web', 'Programming', 1, 27),
('python', 'Data Science', 1, 28),
('python', 'Programming', 1, 29),
('python', 'Machine Learning', 1, 30),
('python', 'Artificial Intelligence', 1, 31),
('python', 'Coding', 1, 32),
('python', 'Python Programming', 1, 33),
('python', 'Python3', 1, 34),
('python', 'Django', 1, 35),
('python', 'Software Development', 1, 36),
('app', 'Android', 1, 37),
('app', 'Mobile', 1, 38),
('app', 'Startup', 1, 39),
('app', 'Technology', 1, 40),
('app', 'iOS', 1, 41),
('app', 'Tech', 1, 42),
('app', 'Productivity', 1, 43),
('app', 'Apple', 1, 44),
('app', 'Design', 1, 45),
('java', 'Programming', 1, 46),
('java', 'Spring Boot', 1, 47),
('java', 'Android', 1, 48),
('java', 'Software Development', 1, 49),
('java', 'Coding', 1, 50),
('java', 'Spring', 1, 51),
('java', 'Kotlin', 1, 52),
('java', 'JavaScript', 1, 53),
('java', 'Java8', 1, 54),
('java', 'Programming', 1, 55),
('java', 'Spring Boot', 1, 56),
('java', 'Android', 1, 57),
('java', 'Software Development', 1, 58),
('java', 'Coding', 1, 59),
('java', 'Spring', 1, 60),
('java', 'Kotlin', 1, 61),
('java', 'JavaScript', 1, 62),
('java', 'Java8', 1, 63),
('coding', 'Programming', 1, 64),
('coding', 'Web Development', 1, 65),
('coding', 'JavaScript', 1, 66),
('coding', 'Software Development', 1, 67),
('coding', 'Python', 1, 68),
('coding', 'Technology', 1, 69),
('coding', 'Education', 1, 70),
('coding', 'Tech', 1, 71),
('coding', 'Codingbootcamp', 1, 72),
('development', 'Programming', 1, 73),
('development', 'Blockchain', 1, 74),
('development', 'JavaScript', 1, 75),
('development', 'Web Development', 1, 76),
('development', 'Software Development', 1, 77),
('development', 'Technology', 1, 78),
('development', 'Design', 1, 79),
('development', 'Coding', 1, 80),
('development', 'Developer', 1, 81),
('programming', 'JavaScript', 2, 82),
('programming', 'Software Development', 2, 83),
('programming', 'Web Development', 2, 84),
('programming', 'Coding', 2, 85),
('programming', 'Technology', 2, 86),
('programming', 'Python', 2, 87),
('programming', 'Data Science', 2, 88),
('programming', 'Software Engineering', 2, 89),
('programming', 'Java', 2, 90);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`) VALUES
(1, 'akshith vasa', 'akshith', 'akshith'),
(2, 'testing', 'testing', 'testing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `postdetails`
--
ALTER TABLE `postdetails`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `relatedtags`
--
ALTER TABLE `relatedtags`
  ADD PRIMARY KEY (`rID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `postdetails`
--
ALTER TABLE `postdetails`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `relatedtags`
--
ALTER TABLE `relatedtags`
  MODIFY `rID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `postdetails`
--
ALTER TABLE `postdetails`
  ADD CONSTRAINT `postdetails_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relatedtags`
--
ALTER TABLE `relatedtags`
  ADD CONSTRAINT `relatedtags_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
