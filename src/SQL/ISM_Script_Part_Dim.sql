CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);										
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_XML" (FILENAME varchar(20), FILECONTENT CLOB);										
										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_PARTDIM_FILES (										
		IN JOB_KEY varchar(20),								
		IN JOB_FILE_NAME CLOB)								
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
	DECLARE counter int;									
	DECLARE V_JFN_SOURCE CLOB;									
	DECLARE V_JFN_TARGET CLOB;									
										
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES";									
	IF :counter = 0 									
	THEN									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);								
	ELSE									
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES";								
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);								
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES";								
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);								
	END IF;									
END;										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_PARTDIM_FILES ()										
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES";								
END;										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_PARTDIM_FILES ()										
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_FILES";								
END;										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_PARTDIM_XML (										
		IN FILENAME varchar(20),								
		IN FILECONTENT CLOB)								
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_XML" VALUES (								
				FILENAME,						
				FILECONTENT);						
										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."PartDimSystem" (								
			SELECT * FROM							
				XMLTABLE('resultset/row' PASSING						
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_PARTDIM_XML"."FILECONTENT"						
				COLUMNS						
					stock_indicator		NVARCHAR(5000) 		PATH	'stock_indicator',
					supplier_part_number		NVARCHAR(5000) 		PATH	'supplier_part_number',
					supplier_part_auxiliary_id		NVARCHAR(5000) 		PATH	'supplier_part_auxiliary_id',
					source_system		NVARCHAR(5000) 		PATH	'source_system',
					part_name_rank		NVARCHAR(5000) 		PATH	'part_name_rank',
					part_name		NVARCHAR(5000) 		PATH	'part_name',
					part_key3		NVARCHAR(5000) 		PATH	'part_key3',
					part_key2		NVARCHAR(5000) 		PATH	'part_key2',
					part_key1		NVARCHAR(5000) 		PATH	'part_key1',
					part_flex_text3		NVARCHAR(5000) 		PATH	'part_flex_text3',
					part_flex_text2		NVARCHAR(5000) 		PATH	'part_flex_text2',
					part_flex_text1		NVARCHAR(5000) 		PATH	'part_flex_text1',
					origin_country		NVARCHAR(5000) 		PATH	'origin_country',
					material_composition		NVARCHAR(5000) 		PATH	'material_composition',
					manufacturer		NVARCHAR(5000) 		PATH	'manufacturer',
					man_part_number		NVARCHAR(5000) 		PATH	'man_part_number',
					lead_time		NVARCHAR(5000) 		PATH	'lead_time',
					internal_number_revision		NVARCHAR(5000) 		PATH	'internal_number_revision',
					internal_number		NVARCHAR(5000) 		PATH	'internal_number',
					description2		NVARCHAR(5000) 		PATH	'description2',
					description1		NVARCHAR(5000) 		PATH	'description1',
					common_supplier_id		NVARCHAR(5000) 		PATH	'common_supplier_id',
					standard_cost		NVARCHAR(5000) 		PATH	'standard_cost',
					forecast_usage3		NVARCHAR(5000) 		PATH	'forecast_usage3',
					forecast_usage2		NVARCHAR(5000) 		PATH	'forecast_usage2',
					forecast_usage1		NVARCHAR(5000) 		PATH	'forecast_usage1',
					flex_field3		NVARCHAR(5000) 		PATH	'flex_field3',
					flex_field2		NVARCHAR(5000) 		PATH	'flex_field2',
					flex_field1		NVARCHAR(5000) 		PATH	'flex_field1'
			) as XTABLE  							
		);								
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_PARTDIM_XML"; 								
	END;									
---------------------------										
