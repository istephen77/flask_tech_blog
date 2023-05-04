-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2023 at 10:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codewars`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(30) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(100) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'First post', '9376475458', 'Hey ', '2023-04-22 22:08:38', 'test@gmail.com'),
(2, 'test101', '9837464728', 'Hey, this is the message from test101', '2023-04-22 22:10:07', 'test101@gmail.com'),
(3, 'test108', '9327372634', 'Hey', '2023-05-01 11:35:12', 'test108@gmail.com'),
(4, 'test1041', '9327372222', '12', '2023-05-01 11:38:07', 'test1015@gmail.com'),
(5, 'test', '927336283', 'wdwe', '2023-05-01 11:45:34', 'stephin.sebastian78@gmail.com'),
(6, 'test', '9327372633', 'sd', '2023-05-01 11:52:43', 'stephin.sebastian96@gmail.com'),
(7, 'test', 'ewe', 'ewe', '2023-05-01 12:20:23', 'test105@gmail.com'),
(8, 'test110', '9273628363', 'hey !', '2023-05-03 17:37:20', 'test110@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `posted_by` text NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `sub_title` text NOT NULL,
  `img_file` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `posted_by`, `title`, `slug`, `content`, `sub_title`, `img_file`, `date`) VALUES
(1, 'Stephen S', 'How to Get Into Tech with No Experience: 16 Tips for Changing Careers', 'first-post', 'Get your foot in the door with a non-technical role at a tech company\r\nThis is kind of the flip side of #1! Instead of looking for a tech role at a non-technical company, you could get your foot in the door at a tech company in a non-technical role. \r\n\r\nResearch from Pew tells us that 43% of roles advertised by tech companies (around 53,000 positions!) are non-technical. Examples of these types of jobs include customer support, marketing, accounting, product management, sales development, research analysis, recruiting…really anything!\r\n\r\nThis gives you a chance to get to know people at the company, potentially work with other departments, gain familiarity with the products, and look for opportunities to transition into the tech side as you gain skills.', 'The tech industry is full of exciting and lucrative career opportunities, but if you’ve never worked in IT and you have no relevant experience, breaking into tech might feel like a pipe dream.', 'about-bg.jpg', '2023-04-22 22:29:35'),
(2, 'Aya Merimi', 'The 33 Best Technical Interview Prep Courses, Books, & Resources for 2023', 'second-post', 'How many hours of preparation for coding interviews are recommended? It depends on what code interview prep methods you’re using. Start by checking out our article on the best ways to prepare for a tech interview. \n\nThen, tailor the resources you use based on how much time you have before your interview.\n\nFor example, if you only have one week, you probably don’t want to start an interview bootcamp that lasts 3+ weeks. However, if you’re looking into how to prepare for a coding interview in one month or more, a structured course or detailed book could be an option for you.\n\n⌛ There are plenty of resources to help you prepare for a coding interview in one week, including mock interviews, skimmable books with practice problems, short courses that only require a few hours of study, etc. Since your time is limited in this scenario, it’s wise to focus on breadth over depth. ', 'Tech interviews can be intimidating. They often have several phases, from the first technical phone screen, to a remote coding interview or assignment, to the final on-site interview and whiteboard challenge.', 'about-bg.jpg', '2023-04-24 17:00:24'),
(3, 'Es Rosario', 'What Are the Different Types of Coding Languages?', 'third-post', 'Actually, you may be surprised to learn that there is no single overarching classification scheme for programming languages. Instead, there are a variety of methods you can use to categorize types of code.\r\n\r\nProgramming paradigms, for example, are one way to classify programming languages based on their features (e.g., functional, imperative, object-oriented, etc). But there are also “multi-paradigm” languages that allow coders to use more than one programming style. \r\n\r\nPlus, there are other ways to categorize languages, such as by high vs low level, their programming generation, how the code is run (interpreted vs compiled), and so on!', 'Individual programming languages like HTML, Python, and Ruby can be categorized into different types of coding languages.\r\n\r\nGetting clear on the different types of programming languages will improve your overall understanding of programming and computers. ', '', '2023-04-24 17:19:12'),
(4, 'Stefani Draganova', 'A Beginner’s Guide to Algorithmic Thinking', 'fourth-post', 'Do algorithms make you anxious? Do they seem complicated and too hard for you? Or are you unsure about what they even are?\r\n\r\nIf you feel any of these things, or feel like you can’t be a real developer unless you know them, you’re not alone.\r\n\r\nLearning common algorithms individually is helpful, but what’s even better is getting used to algorithmic thinking.\r\nCLICK TO TWEET\r\nAlgorithms and data structures are bugbears of the software development world. Traditionally educated developers were probably taught about them in one or two classes and self-taught or bootcamp developers often aren’t exposed to them at all.\r\n\r\nEven so, for most beginner developers, algorithms and data structures are the sources of a lot of anxiety and imposter syndrome.\r\n\r\nSince I wrote about some data structures for Learn to Code With Me a while back, this time I’m going to focus on algorithms. More specifically, I’m going to cover how to start thinking algorithmically.', 'Algorithms are at the very core of successful and efficient development. You’ll use them as you learn to code, you’ll be asked about them in technical interviews, and they’ll likely be part of your day-to-day development work.', '', '2023-04-24 17:57:12'),
(5, 'Nica', 'What Is Go (or Golang) & Should You Learn It?', 'fifth-post', 'What Is Go Language?\r\nWhat is Golang/Go language? Go is a statically typed, compiled programming language that feels like a dynamically typed, interpreted language.\r\n\r\nGo Logo\r\nIt is also fast. According to Go’s website, “it should take at most a few seconds to build a large executable on a single computer.”\r\n\r\nDue to its “concurrent” nature, it can run multiple tasks at the same time, independently of each other. Go has rich support for this, which makes it unique.\r\n\r\nWhat is Go (or Golang)? Find out in this quick intro!\r\nCLICK TO TWEET\r\n\r\n☝️ Back to top\r\n\r\nGo or Golang?\r\nIf you’ve heard of the Go coding language, you may have also heard it called Golang. So which is right: Go vs Golang?', 'Go, sometimes referred to as Golang, is a statically typed, compiled programming language designed at Google in 2007.\r\n\r\nIt makes it easy to build simple, reliable, and efficient systems, and is modeled after C. You may have seen its mascot before: the Go gopher.', '', '2023-04-24 17:58:59'),
(6, 'Kristina Morena', 'How to Get into Cybersecurity (Careers, Skills & Outlook)', 'sith-post', '\r\nTable of Contents\r\n\r\nWhat Is Cybersecurity?\r\nHow to Get Started in Cybersecurity\r\nWorking in Cybersecurity\r\nHow to Learn Cybersecurity\r\nFAQs\r\nCyberattacks are happening all the time and there’s a shortage of people with cybersecurity skills. Now, more than ever, we need skilled workers starting cybersecurity careers.\r\n\r\nAccording to the ISC Cybersecurity Workforce Study, the number of professionals in cyber security jobs would need to increase by 65% to meet the growing demands of today’s businesses.\r\n\r\nIf you’re at all interested in working in this field, this is a great time to learn how to get started in cybersecurity.\r\n\r\nSo, how long does it take to learn cyber security skills? Is cybersecurity a good career? What do you learn in cyber security training? Is cyber security hard to learn? When you’re considering new job paths, these questions are important ones.\r\n\r\nEverything you need to know about pursuing a career in cybersecurity\r\nCLICK TO TWEET\r\n\r\nIn this post, we’ll cover what cybersecurity entails, why there is such a massive demand for these skills, how to get into cybersecurity, what cybersecurity career options are available, and more.\r\n\r\nDisclosure: I’m a proud affiliate for some of the resources mentioned in this article. If you buy a product through my links on this page, I may get a small commission for referring you. Thanks!', 'Cyberattacks are happening all the time and there’s a shortage of people with cybersecurity skills. Now, more than ever, we need skilled workers starting cybersecurity careers', '', '2023-04-24 18:00:18'),
(8, '', 'Hackathons should be renamed to avoid negative connotations', 'Hackathons ', 'Events where groups of people come together to create or improve software using large data sets are usually called hackathons. As health data researchers who want to build and maintain public trust, we recommend the use of alternative terms, such as datathon and code fest.\r\n\r\nHackathon is a portmanteau that combines the words “hack” and “marathon.” The “hack” in hackathon is meant to refer to a clever and improvised way of doing something rather than unauthorized computer or data access. From a computer scientist’s perspective, “hackathon” probably sounds innovative, intensive and maybe a little disruptive, but in a helpful rather than criminal way.\r\n\r\nThe issue is that members of the public do not interpret “hack” the way that computer scientists do.\r\n\r\nOur team, and many others, have performed research studies to understand the public’s interests and concerns when health data are used for research and innovation. In all of these studies, we are not aware of any positive references to “hack” or related terms. But studies from Canada, the United Kingdom and Australia have all found that members of the public consistently raise hacking as a major concern for health data.', 'In hackathons, people come together to build more extensive and cohesive datasets. (Shutterstock)', 'xyz.png', '2023-05-01 12:26:10'),
(9, '', 'Google and Microsoft are creating a monopoly on coding in plain language', 'monopoly ', 'Sometimes major shifts happen virtually unnoticed. On May 5, IBM announced Project CodeNet to very little media or academic attention.\r\n\r\nCodeNet is a follow-up to ImageNet, a large-scale dataset of images and their descriptions; the images are free for non-commercial uses. ImageNet is now central to the progress of deep learning computer vision.\r\n\r\nCodeNet is an attempt to do for Artifical Intelligence (AI) coding what ImageNet did for computer vision: it is a dataset of over 14 million code samples, covering 50 programming languages, intended to solve 4,000 coding problems. The dataset also contains numerous additional data, such as the amount of memory required for software to run and log outputs of running code.\r\n\r\nAccelerating machine learning\r\nIBM’s own stated rationale for CodeNet is that it is designed to swiftly update legacy systems programmed in outdated code, a development long-awaited since the Y2K panic over 20 years ago, when many believed that undocumented legacy systems could fail with disastrous consequences.', 'Coding is a specialized skill that requires learning one or more computer languages. (Shutterstock)', 'qwe.png', '2023-05-01 12:40:04'),
(10, '', 'Google and Microsoft are creating a monopoly on coding in plain language', 'monopoly ', 'Sometimes major shifts happen virtually unnoticed. On May 5, IBM announced Project CodeNet to very little media or academic attention.\r\n\r\nCodeNet is a follow-up to ImageNet, a large-scale dataset of images and their descriptions; the images are free for non-commercial uses. ImageNet is now central to the progress of deep learning computer vision.\r\n\r\nCodeNet is an attempt to do for Artifical Intelligence (AI) coding what ImageNet did for computer vision: it is a dataset of over 14 million code samples, covering 50 programming languages, intended to solve 4,000 coding problems. The dataset also contains numerous additional data, such as the amount of memory required for software to run and log outputs of running code.\r\n\r\nAccelerating machine learning\r\nIBM’s own stated rationale for CodeNet is that it is designed to swiftly update legacy systems programmed in outdated code, a development long-awaited since the Y2K panic over 20 years ago, when many believed that undocumented legacy systems could fail with disastrous consequences.', 'Coding is a specialized skill that requires learning one or more computer languages. (Shutterstock)', 'qwe.png', '2023-05-01 12:42:12'),
(11, '', 'Google and Microsoft are creating a monopoly on coding in plain language', 'monopoly ', 'Sometimes major shifts happen virtually unnoticed. On May 5, IBM announced Project CodeNet to very little media or academic attention.\r\n\r\nCodeNet is a follow-up to ImageNet, a large-scale dataset of images and their descriptions; the images are free for non-commercial uses. ImageNet is now central to the progress of deep learning computer vision.\r\n\r\nCodeNet is an attempt to do for Artifical Intelligence (AI) coding what ImageNet did for computer vision: it is a dataset of over 14 million code samples, covering 50 programming languages, intended to solve 4,000 coding problems. The dataset also contains numerous additional data, such as the amount of memory required for software to run and log outputs of running code.\r\n\r\nAccelerating machine learning\r\nIBM’s own stated rationale for CodeNet is that it is designed to swiftly update legacy systems programmed in outdated code, a development long-awaited since the Y2K panic over 20 years ago, when many believed that undocumented legacy systems could fail with disastrous consequences.', 'Coding is a specialized skill that requires learning one or more computer languages. (Shutterstock)', 'qwe.png', '2023-05-01 12:43:53'),
(12, 'Stephin Sebastian', 'Why a computer isn’t the first thing you need when teaching kids to code', 'teaching ', 'In 2020, COVID-19 hit, and globally, there was a massive shift to online instruction. Educators and parents realized that going forward, now that school boards have invested heavily in remote learning it has become a core aspect of education.\r\n\r\nSome people have surely been impressed by what even the youngest learners can do with technology. At the same time, it’s also become clear that our societies are going to need a generation of experts who can create whatever will supersede the huge tech platforms of our day like Google or TikTok.\r\n\r\nBut success in teaching children coding is not about choosing the most cutting-edge technologies or programs. It is about all the learning that is critical as a foundation. Children must learn to locate and orient themselves and other objects in space, and how to visualize such movements and relationships. They must also learn how to communicate and how to solve problems.\r\n\r\nRead more: The promise of the “learn to code” movement\r\n\r\nHuman cognition drives code and, by extension, the computer. It’s the human cognition manifest in wondering, learning to pose problems and “debug” solutions that we should be most concerned with.', 'Children participate in CodeSpark Academy, Dec. 4, 2017, in Brooklyn, N.Y. (Mark Von Holden/AP Images for CodeSpark Academy)', 'cwe.png', '2023-05-01 12:45:08'),
(13, 'Stephin Sebastian', 'Teachers play a critical role in shaping girls’ future as coders', 'coders', 'The big idea\r\nIt doesn’t take long to help girls see a future for themselves in computer science, but it depends largely on how good their teachers are at recognizing the skills the girls have in coding, which is basically writing language for computers. We found that girls ages 10 to 12 can come to see themselves as coders in as little as a week. And there are diverse roles within the world of coding that allow girls with various personalities and skill sets to see themselves as coders. However, if educators recognize girls only for when they play a background role and help others, but not when they are more assertive and confident, then they may not develop their assertiveness and confidence in a way that enables them to succeed as coders.\r\n\r\nTo reach this conclusion, my colleagues and I focused on three girls from different backgrounds – one was Black, one was Hispanic and one was white – who participated in a one-week coding camp. We analyzed over 40 hours of video footage from the camp, interviews with the girls and open-ended survey responses to determine how the camp influenced each girl’s coding identity – that is, their sense of belonging in the field of computer science and their potential for future success.', 'In 1990, women represented 35% of the computer science workforce. By 2017, this had fallen below 30%.', 'wer.png', '2023-05-01 12:46:50'),
(14, 'Amr Sherra', 'Computer science now counts as math credit in most states – is this a good idea?', 'math-credit', 'In 2023, a who’s who of the tech world came together to launch a new nonprofit called Code.org. The purpose of the organization was to get more computer science into schools.\r\n\r\nBillionaires like Mark Zuckerberg and Bill Gates donated millions of dollars to the group. According to the organization’s last annual report, Code.org spent more than US$91 million between 2013 and 2018. Of that amount, $6.9 million went to advocate for state legislation across the country.\r\n\r\nAs part of the organization’s mission to “make computer science count” in K-12 education, code.org takes credit for having influenced graduation policies in 42 states. Today, 47 states and the District of Columbia allow computer science classes to count in place of math classes like Algebra 2. Prior to the organization’s work, only a few states allowed computer science to count for math credit.', 'As a computational physicist and education researcher who teaches college freshman introductory physics, I worry that allowing computer science to count as a required math or science course ', 'aby.png', '2023-05-01 12:59:36'),
(17, 'Stephin Sebastian', 'Hacker Noon', 'hackernoon', '\r\nHacker Noon is a well-known and frequently read blog. The content creation process is what makes it different from other blogs. Hacker Noon doesn’t have a team of authors – the posts are created by the whole community. Currently, there are over 12,000 active users, some of whom publish articles regularly. The authors are most often IT specialists, founders of software development companies, or startup owners. Sometimes, articles are written even by venture capital funds. As a result, a large number of authors generate a lot of interesting and original content in categories such as coding, software development, technology, cryptocurrencies, JavaScript, Python, React, and artificial intelligence. The variety of content makes it a suitable place for both novice programmers and IT experts. Before publication, all articles are checked by Hacker Noon specialists in terms of correctness, legal aspects, and quality.', 'he content creation process is what makes it different from other blogs.', 'ayz.png', '2023-05-04 11:48:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
