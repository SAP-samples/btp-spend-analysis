										
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);										
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_XML" (FILENAME varchar(20), FILECONTENT CLOB);										
										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_COSTCENTERDIM_FILES (										
		IN JOB_KEY varchar(20),								
		IN JOB_FILE_NAME CLOB)								
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
	DECLARE counter int;									
	DECLARE V_JFN_SOURCE CLOB;									
	DECLARE V_JFN_TARGET CLOB;									
										
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES";									
	IF :counter = 0 									
	THEN									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);								
	ELSE									
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES";								
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);								
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES";								
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);								
	END IF;									
END;										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_COSTCENTERDIM_FILES ()										
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES";								
END;										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_COSTCENTERDIM_FILES ()										
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_FILES";								
END;										
----------------------------------------										
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_COSTCENTERDIM_XML (										
		IN FILENAME varchar(20),								
		IN FILECONTENT CLOB)								
	LANGUAGE SQLSCRIPT AS									
	BEGIN									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_XML" VALUES (								
				FILENAME,						
				FILECONTENT);						
										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."CostCenterDimSystem" (								
			SELECT * FROM							
				XMLTABLE('resultset/row' PASSING						
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_COSTCENTERDIM_XML"."FILECONTENT"						
				COLUMNS						
					source_system		NVARCHAR(5000) 		PATH	'source_system',
					management_l8		NVARCHAR(5000) 		PATH	'management_l8',
					management_l7		NVARCHAR(5000) 		PATH	'management_l7',
					management_l6		NVARCHAR(5000) 		PATH	'management_l6',
					management_l5		NVARCHAR(5000) 		PATH	'management_l5',
					management_l4		NVARCHAR(5000) 		PATH	'management_l4',
					management_l3		NVARCHAR(5000) 		PATH	'management_l3',
					management_l2		NVARCHAR(5000) 		PATH	'management_l2',
					management_l1		NVARCHAR(5000) 		PATH	'management_l1',
					cost_center_name		NVARCHAR(5000) 		PATH	'cost_center_name',
					cost_center_id		NVARCHAR(5000) 		PATH	'cost_center_id',
					company_code		NVARCHAR(5000) 		PATH	'company_code'
			) as XTABLE  							
		);								
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_COSTCENTERDIM_XML"; 								
	END;									
---------------------------										
