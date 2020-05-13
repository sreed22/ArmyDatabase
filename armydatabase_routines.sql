-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: armydatabase
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Temporary view structure for view `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!50001 DROP VIEW IF EXISTS `temp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `temp` AS SELECT 
 1 AS `ContractID`,
 1 AS `ContractingOfficeID`,
 1 AS `ContractingDepartmentID`,
 1 AS `ContractingAgencyID`,
 1 AS `FiscalYear`,
 1 AS `FundingOfficeID`,
 1 AS `FundingDepartmentID`,
 1 AS `FundingAgencyID`,
 1 AS `VendorID`,
 1 AS `Naics`,
 1 AS `PSC`,
 1 AS `OrganizationID`,
 1 AS `Description`,
 1 AS `url`,
 1 AS `DesciprtionofRequirement`,
 1 AS `title`,
 1 AS `Dollars`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewarmy`
--

DROP TABLE IF EXISTS `viewarmy`;
/*!50001 DROP VIEW IF EXISTS `viewarmy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewarmy` AS SELECT 
 1 AS `ContractID`,
 1 AS `ContractingOfficeID`,
 1 AS `ContractingDepartmentID`,
 1 AS `ContractingAgencyID`,
 1 AS `FiscalYear`,
 1 AS `FundingOfficeID`,
 1 AS `FundingDepartmentID`,
 1 AS `FundingAgencyID`,
 1 AS `VendorID`,
 1 AS `Naics`,
 1 AS `PSC`,
 1 AS `OrganizationID`,
 1 AS `Description`,
 1 AS `url`,
 1 AS `DesciprtionofRequirement`,
 1 AS `title`,
 1 AS `Dollars`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `temp`
--

/*!50001 DROP VIEW IF EXISTS `temp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `temp` AS select `a`.`ContractID` AS `ContractID`,`a`.`ContractingOfficeID` AS `ContractingOfficeID`,`a`.`ContractingDepartmentID` AS `ContractingDepartmentID`,`a`.`ContractingAgencyID` AS `ContractingAgencyID`,`a`.`FiscalYear` AS `FiscalYear`,`a`.`FundingOfficeID` AS `FundingOfficeID`,`a`.`FundingDepartmentID` AS `FundingDepartmentID`,`a`.`FundingAgencyID` AS `FundingAgencyID`,`a`.`VendorID` AS `VendorID`,`a`.`NAICS` AS `Naics`,`a`.`PSC` AS `PSC`,`a`.`OrganizationID` AS `OrganizationID`,`b`.`Description` AS `Description`,`b`.`url` AS `url`,`a`.`DesciprtionofRequirement` AS `DesciprtionofRequirement`,`b`.`Title` AS `title`,sum(`a`.`ActionObligation`) AS `Dollars` from (`contract` `a` left join `sam` `b` on((`a`.`ContractID` = `b`.`AwardNumber`))) group by `a`.`ContractID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewarmy`
--

/*!50001 DROP VIEW IF EXISTS `viewarmy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewarmy` AS select `a`.`ContractID` AS `ContractID`,`a`.`ContractingOfficeID` AS `ContractingOfficeID`,`a`.`ContractingDepartmentID` AS `ContractingDepartmentID`,`a`.`ContractingAgencyID` AS `ContractingAgencyID`,`a`.`FiscalYear` AS `FiscalYear`,`a`.`FundingOfficeID` AS `FundingOfficeID`,`a`.`FundingDepartmentID` AS `FundingDepartmentID`,`a`.`FundingAgencyID` AS `FundingAgencyID`,`a`.`VendorID` AS `VendorID`,`a`.`NAICS` AS `Naics`,`a`.`PSC` AS `PSC`,`a`.`OrganizationID` AS `OrganizationID`,`b`.`Description` AS `Description`,`b`.`url` AS `url`,`a`.`DesciprtionofRequirement` AS `DesciprtionofRequirement`,`b`.`Title` AS `title`,sum(`a`.`TotalContractValue`) AS `Dollars` from (`contract` `a` left join `sam` `b` on((`a`.`ContractID` = `b`.`AwardNumber`))) group by `a`.`ContractID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-13  1:35:46
