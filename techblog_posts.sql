-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: techblog
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(150) NOT NULL,
  `pcontent` longtext,
  `pcode` longtext,
  `ppic` varchar(100) DEFAULT NULL,
  `pdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cid` int NOT NULL,
  `userid` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`cid`),
  KEY `id_idx` (`userid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `catagory` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,'Python List','Python Lists are just like dynamically sized arrays, declared in other languages (vector in C++ and ArrayList in Java). In simple language, a list is a collection of things, enclosed in [ ] and separated by commas. \r\nLists are the simplest containers that are an integral part of the Python language. Lists need not be homogeneous always which makes it the most powerful tool in Python. A single list may contain DataTypes like Integers, Strings, as well as Objects. Lists are mutable, and hence, they can be altered even after their creation.','\r\n# Python program to demonstrate\r\n# Creation of List\r\n \r\n# Creating a List\r\nList = []\r\nprint(\"Blank List: \")\r\nprint(List)\r\n \r\n# Creating a List of numbers\r\nList = [10, 20, 14]\r\nprint(\"\\nList of numbers: \")\r\nprint(List)\r\n \r\n# Creating a List of strings and accessing\r\n# using index\r\nList = [\"Geeks\", \"For\", \"Geeks\"]\r\nprint(\"\\nList Items: \")\r\nprint(List[0])\r\nprint(List[2])','list.jfif','2023-01-11 17:17:25',101,10022),(6,'Java Abstract class','A class which is declared as abstract is known as an abstract class. It can have abstract and non-abstract methods. It needs to be extended and its method implemented. It cannot be instantiated.\r\n\r\nPoints to Remember:\r\nAn abstract class must be declared with an abstract keyword.\r\nIt can have abstract and non-abstract methods.\r\nIt cannot be instantiated.\r\nIt can have constructors and static methods also.\r\nIt can have final methods which will force the subclass not to change the body of the method.','abstract class Bike{  \r\n  abstract void run();  \r\n}  \r\nclass Honda4 extends Bike{  \r\nvoid run(){System.out.println(\"running safely\");}  \r\npublic static void main(String args[]){  \r\n Bike obj = new Honda4();  \r\n obj.run();  \r\n}  \r\n}  ','abstract class.png','2023-01-11 17:22:00',102,10022),(7,'C pointer','Pointers in C are easy and fun to learn. Some C programming tasks are performed more easily with pointers, and other tasks, such as dynamic memory allocation, cannot be performed without using pointers. So it becomes necessary to learn pointers to become a perfect C programmer. Let\'s start learning them in simple and easy steps.\r\n\r\nAs you know, every variable is a memory location and every memory location has its address defined which can be accessed using ampersand (&) operator, which denotes an address in memory. Consider the following example, which prints the address of the variables defined â','#include <stdio.h>\r\n\r\nint main () {\r\n\r\n   int  var1;\r\n   char var2[10];\r\n\r\n   printf(\"Address of var1 variable: %x\\n\", &var1  );\r\n   printf(\"Address of var2 variable: %x\\n\", &var2  );\r\n\r\n   return 0;\r\n}','pointer.png','2023-01-11 17:26:03',103,10056),(8,'C++ Structure','We often come around situations where we need to store a group of data whether of similar data types or non-similar data types. We have seen Arrays in C++ which are used to store set of data of similar data types at contiguous memory locations.\r\nUnlike Arrays, Structures in C++ are user defined data types which are used to store group of items of non-similar data types.','\r\n// A variable declaration with structure declaration.\r\nstruct Point\r\n{\r\n   int x, y;\r\n} p1;  // The variable p1 is declared with \'Point\'\r\n \r\n \r\n// A variable declaration like basic data types\r\nstruct Point\r\n{\r\n   int x, y;\r\n};\r\n \r\nint main()\r\n{\r\n   struct Point p1;  // The variable p1 is declared like a normal variable\r\n}','structure.jfif','2023-01-11 17:29:11',104,10056),(9,'Inser Query','MySQL INSERT statement is used to store or add data in MySQL table within the database. We can perform insertion of records in two ways using a single query in MySQL:\r\n\r\nInsert record in a single row\r\nInsert record in multiple rows','INSERT INTO People VALUES  \r\n(102, \'Joseph\', \'Developer\', 30),  \r\n(103, \'Mike\', \'Leader\', 28),  \r\n(104, \'Stephen\', \'Scientist\', 45);  ','insert.jfif','2023-01-11 17:32:50',105,10023),(10,'Binary Search','Binary Search Algorithm: The basic steps to perform Binary Search are:\r\n\r\nBegin with the mid element of the whole array as a search key.\r\nIf the value of the search key is equal to the item then return an index of the search key.\r\nOr if the value of the search key is less than the item in the middle of the interval, narrow the interval to the lower half.\r\nOtherwise, narrow it to the upper half.\r\nRepeatedly check from the second point until the value is found or the interval is empty.','class BinarySearch {  \r\n    static int binarySearch(int a[], int beg, int end, int val)    \r\n    {    \r\n        int mid;    \r\n        if(end >= beg)     \r\n        {  \r\n            mid = (beg + end)/2;    \r\n            if(a[mid] == val)    \r\n            {    \r\n                return mid+1;  /* if the item to be searched is present at middle  \r\n*/  \r\n            }    \r\n            /* if the item to be searched is smaller than middle, then it can only  \r\nbe in left subarray */  \r\n            else if(a[mid] < val)     \r\n            {  \r\n                return binarySearch(a, mid+1, end, val);    \r\n            }    \r\n            /* if the item to be searched is greater than middle, then it can only be  \r\nin right subarray */  \r\n            else    \r\n            {  \r\n                return binarySearch(a, beg, mid-1, val);    \r\n            }    \r\n        }    \r\n        return -1;    \r\n    }   \r\n    public static void main(String args[]) {  \r\n        int a[] = {8, 10, 22, 27, 37, 44, 49, 55, 69}; // given array  \r\n        int val = 37; // value to be searched  \r\n        int n = a.length; // size of array  \r\n        int res = binarySearch(a, 0, n-1, val); // Store result  \r\n        System.out.print(\"The elements of the array are: \");  \r\n        for (int i = 0; i < n; i++)  \r\n        {  \r\n            System.out.print(a[i] + \" \");  \r\n        }  \r\n        System.out.println();  \r\n        System.out.println(\"Element to be searched is: \" + val);  \r\n        if (res == -1)  \r\n        System.out.println(\"Element is not present in the array\");  \r\n        else  \r\n        System.out.println(\"Element is present at \" + res + \" position of array\");  \r\n    }  \r\n    }  ','binary.jfif','2023-01-11 17:35:46',106,10023);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13 17:03:57
