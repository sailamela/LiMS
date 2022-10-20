-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 09:37 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lims_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_accounts`
--

CREATE TABLE `tb_accounts` (
  `acc_type` varchar(30) NOT NULL,
  `acc_status` varchar(30) NOT NULL,
  `id` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_accounts`
--

INSERT INTO `tb_accounts` (`acc_type`, `acc_status`, `id`, `password`) VALUES
('librarian', 'active', '123', 'abc'),
('student', 'active', '456', 'abc'),
('admin', 'active', '789', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admins`
--

CREATE TABLE `tb_admins` (
  `id` varchar(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admins`
--

INSERT INTO `tb_admins` (`id`, `first_name`, `middle_name`, `last_name`, `department`, `email`, `phone`) VALUES
('789', 'JULIE ANN', 'O', 'SABAS', 'MIT', 'NULL', 999999999);

-- --------------------------------------------------------

--
-- Table structure for table `tb_books`
--

CREATE TABLE `tb_books` (
  `book_id` varchar(200) NOT NULL,
  `isbn` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(50) NOT NULL,
  `language` varchar(50) NOT NULL,
  `catalogue_id` varchar(200) NOT NULL,
  `no_ofpages` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_books`
--

INSERT INTO `tb_books` (`book_id`, `isbn`, `title`, `author`, `language`, `catalogue_id`, `no_ofpages`) VALUES
('BELL HOOKS | ALL ABOUT LOVE | 2022-8-14', '9780060959470', 'ALL ABOUT LOVE', 'BELL HOOKS', 'ENGLISH', 'BELL HOOKS | ALL ABOUT LOVE', 500),
('CHIP HUYEN | DESIGNING MACHINE LEARNING SYSTEMS | 2022-8-14', '9781098107963', 'DESIGNING MACHINE LEARNING SYSTEMS', 'CHIP HUYEN', 'ENGLISH', 'CHIP HUYEN | DESIGNING MACHINE LEARNING SYSTEMS', 400),
('DAVID D. BURNS, M.D. | FEELING GOOD | 2022-8-14', '9780380810338', 'FEELING GOOD', 'DAVID D. BURNS, M.D.', 'ENGLISH', 'DAVID D. BURNS, M.D. | FEELING GOOD', 400),
('DAVID MCCULLOUGH | 1776 | 2022-8-14', '9780743226721', '1776', 'DAVID MCCULLOUGH', 'ENGLISH', 'DAVID MCCULLOUGH | 1776', 800),
('ERIC EVANS | DOMAIN-DRIVEN DESIGN | 2022-8-14', '9780321125217', 'DOMAIN-DRIVEN DESIGN', 'ERIC EVANS', 'ENGLISH', 'ERIC EVANS | DOMAIN-DRIVEN DESIGN', 600),
('FRANCES TEAGUE | EDUCATIONAL AND VOCATIONAL BOOKS | 2022-8-14', '9783319945316', 'EDUCATIONAL AND VOCATIONAL BOOKS', 'FRANCES TEAGUE', 'ENGLISH', 'FRANCES TEAGUE | EDUCATIONAL AND VOCATIONAL BOOKS', 800),
('MARK MOLDWIN | AN INTRODUCTION TO SPACE WEATHER | 2022-8-14', '9780521711128', 'AN INTRODUCTION TO SPACE WEATHER', 'MARK MOLDWIN', 'ENGLISH', 'MARK MOLDWIN | AN INTRODUCTION TO SPACE WEATHER', 600),
('MARTY CAGAN; CHRIS JONES | EMPOWERED | 2022-8-14', '9781119691297', 'EMPOWERED', 'MARTY CAGAN; CHRIS JONES', 'ENGLISH', 'MARTY CAGAN; CHRIS JONES | EMPOWERED', 250),
('MICHAEL R. JACKSON | A STRANGE LOOP | 2022-10-2', '9781559369930', 'A STRANGE LOOP', 'MICHAEL R. JACKSON', 'ENGLISH', 'MICHAEL R. JACKSON | A STRANGE LOOP', 200),
('ROBERT KIYOSAKI | RICH DAD POOR DAD | 2022-7-7', '', 'RICH DAD POOR DAD', 'ROBERT KIYOSAKI', 'ENGLISH', 'ROBERT KIYOSAKI | RICH DAD POOR DAD', 489),
('RONGHUAI HUANG, J. MICHAEL SPECTOR, JUNFENG YANG | EDUCATIONAL TECHNOLOGY | 2022-8-14', '9789811366437', 'EDUCATIONAL TECHNOLOGY', 'RONGHUAI HUANG, J. MICHAEL SPECTOR, JUNFENG YANG', 'ENGLISH', 'RONGHUAI HUANG, J. MICHAEL SPECTOR, JUNFENG YANG | EDUCATIONAL TECHNOLOGY', 200),
('YANN MARTEL | LIFE OF PI | 2022-7-7', '', 'LIFE OF PI', 'YANN MARTEL', 'ENGLISH', 'YANN MARTEL | LIFE OF PI', 399);

-- --------------------------------------------------------

--
-- Table structure for table `tb_booktransactions`
--

CREATE TABLE `tb_booktransactions` (
  `user_id` varchar(30) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `transaction` varchar(30) NOT NULL,
  `date` varchar(30) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_borrowed`
--

CREATE TABLE `tb_borrowed` (
  `id` varchar(30) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `date` varchar(30) NOT NULL,
  `due_date` varchar(30) NOT NULL,
  `days_exceed` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_catalogue`
--

CREATE TABLE `tb_catalogue` (
  `catalogue_id` varchar(200) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `no_ofcopies` bigint(20) NOT NULL,
  `available` bigint(20) NOT NULL,
  `book_img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_catalogue`
--

INSERT INTO `tb_catalogue` (`catalogue_id`, `book_id`, `genre`, `description`, `no_ofcopies`, `available`, `book_img`) VALUES
('BELL HOOKS | ALL ABOUT LOVE', 'BELL HOOKS | ALL ABOUT LOVE | 2022-8-14', '', 'A New York Times bestseller and enduring classic, All About Love is the acclaimed first volume in feminist icon bell hooks&#039; \r\n&quot;Love Song to the Nation&quot; trilogy.  All About Love reveals what causes a polarized society, and how to heal the divisions that cause suffering. \r\nHere is the truth about love, and inspiration to help us instill caring, compassion, and strength in our homes, schools, and workplaces.', 12, 10, 'All About Love.jpg'),
('CHIP HUYEN | DESIGNING MACHINE LEARNING SYSTEMS', 'CHIP HUYEN | DESIGNING MACHINE LEARNING SYSTEMS | 2022-8-14', '', 'This book will help you tackle scenarios such as:\r\nEngineering data and choosing the right metrics to solve a business problem\r\nAutomating the process for continually developing, evaluating, deploying, and updating models\r\nDeveloping a monitoring system to quickly detect and address issues your models might encounter in production\r\nArchitecting an ML platform that serves across use cases\r\nDeveloping responsible ML systems', 12, 12, 'Designing Machine Learning Systems.jpg'),
('DAVID D. BURNS, M.D. | FEELING GOOD', 'DAVID D. BURNS, M.D. | FEELING GOOD | 2022-8-14', '', 'rom renowned psychiatrist Dr. David D. Burns, the revolutionary volume that popularized\r\n Dr. Aaron T. Beck’s cognitive behavioral therapy (CBT) and has helped millions combat feelings of depression and develop greater self-esteem.', 12, 12, 'Feeling Good.jpg'),
('DAVID MCCULLOUGH | 1776', 'DAVID MCCULLOUGH | 1776 | 2022-8-14', '', 'America’s beloved and distinguished historian presents, in a book of breathtaking excitement, drama, and narrative force, \r\nthe stirring story of the year of our nation’s birth, 1776, interweaving, on both sides of the Atlantic, the actions and decisions that led Great \r\nBritain to undertake a war against her rebellious colonial subjects and that placed America’s survival in the hands of George Washington.', 12, 13, '1776.jpg'),
('ERIC EVANS | DOMAIN-DRIVEN DESIGN', 'ERIC EVANS | DOMAIN-DRIVEN DESIGN | 2022-8-14', '', 'With this book in hand, object-oriented developers, system analysts, \r\nand designers will have the guidance they need to organize and focus their work,\r\n create rich and useful domain models, and leverage those models into quality, long-lasting software implementations.', 12, 12, 'Domain-Driven Design.jpg'),
('FRANCES TEAGUE | EDUCATIONAL AND VOCATIONAL BOOKS', 'FRANCES TEAGUE | EDUCATIONAL AND VOCATIONAL BOOKS | 2022-8-14', '', 'From the beginning of the seventeenth century,\r\n English society started to become preoccupied with \r\neducation and how people acquired it. It is all the more\r\n surprising, then, that there should be relatively few \r\nearly modern texts by Englishwomen devoted to the\r\n question of how one should learn.\r\n The four texts printed here are principally concerned \r\nwith language and arithemetic. One of the reasons for \r\nthe paucity of such writings is that many commentators \r\nviewed women&#039;s ability to write as a threat to social \r\nstability. The education of women was at best ad hoc. \r\nA few attended dame schools, and the wealthy could \r\nafford private tutors. Among her own family and friends,\r\n however, the individual learned girl was often celebrated,\r\n and instances of formal praise act as forewords to some of the texts printed in this volume.', 12, 11, 'Educational and Vocational Books.jpg'),
('MARK MOLDWIN | AN INTRODUCTION TO SPACE WEATHER', 'MARK MOLDWIN | AN INTRODUCTION TO SPACE WEATHER | 2022-8-14', '', 'This textbook introduces the relationship between the Sun and Earth, \r\nand shows how it impacts our technological society. One of the first undergraduate \r\ntextbooks on space weather aimed at non-science majors, it uses the practical aspects \r\nof space weather to introduce space physics and give students an understanding of \r\nthe Sun-Earth relationship. Definitions of important terms are given throughout the text. Key concepts, \r\nsupplements, and review questions are given at the end of each chapter to help students understand the materials covered. \r\nThis textbook is ideal for introductory space physics courses.', 12, 12, 'Materials Modelling.jpg'),
('MARTY CAGAN; CHRIS JONES | EMPOWERED', 'MARTY CAGAN; CHRIS JONES | EMPOWERED | 2022-8-14', '', 'The goal of EMPOWERED is to provide you, \r\nas a leader of product management, product design,\r\n or engineering, with everything you’ll need to create\r\n just such an environment.', 12, 12, 'EMPOWERED.jpg'),
('MICHAEL R. JACKSON | A STRANGE LOOP', 'MICHAEL R. JACKSON | A STRANGE LOOP | 2022-10-2', 'CONTEMPORARY', 'To watch this show is to enter, by some urgent, bawdy magic, an ecstatic and infinitely more colorful version of the famous\r\nsurreal lithograph by M. C. Escher: the hand that lifts from the page, becoming almost real, then draws another hand, which returns the favor.\r\nWhich came first? A Strange Loop is complex, teasing, thrilling.” —Vinson Cunningham, New Yorker\r\nUsher is a Black, queer writer, working a day job he hates while writing his original musical: \r\na piece about a Black, queer writer, working a day job he hates while writing his original musical.\r\n This blistering musical follows a young artist at war with a host of demons—not least of which are \r\nthe punishing thoughts in his own head—in an attempt to understand his own strange loop.', 12, 12, 'A Strange Loop.jpg'),
('ROBERT KIYOSAKI | RICH DAD POOR DAD', 'ROBERT KIYOSAKI | RICH DAD POOR DAD | 2022-7-7', '', 'Rich Dad Poor Dad is a 1997 book written by Robert T. Kiyosaki and Sharon Lechter. It advocates the importance of financial literacy (financial education),financial independence and building wealth through investing in assets,\r\nreal estate investing, starting and owning businesses, as well as increasing one&#039;sfinancial intelligence (financial IQ). Rich Dad Poor Dad is written in the style of a set of parables,ostensibly based on Kiyosaki&#039;s life.[1] The titular &quot;rich dad&quot; is his friend&#039;s father who accumulated wealth due to entrepreneurship and savvy investing, while the &quot;poor dad&quot; is claimed to be Kiyosaki&#039;s own father who he says worked hard all his life but neverobtained financial security.', 12, 0, 'BOOK-IMG1.jpg'),
('RONGHUAI HUANG, J. MICHAEL SPECTOR, JUNFENG YANG | EDUCATIONAL TECHNOLOGY', 'RONGHUAI HUANG, J. MICHAEL SPECTOR, JUNFENG YANG | EDUCATIONAL TECHNOLOGY | 2022-8-14', '', 'This book is targeted towards those who are looking for career in educational technology, instructional design,\r\n or media and information systems, or may want to continue their studies in graduate programs in learning and instructional technology, \r\nand those who are interested in becoming teacher in K-12 setting but need background in educational technology. \r\nThis book will also act as a valuable resource in teacher education programs where primary focus on mainstream \r\neducation and requires an authentic resource in instructional design and educational technology.\r\n Keeping in mind the varied needs of the organizations, employees and potential students, \r\nthis book adopts a competency approach to learning and assessment. The themes and topics take a multi-disciplinary approach, \r\nand are aimed at preparing students for competent and innovative educational technology professionals.', 12, 12, 'Educational Technology.jpg'),
('YANN MARTEL | LIFE OF PI', 'YANN MARTEL | LIFE OF PI | 2022-7-7', 'FICTION', 'Life of Pi is a Canadian philosophical novel by Yann Martel published in 2001.The protagonist is Piscine Molitor &quot;Pi&quot; Patel, an Indian boy from Pondicherry who explores issues of spirituality and metaphysics from an early age. He survives 227 days after a shipwreck while stranded on a lifeboat in the Pacific Ocean with a Bengal tiger which raises questions about the nature of reality and how it is perceived and told. The novel has sold more than ten million copies worldwide. It was rejected by at least five London publishing houses before being accepted by Knopf Canada, which published it in September 2001.The UK edition won the Man Booker Prize for Fiction the following year.', 12, -1, 'BOOK-IMG2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_courses`
--

CREATE TABLE `tb_courses` (
  `course` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_courses`
--

INSERT INTO `tb_courses` (`course`) VALUES
('BSIT');

-- --------------------------------------------------------

--
-- Table structure for table `tb_credit`
--

CREATE TABLE `tb_credit` (
  `user_id` varchar(30) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `amount` mediumint(9) NOT NULL,
  `date` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_credit`
--

INSERT INTO `tb_credit` (`user_id`, `book_id`, `amount`, `date`) VALUES
('456', 'FRANCES TEAGUE | EDUCATIONAL AND VOCATIONAL BOOKS | 2022-8-14', 100, '2022-10-7');

-- --------------------------------------------------------

--
-- Table structure for table `tb_debit`
--

CREATE TABLE `tb_debit` (
  `user_id` varchar(30) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `amount` mediumint(9) NOT NULL,
  `date` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_departments`
--

CREATE TABLE `tb_departments` (
  `departments` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_departments`
--

INSERT INTO `tb_departments` (`departments`) VALUES
('BSA');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ebooks`
--

CREATE TABLE `tb_ebooks` (
  `ebook_file` varchar(200) NOT NULL,
  `ebook_id` varchar(200) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `language` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `no_ofpages` bigint(20) NOT NULL,
  `ebook_img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_ebooks`
--

INSERT INTO `tb_ebooks` (`ebook_file`, `ebook_id`, `genre`, `title`, `author`, `language`, `description`, `no_ofpages`, `ebook_img`) VALUES
('E-BOOK SAMPLE 1.pdf', 'GNU GENERAL PUBLIC LICENSE | MYSQL ESSENTIALS | 2022-10-2', 'FICTION', 'MYSQL ESSENTIALS', 'GNU GENERAL PUBLIC LICENSE', 'ENGLISH', 'MySQL is an online book designed to provide everything a user needs\r\nto know how to used the database from two points of view,\r\nas an application developer and as a system administrator.', 200, 'EBOOK-IMG1.jpg'),
('', 'ADOBE, INC | ADOBE PHOTOSHOP CC HELP | 2022-10-2', 'CONTEMPORARY', 'ADOBE PHOTOSHOP CC HELP', 'ADOBE, INC', 'ENGLISH', 'The January 2018 and October 2017 releases of Photoshop CC (versions 19.x) roll out exciting new features for designers, digital photographers, and illustrators. Read on for a quick introduction to these features and links to resources offering more information. (From Author)', 600, 'EBOOK-IMG2.jpg'),
('Words That Change Minds The 14 Patterns for Mastering the Language of Influence (Shelle Rose Charvet) (z-lib.org).pdf', 'SHELLE ROSE CHARVET | WORDS THAT CHANGE MINDS THE 14 PATTERNS FOR MASTERING THE LANGUAGE OF INFLUENCE | 2022-10-2', 'FICTION', 'WORDS THAT CHANGE MINDS THE 14 PATTERNS FOR MASTERING THE LANGUAGE OF INFLUENCE', 'SHELLE ROSE CHARVET', 'ENGLISH', 'NONE', 200, 'Words That Change Minds The 14 Patterns for Mastering the Language of Influence (Shelle Rose Charvet) (z-lib.org).jpg'),
('Words That Change Minds The 14 Patterns for Mastering the Language of Influence (Shelle Rose Charvet) (z-lib.org).pdf', 'DK, SMITHSONIAN | TIMELINES OF HISTORY THE ULTIMATE VISUAL GUIDE TO THE EVENTS THAT SHAPED THE WORLD | 2022-10-2', 'FICTION', 'TIMELINES OF HISTORY THE ULTIMATE VISUAL GUIDE TO THE EVENTS THAT SHAPED THE WORLD', 'DK, SMITHSONIAN', 'ENGLISH', 'NONE', 300, 'Timelines of History The Ultimate Visual Guide To The Events That Shaped The World (DK, Smithsonian) (z-lib.org).png'),
('', 'MORGAN HOUSEL | THE PSYCHOLOGY OF MONEY TIMELESS LESSONS ON WEALTH, GREED, AND HAPPINESS | 2022-10-2', 'FICTION', 'THE PSYCHOLOGY OF MONEY TIMELESS LESSONS ON WEALTH, GREED, AND HAPPINESS', 'MORGAN HOUSEL', 'ENGLISH', 'NONE', 500, 'The Psychology of Money Timeless lessons on wealth, greed, and happiness (Morgan Housel) (z-lib.org).jpg'),
('', 'DALE CARNEGIE | THE ART OF PUBLIC SPEAKING THE ORIGINAL TOOL FOR IMPROVING PUBLIC ORATION | 2022-10-2', 'CONTEMPORARY', 'THE ART OF PUBLIC SPEAKING THE ORIGINAL TOOL FOR IMPROVING PUBLIC ORATION', 'DALE CARNEGIE', 'ENGLISH', 'NONE', 600, 'The Art of Public Speaking The Original Tool for Improving Public Oration (Dale Carnegie) (z-lib.org).png'),
('', 'DAVID KELLEY | THE ART OF REASONING AN INTRODUCTION TO LOGIC AND CRITICAL THINKING | 2022-10-2', 'CONTEMPORARY', 'THE ART OF REASONING AN INTRODUCTION TO LOGIC AND CRITICAL THINKING', 'DAVID KELLEY', 'ENGLISH', 'NONE', 700, 'The Art of Reasoning An Introduction to Logic and Critical Thinking (David Kelley) (z-lib.org).jpg'),
('The Code of the Extraordinary Mind 10 Unconventional Laws to Redefine Your Life and Succeed on Your Own Terms (Vishen Lakhiani) (z-lib.org).pdf', 'VISHEN LAKHIANI | THE CODE OF THE EXTRAORDINARY MIND 10 UNCONVENTIONAL LAWS TO REDEFINE YOUR LIFE AND SUCCEED ON YOUR OWN TERMS | 2022-10-2', 'CONTEMPORARY', 'THE CODE OF THE EXTRAORDINARY MIND 10 UNCONVENTIONAL LAWS TO REDEFINE YOUR LIFE AND SUCCEED ON YOUR ', 'VISHEN LAKHIANI', 'ENGLISH', 'NONE', 200, 'The Code of the Extraordinary Mind 10 Unconventional Laws to Redefine Your Life and Succeed on Your Own Terms (Vishen Lakhiani) (z-lib.org).jpg'),
('', 'DAVID STONE POTTER | THE EMPERORS OF ROME THE STORY OF IMPERIAL ROME FROM JULIUS CAESAR TO THE LAST EMPEROR | 2022-10-2', 'FICTION', 'THE EMPERORS OF ROME THE STORY OF IMPERIAL ROME FROM JULIUS CAESAR TO THE LAST EMPEROR', 'DAVID STONE POTTER', 'ENGLISH', 'NONE', 600, 'The Emperors of Rome The Story of Imperial Rome from Julius Caesar to the Last Emperor (David Stone Potter) (z-lib.org).jpg'),
('Quantum Physics (John Gribbin) (z-lib.org).pdf', 'JOHN GRIBBIN | QUANTUM PHYSICS | 2022-10-2', 'PHYSICS', 'QUANTUM PHYSICS', 'JOHN GRIBBIN', 'ENGLISH', 'NONE', 300, 'Quantum Physics (John Gribbin) (z-lib.org).jpg'),
('', 'JUN NI | PRINCIPLES OF PHYSICS FROM QUANTUM FIELD THEORY TO CLASSICAL MECHANICS | 2022-10-2', 'PHYSICS', 'PRINCIPLES OF PHYSICS FROM QUANTUM FIELD THEORY TO CLASSICAL MECHANICS', 'JUN NI', 'ENGLISH', 'NONE', 300, 'Principles Of Physics From Quantum Field Theory To Classical Mechanics (Jun Ni) (z-lib.org).jpg'),
('Data Analytics (Arthur Zhang) (z-lib.org).pdf', 'ARTHUR ZHANG | DATA ANALYTICS | 2022-10-2', 'MATHEMATICS', 'DATA ANALYTICS', 'ARTHUR ZHANG', 'ENGLISH', 'NONE', 300, 'Data Analytics (Arthur Zhang) (z-lib.org).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ebook_favorites`
--

CREATE TABLE `tb_ebook_favorites` (
  `user_id` varchar(30) NOT NULL,
  `ebook_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_genre`
--

CREATE TABLE `tb_genre` (
  `genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_genre`
--

INSERT INTO `tb_genre` (`genre`) VALUES
('FICTION'),
('CONTEMPORARY'),
('MATHEMATICS'),
('PHYSICS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_news`
--

CREATE TABLE `tb_news` (
  `news_id` varchar(200) NOT NULL,
  `title` varchar(300) NOT NULL,
  `date_posted` varchar(30) NOT NULL,
  `date_time` varchar(30) NOT NULL,
  `news_content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_news`
--

INSERT INTO `tb_news` (`news_id`, `title`, `date_posted`, `date_time`, `news_content`) VALUES
('The Queen of Dirt Island by Donal Ryan review – fierce tale of family strife | 2022-25-8', 'The Queen of Dirt Island by Donal Ryan review – fierce tale of family strife', '2022-25-8', '2022-08-25 14:21:29', 'Donal Ryan’s latest novel is a book of opposing forces. It begins with an ending – the abrupt loss of a character we have only just met – yet concludes with a hope for the people he left behind. Between those events lies a coming-of-age story that explores the challenges of growing up in a tight rural community in 1980s Ireland, and the broader landscape of prejudice, misogyny and family conflict.\r\n\r\nRyan won the Guardian first book award in 2013 for The Spinning Heart, set in rural Ireland after the collapse of the Celtic Tiger. His seventh novel follows the lives of four generations of the Aylwards, a family of strong Irish women whose men have either died or absconded. They gather around the kitchen table to smoke and talk and drink tea, and in the process help us understand our own lives just that little bit better. Nana is at the head of this table: a woman who has buried two of her sons, yet whose wry observations provide much of the humour. Opposite Nana is her widowed daughter-in-law Eileen, and loitering in the doorway is our narrator, Eileen’s young daughter Saoirse (a name Eileen worries over: “if she ever goes to America the Yanks won’t have a clue how to pronounce it”), eavesdropping on a life she has yet to understand.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_online_borrowed`
--

CREATE TABLE `tb_online_borrowed` (
  `id` varchar(30) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `date` varchar(100) NOT NULL,
  `expiry_date` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penalty`
--

CREATE TABLE `tb_penalty` (
  `penalty` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_penalty`
--

INSERT INTO `tb_penalty` (`penalty`) VALUES
(40);

-- --------------------------------------------------------

--
-- Table structure for table `tb_reservation`
--

CREATE TABLE `tb_reservation` (
  `user_id` varchar(30) NOT NULL,
  `book_id` varchar(200) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_students`
--

CREATE TABLE `tb_students` (
  `id` varchar(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `course` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_students`
--

INSERT INTO `tb_students` (`id`, `first_name`, `middle_name`, `last_name`, `course`, `email`, `phone`) VALUES
('456', 'ALLAN CYRIL', 'A', 'LAMELA', 'EDUC', 'modo121233@gmail.com', 912121212);

-- --------------------------------------------------------

--
-- Table structure for table `tb_teachers`
--

CREATE TABLE `tb_teachers` (
  `id` varchar(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_teachers`
--

INSERT INTO `tb_teachers` (`id`, `first_name`, `middle_name`, `last_name`, `department`, `email`, `phone`) VALUES
('123', 'CRYSTAL ANN', 'G', 'CALUYA', 'MIT', 'modo121233@gmail.com', 123213213);

-- --------------------------------------------------------

--
-- Table structure for table `tb_theme`
--

CREATE TABLE `tb_theme` (
  `nav` varchar(100) NOT NULL,
  `body` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_theme`
--

INSERT INTO `tb_theme` (`nav`, `body`) VALUES
('#b29945', '#163761');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_accounts`
--
ALTER TABLE `tb_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admins`
--
ALTER TABLE `tb_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_books`
--
ALTER TABLE `tb_books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `tb_catalogue`
--
ALTER TABLE `tb_catalogue`
  ADD PRIMARY KEY (`catalogue_id`);

--
-- Indexes for table `tb_news`
--
ALTER TABLE `tb_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tb_students`
--
ALTER TABLE `tb_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_teachers`
--
ALTER TABLE `tb_teachers`
  ADD PRIMARY KEY (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `AutoExpire` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-08-04 18:56:41' ON COMPLETION PRESERVE ENABLE DO UPDATE tb_online_borrowed
SET tb_online_borrowed.status = 'expired'
WHERE tb_online_borrowed.expiry_date <= now() + INTERVAL 1 DAY$$

CREATE DEFINER=`root`@`localhost` EVENT `AutoAvailable` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-08-15 16:21:37' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_reservation
JOIN tb_catalogue
ON tb_reservation.book_id=tb_catalogue.book_id
SET tb_reservation.status='available'
WHERE tb_catalogue.available != 0
AND tb_reservation.status='unavailable'$$

CREATE DEFINER=`root`@`localhost` EVENT `AutoUnavailable` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-08-09 15:32:43' ON COMPLETION PRESERVE ENABLE DO UPDATE tb_reservation
JOIN tb_catalogue
ON tb_reservation.book_id=tb_catalogue.book_id
SET tb_reservation.status='unavailable'
WHERE tb_catalogue.available = 0 AND tb_reservation.status='available'$$

CREATE DEFINER=`root`@`localhost` EVENT `AutoUpdateExceedDays` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-08-15 15:03:19' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_borrowed
SET tb_borrowed.days_exceed=ABS (DATEDIFF(tb_borrowed.due_date, CURDATE()))
WHERE tb_borrowed.due_date <= CURDATE()$$

CREATE DEFINER=`root`@`localhost` EVENT `AutoUpdateAmount` ON SCHEDULE EVERY 1 MINUTE STARTS '2022-08-15 15:16:27' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE tb_credit
JOIN tb_borrowed ON tb_credit.book_id=tb_borrowed.book_id
SET tb_credit.amount=(ABS (DATEDIFF(tb_borrowed.due_date, CURDATE())) * 50),
tb_credit.date=CURDATE()
WHERE tb_credit.date <= CURDATE()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
