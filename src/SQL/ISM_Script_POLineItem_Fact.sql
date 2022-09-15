											
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);											
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_XML" (FILENAME varchar(20), FILECONTENT CLOB);											
											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_POLineItemFactSystem_FILES (											
		IN JOB_KEY varchar(20),									
		IN JOB_FILE_NAME CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
	DECLARE counter int;										
	DECLARE V_JFN_SOURCE CLOB;										
	DECLARE V_JFN_TARGET CLOB;										
											
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES";										
	IF :counter = 0 										
	THEN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);									
	ELSE										
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES";									
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);									
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES";									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);									
	END IF;										
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_POLineItemFactSystem_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_POLineItemFactSystem_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_POLineItemFactSystem_XML (											
		IN FILENAME varchar(20),									
		IN FILECONTENT CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_XML" VALUES (									
				FILENAME,							
				FILECONTENT);							
											
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."POLineItemFactSystem" (									
			SELECT * FROM								
				XMLTABLE('resultset/row' PASSING							
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_POLineItemFactSystem_XML"."FILECONTENT"							
				COLUMNS							
					account_source_system		NVARCHAR(5000) 		PATH		'account_source_system',
					account_company_code		NVARCHAR(5000) 		PATH		'account_company_code',
					account_account_id		NVARCHAR(5000) 		PATH		'account_account_id',
					amount_range_range_description		NVARCHAR(5000) 		PATH		'amount_range_range_description',
					commodity_source_commodity_domain		NVARCHAR(5000) 		PATH		'commodity_source_commodity_domain',
					commodity_commodity_id		NVARCHAR(5000) 		PATH		'commodity_commodity_id',
					company_site_source_system		NVARCHAR(5000) 		PATH		'company_site_source_system',
					company_site_site_id		NVARCHAR(5000) 		PATH		'company_site_site_id',
					contract_source_system		NVARCHAR(5000) 		PATH		'contract_source_system',
					contract_contract_id		NVARCHAR(5000) 		PATH		'contract_contract_id',
					cost_center_source_system		NVARCHAR(5000) 		PATH		'cost_center_source_system',
					cost_center_cost_center_id		NVARCHAR(5000) 		PATH		'cost_center_cost_center_id',
					cost_center_company_code		NVARCHAR(5000) 		PATH		'cost_center_company_code',
					erpcommodity_source_system		NVARCHAR(5000) 		PATH		'erpcommodity_source_system',
					erpcommodity_commodity_id		NVARCHAR(5000) 		PATH		'erpcommodity_commodity_id',
					flex_date1_day		NVARCHAR(5000) 		PATH		'flex_date1_day',
					flex_date2_day		NVARCHAR(5000) 		PATH		'flex_date2_day',
					flex_date3_day		NVARCHAR(5000) 		PATH		'flex_date3_day',
					flex_date4_day		NVARCHAR(5000) 		PATH		'flex_date4_day',
					flex_date5_day		NVARCHAR(5000) 		PATH		'flex_date5_day',
					flex_dimension1_source_system		NVARCHAR(5000) 		PATH		'flex_dimension1_source_system',
					flex_dimension1_field_id		NVARCHAR(5000) 		PATH		'flex_dimension1_field_id',
					flex_dimension10_source_system		NVARCHAR(5000) 		PATH		'flex_dimension10_source_system',
					flex_dimension10_field_id4		NVARCHAR(5000) 		PATH		'flex_dimension10_field_id4',
					flex_dimension11_source_system		NVARCHAR(5000) 		PATH		'flex_dimension11_source_system',
					flex_dimension11_field_id4		NVARCHAR(5000) 		PATH		'flex_dimension11_field_id4',
					flex_dimension12_source_system		NVARCHAR(5000) 		PATH		'flex_dimension12_source_system',
					flex_dimension12_field_id4		NVARCHAR(5000) 		PATH		'flex_dimension12_field_id4',
					flex_dimension13_source_system		NVARCHAR(5000) 		PATH		'flex_dimension13_source_system',
					flex_dimension13_field_id8		NVARCHAR(5000) 		PATH		'flex_dimension13_field_id8',
					flex_dimension14_source_system		NVARCHAR(5000) 		PATH		'flex_dimension14_source_system',
					flex_dimension14_field_id8		NVARCHAR(5000) 		PATH		'flex_dimension14_field_id8',
					flex_dimension2_source_system		NVARCHAR(5000) 		PATH		'flex_dimension2_source_system',
					flex_dimension2_field_id		NVARCHAR(5000) 		PATH		'flex_dimension2_field_id',
					flex_dimension3_source_system		NVARCHAR(5000) 		PATH		'flex_dimension3_source_system',
					flex_dimension3_field_id		NVARCHAR(5000) 		PATH		'flex_dimension3_field_id',
					flex_dimension4_source_system		NVARCHAR(5000) 		PATH		'flex_dimension4_source_system',
					flex_dimension4_field_id		NVARCHAR(5000) 		PATH		'flex_dimension4_field_id',
					flex_dimension5_source_system		NVARCHAR(5000) 		PATH		'flex_dimension5_source_system',
					flex_dimension5_field_id		NVARCHAR(5000) 		PATH		'flex_dimension5_field_id',
					flex_dimension6_source_system		NVARCHAR(5000) 		PATH		'flex_dimension6_source_system',
					flex_dimension6_field_id4		NVARCHAR(5000) 		PATH		'flex_dimension6_field_id4',
					flex_dimension7_source_system		NVARCHAR(5000) 		PATH		'flex_dimension7_source_system',
					flex_dimension7_field_id		NVARCHAR(5000) 		PATH		'flex_dimension7_field_id',
					flex_dimension8_source_system		NVARCHAR(5000) 		PATH		'flex_dimension8_source_system',
					flex_dimension8_field_id		NVARCHAR(5000) 		PATH		'flex_dimension8_field_id',
					flex_dimension9_source_system		NVARCHAR(5000) 		PATH		'flex_dimension9_source_system',
					flex_dimension9_field_id		NVARCHAR(5000) 		PATH		'flex_dimension9_field_id',
					load_create_time		NVARCHAR(5000) 		PATH		'load_create_time',
					load_update_time		NVARCHAR(5000) 		PATH		'load_update_time',
					ordered_date_day		NVARCHAR(5000) 		PATH		'ordered_date_day',
					part_source_system		NVARCHAR(5000) 		PATH		'part_source_system',
					part_part_key3		NVARCHAR(5000) 		PATH		'part_part_key3',
					part_part_key2		NVARCHAR(5000) 		PATH		'part_part_key2',
					part_part_key1		NVARCHAR(5000) 		PATH		'part_part_key1',
					requester_user_id		NVARCHAR(5000) 		PATH		'requester_user_id',
					requester_source_system		NVARCHAR(5000) 		PATH		'requester_source_system',
					requester_password_adapter		NVARCHAR(5000) 		PATH		'requester_password_adapter',
					service_end_date_day		NVARCHAR(5000) 		PATH		'service_end_date_day',
					service_start_date_day		NVARCHAR(5000) 		PATH		'service_start_date_day',
					source_system_source_system_id		NVARCHAR(5000) 		PATH		'source_system_source_system_id',
					supplier_supplier_location_id		NVARCHAR(5000) 		PATH		'supplier_supplier_location_id',
					supplier_supplier_id		NVARCHAR(5000) 		PATH		'supplier_supplier_id',
					supplier_source_system		NVARCHAR(5000) 		PATH		'supplier_source_system',
					unspsc_ariba_code_id		NVARCHAR(5000) 		PATH		'unspsc_ariba_code_id',
					unit_of_measure_unit_of_measure_id		NVARCHAR(5000) 		PATH		'unit_of_measure_unit_of_measure_id',
					poline_number		NVARCHAR(5000) 		PATH		'poline_number',
					poid		NVARCHAR(5000) 		PATH		'poid',
					original_unit_of_measure		NVARCHAR(5000) 		PATH		'original_unit_of_measure',
					orig_currency_code		NVARCHAR(5000) 		PATH		'orig_currency_code',
					open_po		NVARCHAR(5000) 		PATH		'open_po',
					line_type		NVARCHAR(5000) 		PATH		'line_type',
					flex_string9		NVARCHAR(5000) 		PATH		'flex_string9',
					flex_string8		NVARCHAR(5000) 		PATH		'flex_string8',
					flex_string7		NVARCHAR(5000) 		PATH		'flex_string7',
					flex_string6		NVARCHAR(5000) 		PATH		'flex_string6',
					flex_string5		NVARCHAR(5000) 		PATH		'flex_string5',
					flex_string4		NVARCHAR(5000) 		PATH		'flex_string4',
					flex_string3		NVARCHAR(5000) 		PATH		'flex_string3',
					flex_string2		NVARCHAR(5000) 		PATH		'flex_string2',
					flex_string10		NVARCHAR(5000) 		PATH		'flex_string10',
					flex_string1		NVARCHAR(5000) 		PATH		'flex_string1',
					extra_poline_key		NVARCHAR(5000) 		PATH		'extra_poline_key',
					extra_pokey		NVARCHAR(5000) 		PATH		'extra_pokey',
					description		NVARCHAR(5000) 		PATH		'description',
					contract_id		NVARCHAR(5000) 		PATH		'contract_id',
					split_accounting_number		NVARCHAR(5000) 		PATH		'split_accounting_number',
					quantity		NVARCHAR(5000) 		PATH		'quantity',
					price_var_cost		NVARCHAR(5000) 		PATH		'price_var_cost',
					pocount		NVARCHAR(5000) 		PATH		'pocount',
					original_quantity		NVARCHAR(5000) 		PATH		'original_quantity',
					orig_amount		NVARCHAR(5000) 		PATH		'orig_amount',
					max_amount		NVARCHAR(5000) 		PATH		'max_amount',
					line_item_count		NVARCHAR(5000) 		PATH		'line_item_count',
					flex_measure5		NVARCHAR(5000) 		PATH		'flex_measure5',
					flex_measure4		NVARCHAR(5000) 		PATH		'flex_measure4',
					flex_measure3		NVARCHAR(5000) 		PATH		'flex_measure3',
					flex_measure2		NVARCHAR(5000) 		PATH		'flex_measure2',
					flex_measure1		NVARCHAR(5000) 		PATH		'flex_measure1',
					estimated_savings		NVARCHAR(5000) 		PATH		'estimated_savings',
					duration		NVARCHAR(5000) 		PATH		'duration',
					amount		NVARCHAR(5000) 		PATH		'amount'
			) as XTABLE  								
		);									
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_POLineItemFactSystem_XML"; 									
	END;										
---------------------------											
