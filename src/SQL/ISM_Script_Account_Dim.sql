CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);											
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_XML" (FILENAME varchar(20), FILECONTENT CLOB);											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_ACCOUNTDIM_FILES (											
		IN JOB_KEY varchar(20),									
		IN JOB_FILE_NAME CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
	DECLARE counter int;										
	DECLARE V_JFN_SOURCE CLOB;										
	DECLARE V_JFN_TARGET CLOB;										
											
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES";										
	IF :counter = 0 										
	THEN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);									
	ELSE										
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES";									
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);									
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES";									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);									
	END IF;										
END;											
----------------------------------------											
											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_ACCOUNTDIM_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES";									
END;											
											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_ACCOUNTDIM_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_ACCOUNTDIM_XML (											
		IN FILENAME varchar(20),									
		IN FILECONTENT CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_XML" VALUES (									
				FILENAME,							
				FILECONTENT);							
											
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."AccountDimSystem" (									
			SELECT * FROM								
				XMLTABLE('resultset/row' PASSING							
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_ACCOUNTDIM_XML"."FILECONTENT"							
				COLUMNS							
					source_system 	NVARCHAR(5000) 			PATH	'source_system',	
					major_account_name 	NVARCHAR(5000) 		PATH	'major_account_name',		
					major_account_id 	NVARCHAR(5000) 		PATH	'major_account_id',		
					company_code_rank 	NVARCHAR(5000) 		PATH	'company_code_rank',		
					company_code 	NVARCHAR(5000) 			PATH	'company_code',	
					chart_of_accounts_name 	NVARCHAR(5000) 	PATH	'chart_of_accounts_name',			
					chart_of_accounts_id 	NVARCHAR(5000) 	PATH	'chart_of_accounts_id',			
					account_name_rank 	NVARCHAR(5000) 		PATH	'account_name_rank',		
					account_name 	NVARCHAR(5000) 			PATH	'account_name',	
					account_id_rank 	NVARCHAR(5000) 		PATH	'account_id_rank',		
					account_id 	NVARCHAR(5000) 				PATH	'account_id'
			) as XTABLE  								
		);									
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_ACCOUNTDIM_XML"; 									
	END;										
