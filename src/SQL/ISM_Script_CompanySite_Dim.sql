CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);															
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_XML" (FILENAME varchar(20), FILECONTENT CLOB);															
----------------------------------------															
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_COMPANYSITEDIM_FILES (															
		IN JOB_KEY varchar(20),													
		IN JOB_FILE_NAME CLOB)													
	LANGUAGE SQLSCRIPT AS														
	BEGIN														
	DECLARE counter int;														
	DECLARE V_JFN_SOURCE CLOB;														
	DECLARE V_JFN_TARGET CLOB;														
															
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES";														
	IF :counter = 0 														
	THEN														
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);													
	ELSE														
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES";													
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);													
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES";													
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);													
	END IF;														
END;															
----------------------------------------															
															
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_COMPANYSITEDIM_FILES ()															
	LANGUAGE SQLSCRIPT AS														
	BEGIN														
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES";													
END;															
															
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_COMPANYSITEDIM_FILES ()															
	LANGUAGE SQLSCRIPT AS														
	BEGIN														
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_FILES";													
END;															
----------------------------------------															
															
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_COMPANYSITEDIM_XML (															
		IN FILENAME varchar(20),													
		IN FILECONTENT CLOB)													
	LANGUAGE SQLSCRIPT AS														
	BEGIN														
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_XML" VALUES (													
				FILENAME,											
				FILECONTENT);											
															
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."CompanySiteDimSystem" (													
			SELECT * FROM												
				XMLTABLE('resultset/row' PASSING											
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_COMPANYSITEDIM_XML"."FILECONTENT"											
				COLUMNS											
					street_address 				NVARCHAR(5000) 			PATH	'street_address',		
					state 						NVARCHAR(5000) 			PATH	'state',
					source_system 				NVARCHAR(5000) 			PATH	'source_system',		
					site_name 					NVARCHAR(5000) 			PATH	'site_name',	
					site_id 					NVARCHAR(5000) 			PATH	'site_id',	
					region 						NVARCHAR(5000) 			PATH	'region',
					postal_code 				NVARCHAR(5000) 			PATH	'postal_code',		
					flex_field3 				NVARCHAR(5000) 			PATH	'flex_field3',		
					flex_field2 				NVARCHAR(5000) 			PATH	'flex_field2',		
					flex_field1 				NVARCHAR(5000) 			PATH	'flex_field1',		
					country 					NVARCHAR(5000) 			PATH	'country',	
					company_level3 				NVARCHAR(5000) 			PATH	'company_level3',		
					company_level2 				NVARCHAR(5000) 			PATH	'company_level2',		
					company_level1 				NVARCHAR(5000) 			PATH	'company_level1',		
					company_level0 				NVARCHAR(5000) 			PATH	'company_level0',		
					city 						NVARCHAR(5000) 			PATH	'city'
			) as XTABLE  												
		);													
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COMPANYSITEDIM_XML"; 													
	END;														
---------------------------															
