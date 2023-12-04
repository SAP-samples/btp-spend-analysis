CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);											
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_XML" (FILENAME varchar(20), FILECONTENT CLOB);											
											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_UNSPSCDimSystemView_FILES (											
		IN JOB_KEY varchar(20),									
		IN JOB_FILE_NAME CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
	DECLARE counter int;										
	DECLARE V_JFN_SOURCE CLOB;										
	DECLARE V_JFN_TARGET CLOB;										
											
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES";										
	IF :counter = 0 										
	THEN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);									
	ELSE										
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES";									
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);									
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES";									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);									
	END IF;										
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_UNSPSCDimSystemView_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_UNSPSCDimSystemView_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_UNSPSCDimSystemView_XML (											
		IN FILENAME varchar(20),									
		IN FILECONTENT CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_XML" VALUES (									
				FILENAME,							
				FILECONTENT);							
											
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."UNSPSCDimSystemView" (									
			SELECT * FROM								
				XMLTABLE('resultset/row' PASSING							
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_UNSPSCDimSystemView_XML"."FILECONTENT"							
				COLUMNS							
					ariba_code_enabled		NVARCHAR(5000) 		PATH		'ariba_code_enabled',
					parent_code_id		NVARCHAR(5000) 		PATH		'parent_code_id',
					custom_category_l6		NVARCHAR(5000) 		PATH		'custom_category_l6',
					custom_category_l5		NVARCHAR(5000) 		PATH		'custom_category_l5',
					custom_category_l4		NVARCHAR(5000) 		PATH		'custom_category_l4',
					custom_category_l3		NVARCHAR(5000) 		PATH		'custom_category_l3',
					custom_category_l2		NVARCHAR(5000) 		PATH		'custom_category_l2',
					custom_category_l1		NVARCHAR(5000) 		PATH		'custom_category_l1',
					custom_category2_l6		NVARCHAR(5000) 		PATH		'custom_category2_l6',
					custom_category2_l5		NVARCHAR(5000) 		PATH		'custom_category2_l5',
					custom_category2_l4		NVARCHAR(5000) 		PATH		'custom_category2_l4',
					custom_category2_l3		NVARCHAR(5000) 		PATH		'custom_category2_l3',
					custom_category2_l2		NVARCHAR(5000) 		PATH		'custom_category2_l2',
					custom_category2_l1		NVARCHAR(5000) 		PATH		'custom_category2_l1',
					custom_category1_l6		NVARCHAR(5000) 		PATH		'custom_category1_l6',
					custom_category1_l5		NVARCHAR(5000) 		PATH		'custom_category1_l5',
					custom_category1_l4		NVARCHAR(5000) 		PATH		'custom_category1_l4',
					custom_category1_l3		NVARCHAR(5000) 		PATH		'custom_category1_l3',
					custom_category1_l2		NVARCHAR(5000) 		PATH		'custom_category1_l2',
					custom_category1_l1		NVARCHAR(5000) 		PATH		'custom_category1_l1',
					code_name		NVARCHAR(5000) 		PATH		'code_name',
					code_id		NVARCHAR(5000) 		PATH		'code_id',
					category_l3		NVARCHAR(5000) 		PATH		'category_l3',
					category_l2		NVARCHAR(5000) 		PATH		'category_l2',
					category_l1		NVARCHAR(5000) 		PATH		'category_l1',
					category_id_l3		NVARCHAR(5000) 		PATH		'category_id_l3',
					category_id_l2		NVARCHAR(5000) 		PATH		'category_id_l2',
					category_id_l1		NVARCHAR(5000) 		PATH		'category_id_l1',
					ariba_parent_code_id		NVARCHAR(5000) 		PATH		'ariba_parent_code_id',
					ariba_code_version		NVARCHAR(5000) 		PATH		'ariba_code_version',
					ariba_code_name		NVARCHAR(5000) 		PATH		'ariba_code_name',
					ariba_code_id		NVARCHAR(5000) 		PATH		'ariba_code_id',
					ariba_code_display_id		NVARCHAR(5000) 		PATH		'ariba_code_display_id',
					ariba_category_l5		NVARCHAR(5000) 		PATH		'ariba_category_l5',
					ariba_category_l4		NVARCHAR(5000) 		PATH		'ariba_category_l4',
					ariba_category_l3		NVARCHAR(5000) 		PATH		'ariba_category_l3',
					ariba_category_l2		NVARCHAR(5000) 		PATH		'ariba_category_l2',
					ariba_category_l1		NVARCHAR(5000) 		PATH		'ariba_category_l1',
					ariba_category_id_l5		NVARCHAR(5000) 		PATH		'ariba_category_id_l5',
					ariba_category_id_l4		NVARCHAR(5000) 		PATH		'ariba_category_id_l4',
					ariba_category_id_l3		NVARCHAR(5000) 		PATH		'ariba_category_id_l3',
					ariba_category_id_l2		NVARCHAR(5000) 		PATH		'ariba_category_id_l2',
					ariba_category_id_l1		NVARCHAR(5000) 		PATH		'ariba_category_id_l1',
					code_supplier_opt_cost_percentage		NVARCHAR(5000) 		PATH		'code_supplier_opt_cost_percentage',
					code_supplier_count		NVARCHAR(5000) 		PATH		'code_supplier_count',
					code_sum_of_supplier_opt_cost		NVARCHAR(5000) 		PATH		'code_sum_of_supplier_opt_cost',
					code_sum_of_price_var_cost		NVARCHAR(5000) 		PATH		'code_sum_of_price_var_cost',
					code_sum_of_line_item_count		NVARCHAR(5000) 		PATH		'code_sum_of_line_item_count',
					code_sum_of_invoice_count		NVARCHAR(5000) 		PATH		'code_sum_of_invoice_count',
					code_sum_of_amount		NVARCHAR(5000) 		PATH		'code_sum_of_amount',
					code_price_var_cost_percentage		NVARCHAR(5000) 		PATH		'code_price_var_cost_percentage',
					code_part_count		NVARCHAR(5000) 		PATH		'code_part_count',
					code_line_items_per_invoice		NVARCHAR(5000) 		PATH		'code_line_items_per_invoice',
					code_level_id		NVARCHAR(5000) 		PATH		'code_level_id',
					code_invoice_spend_variance		NVARCHAR(5000) 		PATH		'code_invoice_spend_variance',
					code_invoice_spend_percentile		NVARCHAR(5000) 		PATH		'code_invoice_spend_percentile',
					code_invoice_spend_per_supplier		NVARCHAR(5000) 		PATH		'code_invoice_spend_per_supplier',
					code_invoice_spend_per_part		NVARCHAR(5000) 		PATH		'code_invoice_spend_per_part',
					code_invoice_spend_per_line_item		NVARCHAR(5000) 		PATH		'code_invoice_spend_per_line_item',
					code_invoice_spend_per_invoice		NVARCHAR(5000) 		PATH		'code_invoice_spend_per_invoice',
					code_invoice_spend_per_cost_center		NVARCHAR(5000) 		PATH		'code_invoice_spend_per_cost_center',
					code_erpsupplier_count_per_enriched_supplier		NVARCHAR(5000) 		PATH		'code_erpsupplier_count_per_enriched_supplier',
					code_cost_center_count		NVARCHAR(5000) 		PATH		'code_cost_center_count'
			) as XTABLE  								
		);									
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_UNSPSCDimSystemView_XML"; 									
	END;										
---------------------------											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
											
