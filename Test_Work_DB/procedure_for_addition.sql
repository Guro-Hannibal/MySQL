CREATE DEFINER=`root`@`localhost` PROCEDURE `dowhile`()
INSERT INTO employees SELECT * FROM demo PARTITIONS;
