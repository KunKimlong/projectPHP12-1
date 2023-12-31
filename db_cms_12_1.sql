-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2023 at 07:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cms_12_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_about_us`
--

CREATE TABLE `tbl_about_us` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `feedbackdate` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_follow_us`
--

CREATE TABLE `tbl_follow_us` (
  `id` int(11) NOT NULL,
  `thumnail` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `status` char(10) NOT NULL COMMENT 'follow us,footer',
  `url` varchar(255) NOT NULL,
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logo`
--

CREATE TABLE `tbl_logo` (
  `id` int(11) NOT NULL,
  `thumnail` varchar(255) NOT NULL,
  `status` char(10) NOT NULL COMMENT 'header,footer,all',
  `create_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_logo`
--

INSERT INTO `tbl_logo` (`id`, `thumnail`, `status`, `create_at`) VALUES
(1, '031023080148_418934_290529074736_footerEtec.png', 'Footer', '2023-10-02'),
(3, '111023074537_459980_290529074716_header2.png', 'Header', '2023-10-11');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `thumnail` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `post_by` int(11) NOT NULL,
  `category` char(15) NOT NULL COMMENT 'sport,socail,entertainment',
  `news-type` char(15) NOT NULL COMMENT 'national,internation',
  `viewer` int(11) NOT NULL,
  `post_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `title`, `description`, `thumnail`, `banner`, `post_by`, `category`, `news-type`, `viewer`, `post_date`) VALUES
(1, 'ក្លឹប​ទាំង​១០ នៅ​លីគ​កំពូល​ទាំង​៥ រក​គ្រាប់​បាល់​បាន​ច្រើន​ជាង​គេ​ ក្នុង​រដូវកាល​នេះ​', '១. ក្លឹប​ Bayern Munich៖ រក​គ្រាប់​បាល់​បាន​ ១៨គ្រាប់​ ក្នុង​៥ប្រកួត​។\r\n\r\n២. ក្លឹប​ Brighton៖ រក​គ្រាប់​បាល់​បាន​ ១៨គ្រាប់​ ក្នុង​៦ប្រកួត​។\r\n\r\n៣. ក្លឹប​ Barcelona៖ រក​គ្រាប់​បាល់​បាន​ ១៨គ្រាប់​ ក្នុង​៧ប្រកួត​។\r\n\r\n៤. ក្លឹប​ Bayer Leverkusen៖ រក​គ្រាប់​បាល់​បាន​ ១៧គ្រាប់​ ក្នុង​៥ប្រកួត​។\r\n\r\n៥. ក្លឹប​ Stuttgart៖ រក​គ្រាប់​បាល់​បាន​ ១៧គ្រាប់​ ក្នុង​៥ប្រកួត​។\r\n\r\n៦. ក្លឹប​ Manchester City៖ រក​គ្រាប់​បាល់​បាន​ ១៦គ្រាប់​ ក្នុង​៦ប្រកួត​។\r\n\r\n៧. ក្លឹប​ Girona៖ រក​គ្រាប់​បាល់​បាន​ ១៦គ្រាប់​ ក្នុង​៦ប្រកួត​។\r\n\r\n៨. ក្លឹប​ Newcastle United៖ រក​គ្រាប់​បាល់​បាន​ ១៦គ្រាប់​ ក្នុង​៦ប្រកួត​។\r\n\r\n៩. ក្លឹប​ Liverpool៖ រក​គ្រាប់​បាល់​បាន​ ១៥គ្រាប់​ ក្នុង​៦ប្រកួត​។\r\n\r\n១០. ក្លឹប​ Tottenham Hotspure៖ រក​គ្រាប់​បាល់​បាន​ ១៥គ្រាប់​ ក្នុង​៦ប្រកួត​៕', '041023083040_sport2.jpg', '041023083040_sport2.jpg', 2, 'Sport', 'International', 9, '2023-10-04'),
(2, 'ឈ្នះៗ ពិតប្រាកដមែន! foodpanda រកឃើញអ្នកឈ្នះរង្វាន់ប្រចាំខែដំបូងគេហើយ!', 'កម្មវិធីចែករង្វាន់ដ៏អស្ចារ្យយ៉ាងច្រើនសន្ធឹកសន្ធាប់មិនធ្លាប់មានពីមុនមករបស់ក្រុមហ៊ុន foodpanda បានរកឃើញអ្នកឈ្នះរង្វាន់ធំប្រចាំខែដំបូងគេរបស់ខ្លួនហើយបន្ទាប់ពីចាប់ផ្ដើមតាំងពីខែសីហា មក។ តោះមកស្គាល់មុខ និងស្គាល់ឈ្នោះអ្នកមានសំណាងទាំងអស់គ្នា!ក្រៅពីរកឃើញអ្នកឈ្នះរង្វាន់ប្រចាំខែសីហា ដែលជាខែដំបូងគេក្នុងកម្មវិធីឈ្នះរង្វាន់ដ៏អស្ចារ្យហើយនោះ foodpanda ក៏បន្តចូលរួមត្រេកអរជាមួយអ្នកដែលមានសំណាងឈ្នះរង្វាន់ប្រចាំសប្តាហ៍ទី៤ នៃខែសីហានេះផងដែរ ', '051023073618_foodpanda.jpg', '051023073618_foodpanda.jpg', 2, 'Socail', 'National', 0, '2023-10-05'),
(3, 'BLACKPINK បិទបញ្ចប់ការប្រគំតន្ត្រីទេសចរណ៍ខ្នាតយក្ស “BORN PINK” ជាមួយនឹងលទ្ធផលអស្ចារ្យ', 'BLACKPINK បាន​បិទ​បញ្ចប់ការ​ប្រគំ​តន្ត្រី “BORN PINK” របស់​ពួក​គេដោយជោគជ័យ ​ជា​មួយ​នឹង​ការសម្ដែង​ផ្តាច់​ព្រ័ត្រ​នៅ​ទីក្រុង​សេអ៊ូល ប្រទេស​កូរ៉េខាងត្បូង។ចាប់ពីថ្ងៃទី ១៦ ដល់ថ្ងៃទី ១៧ ខែកញ្ញា BLACKPINK បានបញ្ចប់ការប្រគុំតន្ត្រីទេសចរណ៍ពិភពលោក \"BORN PINK\" ដ៏ជោគជ័យរបស់ពួកគេជាមួយនឹងបង្ហាញមុខលើកចុងក្រោយ ជាលក្ខណៈទ្រង់ទ្រាយធំនៅទីក្រុងសេអ៊ូល ដោយបានបង្កើតប្រវត្តិសាស្ត្រក្នុងនាមជាតារាស្រី K-pop ដំបូងដែលរៀបចំការប្រគុំតន្ត្រីនៅពហុកីឡាដ្ឋាន Gocheok Sky Dome។', '051023073722_black pink2.jpg', '051023073722_black pink.jpg', 2, 'Entertainment', 'International', 2, '2023-10-05'),
(4, 'សិល្បករ-សិល្បការិនី ៤ដួង បង្ហាញអារម្មណ៍លើសារបង្ហោះ ទ្រី ដាណា ទម្លាយរឿងខំជួយ ប៊ុត សីហា', '“កំណើតឆ្កែ កែមិនឡើង” គឺជាពាក្យស្ដីបន្ទោសពេញនិយមរបស់មហាជនទៅលើអតីតតារាចម្រៀង ប៊ុត សីហា តាមរយៈសារបង្ហោះរបស់អ្នកស្រី ទ្រី ដាណា នៅលើបណ្ដាញសង្គមហ្វេសប៊ុក កាលពីថ្ងៃទី១៣ ខែកញ្ញា ឆ្នាំ២០២៣ ពោលគឺក្រោយមួយថ្ងៃ នៃការឃាត់ខ្លួនលោក ប៊ុត សីហា ពាក់ព័ន្ធករណីគ្រឿងញៀន នៅស្រុកគងពិសី ខេត្ដកំពង់ស្ពឺ។', '051023073804_entertainment2.jpg', '051023073804_entertainment2.jpg', 2, 'Socail', 'National', 0, '2023-10-05'),
(5, 'ស្ងាត់ៗ គង់ ច័ន្ទស្រីមុំ បោះមួយជំហ៊ានទៀតលើមុខជំនួញ បន្ថែមលើអាជីពសិល្បៈដែលកំពុងរវល់ខ្លាំង', 'បើទោះបីមានមុខជំនួញច្រេីន នៅក្នុងដៃក្តី តែតារាស្រីពូកែខាងរកស៊ី គង់ ច័ន្ទស្រីមុំ និងស្វាមី នៅតែចង់បង្កេីតជំនួញថ្មីៗ។ ជាក់ស្តែង គង់ ច័ន្ទស្រីមុំ ទេីបតែសម្ពោធហាងតែគុជថ្មី ដែលមានឈ្មោះថា “Momo Colatea” សាខាបឹងស្នោ ជាលេីកដំបូង និងគ្រោងពង្រីកជាច្រេីនសាខាទៀត។ប្រាប់អ្នកសារព័ត៌មាននៅក្នុងពិធីសម្ពោធបើកហាងថ្មី តារាស្រីសាច់ចាំ គង់ ច័ន្ទស្រីមុំ ថា នេះជាតែគុជដំបូង ដែលនាង បានបង្កេីតរស់ជាតិដោយខ្លួនឯង Momo Collatea ដែលជាតែគុជដំបូងគេបង្អស់មានសារជាតិ Collagen ចម្រាញ់ចេញពីខ្លាញ់ត្រីសុទ្ធ 100% អាចញ៉ាំបានគ្រប់វ័យ ហើយវាមានរសជាតិឆ្ងាញ់ និងមានអត្ថប្រយោជន៍ធ្វើឲ្យស្បែកស្អាតទៀតផង។', '051023073902_entertainment1.jpg', '051023073902_entertainment1_2.jpg', 2, 'Socail', 'National', 8, '2023-10-05'),
(6, 'កម្មវិធីប្រឡងចម្រៀងរ៉េបចំណាត់ថ្នាក់លេខ១ក្នុងតំបន់អាសុីអាគ្នេយ៍ The Rapper បង្ហាញវត្តមានដំបូងក្នុងប្រទេសកម្ពុជា', 'គណៈកម្មការទាំង២រូប (ត្រូវបានស្គាល់ថាជាផលិតករ) នៃកម្មវិធីប្រឡងចម្រៀងរ៉េបគឺជា កំពូលសិល្បករ លោក វណ្ណដា (ផលិតកម្មបារមី) និង លោក ជូវីលីន (ផលិតកម្មបារមី) រួមជាមួយក្រុមគ្រូបង្វឹក (Coach) ដែលសុទ្ធតែជាតារាចម្រៀងរ៉េបមានទេពកោសល្យនិងកេរ្តិ៍ឈ្មោះបោះសំឡេងក្នុងវិស័យតន្ត្រីដូចជា៖លោក Khmer1Jivit, លោក Norith (ផលិតកម្មបារមី), លោក Kingchi (CG Movement), លោក Ruthko (KlapYaHandz) រីឯ តារាចម្រៀងរ៉េប លោក វិន វិទូ (ផលិតកម្មក្លាបយ៉ាហ៊ែន) និង កញ្ញា វ៉ាន់នីឡានឹងដើរតួនាទីជាពិធីករពិធីការនីក្នុងកម្មវិធី។ កម្មវិធីប្រឡងចម្រៀងរ៉េបនេះនឹងធ្វើការចាក់ផ្សាយវគ្គដំបូងនៅ ថ្ងៃ អាទិត្យ ទី១៧ ខែ កញ្ញា ឆ្នាំ ២០២៣ លើកញ្ចក់ទូរទស្សន៍បាយ័នវេលារាត្រី ចាប់ពីម៉ោង ៩ ដល់ ១០ៈ៣០នាទី ដែលមានចំនួនសរុប ១៣វគ្គ នឹងចាក់ផ្សាយជារៀងរាល់ ថ្ងៃ អាទិត្យ។', '051023074007_socail3.jpg', '051023074007_socail3.jpg', 2, 'Entertainment', 'National', 3, '2023-10-05'),
(7, 'ក្រសួង​អប់រំ​៖​ ម្ចាស់មេដាយ​ការ​ប្រកួត​សិស្ស​មធ្យម​បន្ត​ខំប្រឹង​ហ្វឹកហាត់ដើម្បីជា​ធនធាន​នៅថ្ងៃខាង​មុខ', 'តំណាង​ក្រសួង​អប់រំ​ យុវជន​ និង​កីឡា​ លើក​ទឹកចិត្ត​ដល់​សិស្សានុសិស្ស​ដែល​ទើប​ឈ្នះ​មេដាយ​ មាស​ ប្រាក់​ និង​សំរឹទ្ធ​ ព្រឹត្តិការណ៍​កីឡា​សិស្ស​មធ្យម​សិក្សា​សូម​បន្ត​ហ្វឹកហាត់​ជំនាញ​របស់​ខ្លួន​ដើម្បី​អនាគត​អាច​ក្លាយ​ជា​ជម្រើស​ជាតិ​បន្ត​ពី​រៀមច្បង។​ឯកឧត្ដម​ វ៉ាត់​ ចំរើន​ បាន​លើក​ឡើង​ក្នុង​ពិធី​បិទ​ការ​ប្រកួត​កីឡា​សិស្ស​មធ្យម​សិក្សា​ថា​ អ្នក​ដែល​ឈ្នះ​មេដាយ​ទាំង​អស់​ មិន​ថា​មេដាយ​ មាស​ ប្រាក់​ សំរឹទ្ធ​ សូម​បន្ត​ហ្វឹកហាត់​ជំនាញ​កីឡា​របស់​ខ្លួន​តទៅ​ទៀត​ ព្រោះ​អនាគត​ខាង​មុខ​អាច​ជា​ធនធាន​របស់​ប្រទេស​ជាតិ​ដូច​ជា​ជាប់​ជម្រើស​ជាតិ​ ឬ​ក្លាយ​ជា​គ្រូ​អប់រំកាយ​ផង​ដែរ។​', '051023074113_sport4.jpg', '051023074113_sport4.jpg', 2, 'Sport', 'National', 27, '2023-10-05'),
(8, 'កីឡាករ​ចិត្ត​ត្រជាក់​ល្ហឹម​ បឺត​ សង្ឃឹម​ វិល​ចូល​សង្វៀន​វិញនៅអាទិត្យ​នេះ​ហើយ​ក្រោយ​របួស​', 'ជើង​ខ្លាំង​គុន​ខ្មែរ​ និង​ជា​កីឡាករ​ចិត្ត​ត្រជាក់​ បឺត​ សង្ឃឹម​ បាន​វិល​ចូល​សង្វៀន​វិញ​ហើយ​នៅ​ថ្ងៃ​អាទិត្យ​ ទី១៧​ ខែ​កញ្ញា​ ឆ្នាំ​២០២៣​ ខាង​មុខ​នេះ។​បន្ទាប់​ពី​ឈ្នះ​មេដាយ​មាស​ ស៊ីហ្គេម​ ២០២៣​ នៅ​កម្ពុជា​អំឡុង​ខែ​ឧសភា​ កន្លង​ទៅ​ ​កីឡាករ​ IQ​ បឺត​ សង្ឃឹម​ ខកខាន​ឡើង​សង្វៀន​រហូត​មក​ដល់​ពេល​នេះ។​ ក្រោយ​សម្រាក​ព្យាបាល​ជិត​កន្លះ​ឆ្នាំ​មក​នេះ​ក្មួយ​ប្រុសរបស់​ បឺត​ ខាំ​ ខាង​លើ​ក៏​ជា​សះស្បើយ​ និង​អាច​វិល​ចូល​សង្វៀន​វិញ​ហើយ។​\r\nក្នុង​កិច្ច​សម្ភាស​មួយ​កីឡាករ​ បឺត​ សង្ឃឹម​ បញ្ជាក់​ថា​ខ្លួន​បាន​ជា​ពី​របួស​វិញ​ហើយ​ និង​បាន​ហ្វឹកហាត់​រយៈពេល​ពេញ​ ១ខែ​ដើម្បី​ត្រៀម​ការ​ប្រកួត​នៅ​សង្វៀន​ Town។​ ម្ចាស់​មេដាយ​មាស​ស៊ីហ្គេម​ ២ជំនាន់​រូប​នេះ​បញ្ជាក់​ទៀត​ថា​ បើ​ខ្លួន​ហ៊ាន​ទទួល​ការ​ប្រកួត​របស់​គេ​ហើយ​មាន​ន័យ​ថា​ សុខភាព​ និង​ការ​ហ្វឹកហាត់​គឺ​ត្រៀម​រួច​ហើយ។​', '051023074150_sport3.jpg', '051023074150_sport3_2.jpg', 2, 'Sport', 'National', 14, '2023-10-05'),
(9, 'រឿង​ដ៏​គួរឱ្យចាប់អារម្មណ៍ ៧យ៉ាង ក្នុងដំណើរទស្សនកិច្ចរបស់​ គីម ជុងអ៊ុន ទៅរុស្ស៊ី', '                                                                                        មេដឹកនាំ​កូរ៉េខាងជើង លោក គីម ជុងអ៊ុន បាន​ធ្វើទស្សនកិច្ចនៅរុស្ស៊ី ដោយ​ទៅជួប​លោកប្រធានាធិបតី​វ្លាឌីមៀ ពូទីន ដើម្បីបង្កើន​កិច្ចសហប្រតិបត្តិការ​រវាងប្រទេសទាំងពីរ។ យ៉ាងណាមិញ ក្នុងដំណើរទស្សនកិច្ចរបស់លោក គីម ជុងអ៊ុន នេះ មាន​វីដេអូ​ឃ្លីប​ជាច្រើន​ ថតជាប់ពីសកម្មភាព​ដ៏គួរឱ្យចាប់អារម្មណ៍​មួយចំនួន​របស់​មេដឹកនាំផ្តាច់ការទាំងពីរ​ដូចខាងក្រោមនេះ៖\r\n\r\n-លោក គីម ជុងអ៊ុន ជិះរថភ្លើង​ដែលមាន​ល្បឿនដ៏យឺត ទៅរុស្ស៊ីភាគខាងកើត ដែលវាមាន​ល្បឿន​អតិបរមា​ត្រឹម ៦០គីឡូម៉ែត្រ​ក្នុង១ម៉ោង។\r\n-ពេល​លោក គីម ជុងអ៊ុន ចុះពីរថយន្តទៅចាប់ដៃជាមួយ​លោក ពូទីន អ្នក​បកប្រែ​ឱ្យលោក គីម ជុងអ៊ុន ម្នាក់ ហាក់ឆ្លេឆ្លារកកន្លែង​ឈរបកប្រែ​ឱ្យមិនបាន។                                                                                ', '101023082627_socail2.jpg', '051023082842_socail2.jpg', 2, 'Socail', 'International', 15, '2023-10-05'),
(10, 'Elon Musk ថា តៃវ៉ាន់​ជាផ្នែកមួយ​របស់ចិន តែមានអី ត្រូវតៃវ៉ាន់ចំអកដាក់វិញឡើង​ស្ពឹកមុខ', 'មហាសេដ្ឋីពិភពលោក Elon Musk បាន​រងនូវប្រតិកម្មយ៉ាងខ្លាំងពីតៃវ៉ាន់ បន្ទាប់​ពីលោក​បាន​ថ្លែងក្នុង​កិច្ច​ប្រជុំ​អាជីវកម្មមួយពាក់ព័ន្ធ​នឹងគោលនយោបាយចិនតែមួយ ពោលគឺ​លោកបានចាត់ទុក​តៃវ៉ាន់​គ្រាន់តែ​ជាផ្នែកមួយ​របស់​ចិនតែប៉ុណ្ណោះ ដោយលោកបាន​ប្រៀបធៀបតៃវ៉ាន់ ដូចនឹង កោះហាវៃ ដែលជារដ្ឋមួយ​របស់​សហរដ្ឋអាមេរិក។', '051023082921_socail1.jpg', '051023082921_socail1.jpg', 1, 'Socail', 'International', 5, '2023-10-05'),
(11, 'អេមណាស់! iPhone 15 មាន​កន្លែងបង្ហាញ​ពី​ពេលវេលា​ប្រើដំបូង កាលបរិច្ឆេទ​ផលិត និង​រាប់វដ្តជីវិតថ្មទៀតផង', 'គួរដឹងដែរថា គ្រប់​ iPhone 15 ក៏នឹង​មាន​បន្ថែម​មុខងារ​សុខភាពថ្ម​ថ្មីមួយផងដែរ ដោយកំណត់​មិនឱ្យស្មាតហ្វូន​នេះ សាកថ្មលើសពី ៨០% បានឡើយ ដើម្បីរក្សាអាយុកាល​ និងគុណភាពថ្ម។ យ៉ាងណាមិញ វាក៏នៅមានមុខងារ Optimized Battery Charging ដែលពេលសាកដល់ ៨០% គឺវានឹងមិនងាយសាកឡើងថែមទៀតទេ ដើម្បីកាត់បន្ថយពេលវេលា​កុំឱ្យឆាប់សាកពេញពេក ព្រមទាំងមួយទៀត None គឺ​មិនត្រូវការមុខងារជំនួយថ្មពេលសាកឡើយ៕', '051023083023_iphone12.jpg', '051023083023_iphone12.jpg', 2, 'Entertainment', 'International', 3, '2023-10-05'),
(13, 'Ronaldo ធ្លាប់មានជំងឺបេះដូង ប៉ុន្តែឧបសគ្គនេះមិនអាចបញ្ឈប់គេបានឡើយ រហូតក្លាយជាកីឡាករឆ្នើម', 'បន្ទាប់ពីបានជួយឱ្យក្លឹប Man Utd ឈ្នះពាន Champions League នៅក្នុងឆ្នាំ 2008 Ronaldo បានឈ្នះពានកីឡាករល្អបំផុតលើលោក ប្រចាំឆ្នាំរបស់ FIFA។ នៅរដូវកាលបន្ទាប់ ក្នុងឆ្នាំ 2009 Ronaldo បានជួយ Man Utd ម្តងទៀត ឡើងទៅកាន់វគ្គផ្តាច់ព្រ័ត្រ Champions League ប៉ុន្តែបានចាញ់ FC Barcelona។ នៅក្នុងវិថីបាល់ទាត់ Ronaldo បានផ្លាស់ទៅកាន់ទឹកដីអេស្ប៉ាញ ជាទីកន្លែងដែលរូបគេបានលេងឱ្យក្លឹប Real Madrid ដែលជាក្លឹបមួយដែលមានពាក្យចចាមអារ៉ាមថា រូបគេនឹងផ្លាស់ទៅលេងនៅទីនោះជាច្រើនដង។ Real Madrid បានទិញ Ronaldo ទៅកាន់ទឹកដី Santiago Bernabeu នៅក្នុងតម្លៃខ្លួនដ៏ច្រើនលើសលប់នៅពេលនោះ គឺ 131 លានដុល្លារអាមេរិក។\r\n\r\nថ្វីជើងស៊ុតបញ្ចូលទីរបស់ Ronaldo នៅតែខ្លាំង និងមុតស្រួចនៅទឹកដីអេស្ប៉ាញ ដោយរូបគេរកគ្រាប់បាល់បាន 40 គ្រាប់ នៅក្នុងលីកកំពូលអេស្ប៉ាញ La Liga ក្នុងរដូវកាល 2010- 2011។ នៅក្នុងរដូវកាល 2011-2012 Ronaldo បានជួយ Real Madrid ឈ្នះពាន La Liga និងបានស៊ុតបញ្ចុលទី 46 គ្រាប់នៅពេលនោះ។ រូបគេបានស៊ុតបញ្ចូលទី 66 គ្រាប់ នៅក្នុងការបង្ហាញខ្លួន 56 លើក ជាមួយ Real Madrid និង ជម្រើសជាតិព័រទុយហ្គាល់ នៅក្នុងឆ្នាំ 2013 ដោយធ្វើឱ្យរូបគេបានឈ្នះពាន កីឡាករល្អបំផុតលើលោករបស់ FIFA នៅឆ្នាំនោះ។', '191023082039_sport5.jpg', '191023082039_sport5.jpg', 1, 'Sport', 'International', 0, '2023-10-19'),
(14, 'Lindelof ចង់​បន្ត​លេង​ឲ្យ​ Man Utd', 'Lindelof បាន​ថ្លែង​ថា ពិត​ជា​ចង់​បន្ត​លេង​ឲ្យ​ក្លឹប​បិសាច​ក្រហម​ត​ទៅ​ទៀត ព្រោះ​បិសាច​ក្រហម​គឺ​ជា​ក្លឹប​ដែល​ខ្លួន​ចូល​ចិត្ត​ និង​ស្រលាញ់​។\r\n\r\nកុងត្រា​បច្ចុប្បន្ន​របស់ Lindelof មាន​សុពលភាព​ដល់​ខែ​មិថុនា​ ឆ្នាំ​ក្រោយ ប៉ុន្តែ​មាន​ជម្រើស​នឹង​បន្ត​ដល់​ឆ្នាំ ២០២៥ បើ​សិន​ជា​ភាគី​ក្លឹប និង​ភាគី​កីឡាករ​ព្រមព្រៀង​ចង់​បន្ត។ ពាក្យចចាមអារ៉ាមមួយ​ចំនួន​បានលើកឡើង​ថា ភាគី​ទាំង​ពីរ​កំពុង​ចរចា​គ្នាហើយលើរឿង​នេះ។\r\n\r\nLindelof បាន​មក​ចូល​រួម​ជាមួយ​បិសាច​ក្រហម​តាំង​ពី​ឆ្នាំ ២០១៧ មក។ កីឡាករ​ការពារ​សញ្ជាតិ​ស៊ុយអែត​វ័យ ២៩ ឆ្នាំ​រូប​នេះ លេង​សរុប​ឲ្យ​ក្លឹប ២៤១ លើក និង​ស៊ុត​ចូល ៣ គ្រាប់៕', '191023082148_sport6.jpg', '191023082148_sport6.jpg', 1, 'Sport', 'International', 0, '2023-10-19'),
(15, 'អង់គ្លេស កក់កៅអី ពាន Euro 2024 ក្រោយវាយបកយកឈ្នះ អុីតាលី និង ឈរកំពូលតារាងពូល C', 'អង់គ្លេស បានវាយបកត្រលប់មកវិញយ៉ាងអស្ចារ្យដើម្បីយកឈ្នះអ៊ីតាលី 3-1 នៅកីឡដ្ឋាន Wembley និងធានាកន្លែងរបស់ពួកគេនៅ Euro 2024។ ក្រុមរបស់លោក Gareth Southgate ដែលត្រូវការត្រឹមតែមួយពិន្ទុប៉ុណ្ណោះដើម្បីមានសិទ្ធិសម្រាប់ការប្រកួតនារដូវក្តៅខាងមុខ បានវាយបកតាមពីក្រោយការបើកឆាកដំបូង ស៊ុតបញ្ចូលទីដោយកីឡាករ Gianluca Scamacca របស់អ៊ីតាលី។\r\n\r\nជ័យជម្នះនេះបានធ្វើឱ្យអង់គ្លេសមាន 16 ពិន្ទុក្នុងពូល C នាំមុខ 3 ពិន្ទុលើក្រុមចំណាត់ថ្នាក់លេខ 2 អ៊ុយក្រែន និងធានាកៅអី ឈានទៅប្រកួត Euro 2024 នៅរដូវក្ដៅឆ្នាំក្រោយនៅ ប្រទេសអាឡឺម៉ង់ ក្នុងនាមជាក្រុមដែលឈរនៅចំណាត់ថ្នាក់កំពូលក្នុងពូល ក្នុងវគ្គជម្រុះ៕', '191023082232_sport7.jpg', '191023082232_sport7.jpg', 1, 'Sport', 'International', 2, '2023-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `email`, `password`, `profile`) VALUES
(1, 'Kim Long', 'kimlong@gmail.com', '202cb962ac59075b964b07152d234b70', '270923081324_Me.jpg'),
(2, 'Sok', 'sok@gmail.com', '202cb962ac59075b964b07152d234b70', '270923081445_hackers_0.jpg'),
(3, 'Long', 'long@gmail.com', '202cb962ac59075b964b07152d234b70', '021023074018_Me.jpg'),
(4, 'sok', 'sok@gmial.com', '202cb962ac59075b964b07152d234b70', '091023074909_socail1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_about_us`
--
ALTER TABLE `tbl_about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_follow_us`
--
ALTER TABLE `tbl_follow_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_logo`
--
ALTER TABLE `tbl_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_about_us`
--
ALTER TABLE `tbl_about_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_follow_us`
--
ALTER TABLE `tbl_follow_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_logo`
--
ALTER TABLE `tbl_logo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
