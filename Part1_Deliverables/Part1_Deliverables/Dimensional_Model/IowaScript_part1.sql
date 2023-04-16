CREATE TABLE `Dim_Date`  (
  `Date_SK` int NOT NULL,
  `Date_NK` date NULL DEFAULT NULL,
  `Date_Year` int NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Date_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_iowa_city`  (
  `City_SK` int NOT NULL AUTO_INCREMENT,
  `City` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FIPS` int NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`City_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_iowa_county`  (
  `County_SK` int NOT NULL AUTO_INCREMENT,
  `County` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `FIPS` int NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`County_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_Iowa_Liquor_Geo`  (
  `Geo_SK` int NOT NULL AUTO_INCREMENT,
  `City_SK` int NOT NULL,
  `City` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Zip_Code` int NULL DEFAULT NULL,
  `County_SK` int NOT NULL,
  `County` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `State` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Geo_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_iowa_liquor_Product_Categories`  (
  `Category_SK` int NOT NULL AUTO_INCREMENT,
  `Category_Number` int NOT NULL,
  `Category_Name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Category_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_iowa_liquor_Products`  (
  `Item_SK` int NOT NULL,
  `Item_Number` int NOT NULL,
  `Item_Number_C` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Item_Description` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Category_SK` int NULL DEFAULT NULL,
  `Vendor_SK` int NOT NULL,
  `Bottle_Volume_ml` int NULL DEFAULT NULL,
  `Pack` int NULL DEFAULT NULL,
  `Inner_Pack` int NULL DEFAULT NULL,
  `Age` int NULL DEFAULT NULL,
  `Proof` int NULL DEFAULT NULL,
  `List_Date` date NULL DEFAULT NULL,
  `UPC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `SCC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `State_Bottle_Cost` decimal(19, 4) NULL DEFAULT NULL,
  `State_Case_Cost` decimal(19, 4) NULL DEFAULT NULL,
  `State_Bottle_Retail` decimal(19, 4) NULL DEFAULT NULL,
  `Report_Date` date NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Item_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_Iowa_Liquor_Stores`  (
  `Store_SK` int NOT NULL,
  `Store_ID` int NOT NULL,
  `Store_Name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Store_Status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Address` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Zip_Code` int NULL DEFAULT NULL,
  `City_SK` int NOT NULL,
  `County_SK` int NOT NULL,
  `Report_Date` datetime NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Store_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `Dim_iowa_liquor_Vendors`  (
  `Vendor_SK` int NOT NULL,
  `Vendor_Number` int NOT NULL,
  `Vendor_Name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Vendor_SK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `fct_iowa_liquor_sales_invoice_header`  (
  `Invoice_Number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Invoice_Date` datetime(3) NOT NULL,
  `InvoiceDate_SK` int NOT NULL,
  `Store_SK` int NULL DEFAULT NULL,
  `Store_Number` int NULL DEFAULT NULL,
  `Invoice_Bottles_Sold` int NULL DEFAULT NULL,
  `Invoice_Sale_Dollars` decimal(19, 4) NULL DEFAULT NULL,
  `Invoice_Volume_Sold_Liters` decimal(19, 4) NULL DEFAULT NULL,
  `Invoice_Volume_Sold_Gallons` decimal(19, 4) NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Invoice_Number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `fct_iowa_liquor_sales_invoice_lineitem`  (
  `Invoice_Number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Invoice_Number_LineNo` int NULL DEFAULT NULL,
  `Invoice_Item_Number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Item_SK` int NOT NULL,
  `Item_Number` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Pack` int NULL DEFAULT NULL,
  `Bottle_Volume_ml` int NULL DEFAULT NULL,
  `State_Bottle_Cost` decimal(19, 4) NULL DEFAULT NULL,
  `State_Bottle_Retail` decimal(19, 4) NULL DEFAULT NULL,
  `Bottles_Sold` int NULL DEFAULT NULL,
  `Sale_Dollars` decimal(19, 4) NULL DEFAULT NULL,
  `Volume_Sold_Liters` decimal(19, 4) NULL DEFAULT NULL,
  `Volume_Sold_Gallons` decimal(19, 4) NULL DEFAULT NULL,
  `DI_JobID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DI_CreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Invoice_Item_Number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

ALTER TABLE `Dim_Date` ADD CONSTRAINT `dim_date` FOREIGN KEY (`Date_SK`) REFERENCES `fct_iowa_liquor_sales_invoice_header` (`InvoiceDate_SK`);
ALTER TABLE `Dim_iowa_city` ADD CONSTRAINT `fk_Dim_iowa_city_Dim_Iowa_Liquor_Geo_1` FOREIGN KEY (`City_SK`) REFERENCES `Dim_Iowa_Liquor_Geo` (`City_SK`);
ALTER TABLE `Dim_iowa_city` ADD CONSTRAINT `fk_Dim_iowa_city_Dim_Iowa_Liquor_Stores_1` FOREIGN KEY (`City_SK`) REFERENCES `Dim_Iowa_Liquor_Stores` (`City_SK`);
ALTER TABLE `Dim_iowa_county` ADD CONSTRAINT `fk_Dim_iowa_county_Dim_Iowa_Liquor_Geo_1` FOREIGN KEY (`County_SK`) REFERENCES `Dim_Iowa_Liquor_Geo` (`County_SK`);
ALTER TABLE `Dim_iowa_county` ADD CONSTRAINT `fk_Dim_iowa_county_Dim_Iowa_Liquor_Stores_1` FOREIGN KEY (`County_SK`) REFERENCES `Dim_Iowa_Liquor_Stores` (`County_SK`);
ALTER TABLE `Dim_iowa_liquor_Product_Categories` ADD CONSTRAINT `fk_Dim_iowa_liquor_Product_Categories_Dim_iowa_liquor_Products_1` FOREIGN KEY (`Category_SK`) REFERENCES `Dim_iowa_liquor_Products` (`Category_SK`);
ALTER TABLE `Dim_iowa_liquor_Products` ADD CONSTRAINT `fk_Dim_iowa_liquor_Products_fct_iowa_liquor_sales_invoice_lineitem_1` FOREIGN KEY (`Item_SK`) REFERENCES `fct_iowa_liquor_sales_invoice_lineitem` (`Item_SK`);
ALTER TABLE `Dim_Iowa_Liquor_Stores` ADD CONSTRAINT `fk_Dim_Iowa_Liquor_Stores_fct_iowa_liquor_sales_invoice_header_1` FOREIGN KEY (`Store_SK`) REFERENCES `fct_iowa_liquor_sales_invoice_header` (`Store_SK`);
ALTER TABLE `Dim_iowa_liquor_Vendors` ADD CONSTRAINT `fk_Dim_iowa_liquor_Vendors_Dim_iowa_liquor_Products_1` FOREIGN KEY (`Vendor_SK`) REFERENCES `Dim_iowa_liquor_Products` (`Vendor_SK`);
ALTER TABLE `fct_iowa_liquor_sales_invoice_header` ADD CONSTRAINT `fk_fct_iowa_liquor_sales_invoice_header_fct_iowa_liquor_sales_invoice_lineitem_1` FOREIGN KEY (`Invoice_Number`) REFERENCES `fct_iowa_liquor_sales_invoice_lineitem` (`Invoice_Number`);

CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `dim_invoicedate` AS SELECT
	dim_date.Date_SK AS InvoiceDate_SK, 
	dim_date.Date_NK AS Invoice_Date, 
	dim_date.Date_Year AS Invoice_Year, 
	Dim_Date.Date_SK
FROM
	dim_date,
	Dim_Date;

