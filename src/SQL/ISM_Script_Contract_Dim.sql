CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);												
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTEDIM_XML" (FILENAME varchar(20), FILECONTENT CLOB);												
												
----------------------------------------												
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_CONTRACTDIM_FILES (												
		IN JOB_KEY varchar(20),										
		IN JOB_FILE_NAME CLOB)										
	LANGUAGE SQLSCRIPT AS											
	BEGIN											
	DECLARE counter int;											
	DECLARE V_JFN_SOURCE CLOB;											
	DECLARE V_JFN_TARGET CLOB;											
												
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES";											
	IF :counter = 0 											
	THEN											
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);										
	ELSE											
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES";										
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);										
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES";										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);										
	END IF;											
END;												
----------------------------------------												
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_CONTRACTDIM_FILES ()												
	LANGUAGE SQLSCRIPT AS											
	BEGIN											
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES";										
END;												
----------------------------------------												
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_CONTRACTDIM_FILES ()												
	LANGUAGE SQLSCRIPT AS											
	BEGIN											
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTDIM_FILES";										
END;												
----------------------------------------												
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_CONTRACTEDIM_XML (												
		IN FILENAME varchar(20),										
		IN FILECONTENT CLOB)										
	LANGUAGE SQLSCRIPT AS											
	BEGIN											
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTEDIM_XML" VALUES (										
				FILENAME,								
				FILECONTENT);								
												
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."ContractDimSystem" (										
			SELECT * FROM									
				XMLTABLE('resultset/row' PASSING								
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_CONTRACTEDIM_XML"."FILECONTENT"								
				COLUMNS								
					agreement_date		NVARCHAR(5000) 		PATH	'agreement_date',		
					effective_date		NVARCHAR(5000) 		PATH	'effective_date',		
					expiration_date		NVARCHAR(5000) 		PATH	'expiration_date',		
					is_evergreen		NVARCHAR(5000) 		PATH	'is_evergreen',		
					source_system		NVARCHAR(5000) 		PATH	'source_system',		
					release_type		NVARCHAR(5000) 		PATH	'release_type',		
					related_id			NVARCHAR(5000) 		PATH	'related_id',	
					parent_contract_id	NVARCHAR(5000) 		PATH	'parent_contract_id',			
					min_limit			NVARCHAR(5000) 		PATH	'min_limit',	
					max_limit			NVARCHAR(5000) 		PATH	'max_limit',	
					contract_type		NVARCHAR(5000) 		PATH	'contract_type',		
					contract_name_l1	NVARCHAR(5000) 		PATH	'contract_name_l1',			
					contract_name		NVARCHAR(5000) 		PATH	'contract_name',		
					contract_level		NVARCHAR(5000) 		PATH	'contract_level',		
					contract_id_l1		NVARCHAR(5000) 		PATH	'contract_id_l1',		
					contract_id			NVARCHAR(5000) 		PATH	'contract_id',	
					contract_currency	NVARCHAR(5000) 		PATH	'contract_currency',			
					savings_percentage	NVARCHAR(5000) 		PATH	'savings_percentage',			
					proposed_amount		NVARCHAR(5000) 		PATH	'proposed_amount',		
					amount				NVARCHAR(5000) 		PATH	'amount',
					acl_id				NVARCHAR(5000) 		PATH	'acl_id'
			) as XTABLE  									
		);										
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_CONTRACTEDIM_XML"; 										
	END;											
---------------------------												
