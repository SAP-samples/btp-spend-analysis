CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES" (JOB_KEY varchar(20), JOB_FILE_NAME CLOB);											
CREATE COLUMN TABLE "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_XML" (FILENAME varchar(20), FILECONTENT CLOB);											
											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_SupplierDimSystem_FILES (											
		IN JOB_KEY varchar(20),									
		IN JOB_FILE_NAME CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
	DECLARE counter int;										
	DECLARE V_JFN_SOURCE CLOB;										
	DECLARE V_JFN_TARGET CLOB;										
											
	SELECT count(*) INTO counter FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES";										
	IF :counter = 0 										
	THEN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES" VALUES ( JOB_KEY, JOB_FILE_NAME);									
	ELSE										
		SELECT top 1 JOB_FILE_NAME INTO V_JFN_SOURCE FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES";									
		V_JFN_TARGET  = CONCAT(:V_JFN_SOURCE, JOB_FILE_NAME);									
		Truncate table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES";									
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES" VALUES ( JOB_KEY, V_JFN_TARGET);									
	END IF;										
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.GET_TEMP_SupplierDimSystem_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		SELECT "JOB_KEY","JOB_FILE_NAME" FROM "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.TRUNC_TEMP_SupplierDimSystem_FILES ()											
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_FILES";									
END;											
----------------------------------------											
CREATE OR REPLACE PROCEDURE SAP_CONTENT#ARIBA_SPEND_ANALYSIS.PUT_TEMP_SupplierDimSystem_XML (											
		IN FILENAME varchar(20),									
		IN FILECONTENT CLOB)									
	LANGUAGE SQLSCRIPT AS										
	BEGIN										
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_XML" VALUES (									
				FILENAME,							
				FILECONTENT);							
											
		INSERT INTO "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."SupplierDimSystem" (									
			SELECT * FROM								
				XMLTABLE('resultset/row' PASSING							
				SAP_CONTENT#ARIBA_SPEND_ANALYSIS."TEMP_SupplierDimSystem_XML"."FILECONTENT"							
				COLUMNS							
					deprevious_parent_change_date		NVARCHAR(5000) 		PATH		'deprevious_parent_change_date',
					woman_owned_enterprise		NVARCHAR(5000) 		PATH		'woman_owned_enterprise',
					woman_owned		NVARCHAR(5000) 		PATH		'woman_owned',
					vietnam_vo		NVARCHAR(5000) 		PATH		'vietnam_vo',
					veteran_owned_enterprise		NVARCHAR(5000) 		PATH		'veteran_owned_enterprise',
					veteran_owned		NVARCHAR(5000) 		PATH		'veteran_owned',
					minority_owned_enterprise		NVARCHAR(5000) 		PATH		'minority_owned_enterprise',
					minority_owned		NVARCHAR(5000) 		PATH		'minority_owned',
					minority_other		NVARCHAR(5000) 		PATH		'minority_other',
					minority_na		NVARCHAR(5000) 		PATH		'minority_na',
					minority_is		NVARCHAR(5000) 		PATH		'minority_is',
					minority_hispanic		NVARCHAR(5000) 		PATH		'minority_hispanic',
					minority_black		NVARCHAR(5000) 		PATH		'minority_black',
					minority_asian		NVARCHAR(5000) 		PATH		'minority_asian',
					is_supplier		NVARCHAR(5000) 		PATH		'is_supplier',
					is_customer		NVARCHAR(5000) 		PATH		'is_customer',
					diversity_small_business		NVARCHAR(5000) 		PATH		'diversity_small_business',
					diversity_sdb		NVARCHAR(5000) 		PATH		'diversity_sdb',
					diversity_sba8_a		NVARCHAR(5000) 		PATH		'diversity_sba8_a',
					diversity_labor_surplus		NVARCHAR(5000) 		PATH		'diversity_labor_surplus',
					diversity_hubzone		NVARCHAR(5000) 		PATH		'diversity_hubzone',
					diversity_hbcu		NVARCHAR(5000) 		PATH		'diversity_hbcu',
					diversity_green		NVARCHAR(5000) 		PATH		'diversity_green',
					diversity_glbtowned		NVARCHAR(5000) 		PATH		'diversity_glbtowned',
					diversity_enterprise		NVARCHAR(5000) 		PATH		'diversity_enterprise',
					diversity_disabled_owned		NVARCHAR(5000) 		PATH		'diversity_disabled_owned',
					diversity_dvo		NVARCHAR(5000) 		PATH		'diversity_dvo',
					diversity		NVARCHAR(5000) 		PATH		'diversity',
					disadvantaged_enterprise		NVARCHAR(5000) 		PATH		'disadvantaged_enterprise',
					dvoenterprise		NVARCHAR(5000) 		PATH		'dvoenterprise',
					dewoman_owned_enterprise		NVARCHAR(5000) 		PATH		'dewoman_owned_enterprise',
					deveteran_owned_enterprise		NVARCHAR(5000) 		PATH		'deveteran_owned_enterprise',
					desubsidiary		NVARCHAR(5000) 		PATH		'desubsidiary',
					desmall_business_enterprise		NVARCHAR(5000) 		PATH		'desmall_business_enterprise',
					desdbenterprise		NVARCHAR(5000) 		PATH		'desdbenterprise',
					desba8_aenterprise		NVARCHAR(5000) 		PATH		'desba8_aenterprise',
					deminority_owned_enterprise		NVARCHAR(5000) 		PATH		'deminority_owned_enterprise',
					delabor_surplus_enterprise		NVARCHAR(5000) 		PATH		'delabor_surplus_enterprise',
					dein_sdn		NVARCHAR(5000) 		PATH		'dein_sdn',
					dehub_zone_enterprise		NVARCHAR(5000) 		PATH		'dehub_zone_enterprise',
					deheadquarter		NVARCHAR(5000) 		PATH		'deheadquarter',
					dehbcuenterprise		NVARCHAR(5000) 		PATH		'dehbcuenterprise',
					deglbtowned_enterprise		NVARCHAR(5000) 		PATH		'deglbtowned_enterprise',
					dediversity_woman_owned		NVARCHAR(5000) 		PATH		'dediversity_woman_owned',
					dediversity_veteran_owned		NVARCHAR(5000) 		PATH		'dediversity_veteran_owned',
					dediversity_small_business		NVARCHAR(5000) 		PATH		'dediversity_small_business',
					dediversity_sdb		NVARCHAR(5000) 		PATH		'dediversity_sdb',
					dediversity_sba8_a		NVARCHAR(5000) 		PATH		'dediversity_sba8_a',
					dediversity_minority_owned		NVARCHAR(5000) 		PATH		'dediversity_minority_owned',
					dediversity_labor_surplus		NVARCHAR(5000) 		PATH		'dediversity_labor_surplus',
					dediversity_hub_zone		NVARCHAR(5000) 		PATH		'dediversity_hub_zone',
					dediversity_hbcu		NVARCHAR(5000) 		PATH		'dediversity_hbcu',
					dediversity_green		NVARCHAR(5000) 		PATH		'dediversity_green',
					dediversity_glbtowned		NVARCHAR(5000) 		PATH		'dediversity_glbtowned',
					dediversity_enterprise		NVARCHAR(5000) 		PATH		'dediversity_enterprise',
					dediversity_disadvantaged		NVARCHAR(5000) 		PATH		'dediversity_disadvantaged',
					dediversity_disabled_owned		NVARCHAR(5000) 		PATH		'dediversity_disabled_owned',
					dediversity_dvo		NVARCHAR(5000) 		PATH		'dediversity_dvo',
					dediversity		NVARCHAR(5000) 		PATH		'dediversity',
					dedisadvantaged_enterprise		NVARCHAR(5000) 		PATH		'dedisadvantaged_enterprise',
					dedisabled_owned_enterprise		NVARCHAR(5000) 		PATH		'dedisabled_owned_enterprise',
					dedvoenterprise		NVARCHAR(5000) 		PATH		'dedvoenterprise',
					decertified_woman_owned		NVARCHAR(5000) 		PATH		'decertified_woman_owned',
					decertified_veteran_owned		NVARCHAR(5000) 		PATH		'decertified_veteran_owned',
					decertified_small_business		NVARCHAR(5000) 		PATH		'decertified_small_business',
					decertified_sdb		NVARCHAR(5000) 		PATH		'decertified_sdb',
					decertified_sba8_a		NVARCHAR(5000) 		PATH		'decertified_sba8_a',
					decertified_minority_owned		NVARCHAR(5000) 		PATH		'decertified_minority_owned',
					decertified_labor_surplus		NVARCHAR(5000) 		PATH		'decertified_labor_surplus',
					decertified_hub_zone		NVARCHAR(5000) 		PATH		'decertified_hub_zone',
					decertified_hbcu		NVARCHAR(5000) 		PATH		'decertified_hbcu',
					decertified_glbtowned		NVARCHAR(5000) 		PATH		'decertified_glbtowned',
					decertified_diversity		NVARCHAR(5000) 		PATH		'decertified_diversity',
					decertified_disadvantaged		NVARCHAR(5000) 		PATH		'decertified_disadvantaged',
					decertified_disabled_owned		NVARCHAR(5000) 		PATH		'decertified_disabled_owned',
					decertified_dvo		NVARCHAR(5000) 		PATH		'decertified_dvo',
					certified_woman_owned		NVARCHAR(5000) 		PATH		'certified_woman_owned',
					certified_veteran_owned		NVARCHAR(5000) 		PATH		'certified_veteran_owned',
					certified_sdb		NVARCHAR(5000) 		PATH		'certified_sdb',
					certified_sba8_a		NVARCHAR(5000) 		PATH		'certified_sba8_a',
					certified_minority_owned		NVARCHAR(5000) 		PATH		'certified_minority_owned',
					certified_hubzone		NVARCHAR(5000) 		PATH		'certified_hubzone',
					certified_diversity		NVARCHAR(5000) 		PATH		'certified_diversity',
					certified_disadvantaged		NVARCHAR(5000) 		PATH		'certified_disadvantaged',
					certified_disabled_owned		NVARCHAR(5000) 		PATH		'certified_disabled_owned',
					backup_withholding_exempt		NVARCHAR(5000) 		PATH		'backup_withholding_exempt',
					vat_id		NVARCHAR(5000) 		PATH		'vat_id',
					us_tin		NVARCHAR(5000) 		PATH		'us_tin',
					supplier_type		NVARCHAR(5000) 		PATH		'supplier_type',
					supplier_public_name		NVARCHAR(5000) 		PATH		'supplier_public_name',
					supplier_name_rank		NVARCHAR(5000) 		PATH		'supplier_name_rank',
					supplier_name_l9		NVARCHAR(5000) 		PATH		'supplier_name_l9',
					supplier_name_l8		NVARCHAR(5000) 		PATH		'supplier_name_l8',
					supplier_name_l7		NVARCHAR(5000) 		PATH		'supplier_name_l7',
					supplier_name_l6		NVARCHAR(5000) 		PATH		'supplier_name_l6',
					supplier_name_l5		NVARCHAR(5000) 		PATH		'supplier_name_l5',
					supplier_name_l4		NVARCHAR(5000) 		PATH		'supplier_name_l4',
					supplier_name_l3		NVARCHAR(5000) 		PATH		'supplier_name_l3',
					supplier_name_l2		NVARCHAR(5000) 		PATH		'supplier_name_l2',
					supplier_name_l10		NVARCHAR(5000) 		PATH		'supplier_name_l10',
					supplier_name_l1		NVARCHAR(5000) 		PATH		'supplier_name_l1',
					supplier_name		NVARCHAR(5000) 		PATH		'supplier_name',
					supplier_location_id		NVARCHAR(5000) 		PATH		'supplier_location_id',
					supplier_id_rank		NVARCHAR(5000) 		PATH		'supplier_id_rank',
					supplier_id_l9		NVARCHAR(5000) 		PATH		'supplier_id_l9',
					supplier_id_l8		NVARCHAR(5000) 		PATH		'supplier_id_l8',
					supplier_id_l7		NVARCHAR(5000) 		PATH		'supplier_id_l7',
					supplier_id_l6		NVARCHAR(5000) 		PATH		'supplier_id_l6',
					supplier_id_l5		NVARCHAR(5000) 		PATH		'supplier_id_l5',
					supplier_id_l4		NVARCHAR(5000) 		PATH		'supplier_id_l4',
					supplier_id_l3		NVARCHAR(5000) 		PATH		'supplier_id_l3',
					supplier_id_l2		NVARCHAR(5000) 		PATH		'supplier_id_l2',
					supplier_id_l10		NVARCHAR(5000) 		PATH		'supplier_id_l10',
					supplier_id_l1		NVARCHAR(5000) 		PATH		'supplier_id_l1',
					supplier_id		NVARCHAR(5000) 		PATH		'supplier_id',
					street_address		NVARCHAR(5000) 		PATH		'street_address',
					stock_symbol		NVARCHAR(5000) 		PATH		'stock_symbol',
					state_tin		NVARCHAR(5000) 		PATH		'state_tin',
					state_of_incorporation		NVARCHAR(5000) 		PATH		'state_of_incorporation',
					state		NVARCHAR(5000) 		PATH		'state',
					source_system		NVARCHAR(5000) 		PATH		'source_system',
					short_description		NVARCHAR(5000) 		PATH		'short_description',
					regional_tin		NVARCHAR(5000) 		PATH		'regional_tin',
					procurement_unit_parent		NVARCHAR(5000) 		PATH		'procurement_unit_parent',
					preferred_language		NVARCHAR(5000) 		PATH		'preferred_language',
					postal_code		NVARCHAR(5000) 		PATH		'postal_code',
					payment_type		NVARCHAR(5000) 		PATH		'payment_type',
					parent_supplier_id		NVARCHAR(5000) 		PATH		'parent_supplier_id',
					organization_type		NVARCHAR(5000) 		PATH		'organization_type',
					order_routing_type		NVARCHAR(5000) 		PATH		'order_routing_type',
					legal_name		NVARCHAR(5000) 		PATH		'legal_name',
					global_location_number		NVARCHAR(5000) 		PATH		'global_location_number',
					flex_field3		NVARCHAR(5000) 		PATH		'flex_field3',
					flex_field2		NVARCHAR(5000) 		PATH		'flex_field2',
					flex_field1		NVARCHAR(5000) 		PATH		'flex_field1',
					fax_number		NVARCHAR(5000) 		PATH		'fax_number',
					ethnicity_enterprise		NVARCHAR(5000) 		PATH		'ethnicity_enterprise',
					diversity_ethnicity		NVARCHAR(5000) 		PATH		'diversity_ethnicity',
					dunsnumber		NVARCHAR(5000) 		PATH		'dunsnumber',
					desupplier_parent_name		NVARCHAR(5000) 		PATH		'desupplier_parent_name',
					desupplier_parent_id		NVARCHAR(5000) 		PATH		'desupplier_parent_id',
					desupplier_name		NVARCHAR(5000) 		PATH		'desupplier_name',
					desupplier_id		NVARCHAR(5000) 		PATH		'desupplier_id',
					destreet_address		NVARCHAR(5000) 		PATH		'destreet_address',
					destate		NVARCHAR(5000) 		PATH		'destate',
					deserscore_category		NVARCHAR(5000) 		PATH		'deserscore_category',
					derevenue_rating		NVARCHAR(5000) 		PATH		'derevenue_rating',
					depublic_owned_code		NVARCHAR(5000) 		PATH		'depublic_owned_code',
					deprevious_parent_name		NVARCHAR(5000) 		PATH		'deprevious_parent_name',
					deprevious_parent_id		NVARCHAR(5000) 		PATH		'deprevious_parent_id',
					depostal_code		NVARCHAR(5000) 		PATH		'depostal_code',
					dephone_number		NVARCHAR(5000) 		PATH		'dephone_number',
					depayment_trends		NVARCHAR(5000) 		PATH		'depayment_trends',
					denational_id_type		NVARCHAR(5000) 		PATH		'denational_id_type',
					denational_id		NVARCHAR(5000) 		PATH		'denational_id',
					denaicscode_name4		NVARCHAR(5000) 		PATH		'denaicscode_name4',
					denaicscode_name3		NVARCHAR(5000) 		PATH		'denaicscode_name3',
					denaicscode_name2		NVARCHAR(5000) 		PATH		'denaicscode_name2',
					denaicscode_name1		NVARCHAR(5000) 		PATH		'denaicscode_name1',
					denaicscode4		NVARCHAR(5000) 		PATH		'denaicscode4',
					denaicscode3		NVARCHAR(5000) 		PATH		'denaicscode3',
					denaicscode2		NVARCHAR(5000) 		PATH		'denaicscode2',
					denaicscode1		NVARCHAR(5000) 		PATH		'denaicscode1',
					delocation_status_code		NVARCHAR(5000) 		PATH		'delocation_status_code',
					delegal_status_code		NVARCHAR(5000) 		PATH		'delegal_status_code',
					deindustry_siccode_name4		NVARCHAR(5000) 		PATH		'deindustry_siccode_name4',
					deindustry_siccode_name3		NVARCHAR(5000) 		PATH		'deindustry_siccode_name3',
					deindustry_siccode_name2		NVARCHAR(5000) 		PATH		'deindustry_siccode_name2',
					deindustry_siccode_name		NVARCHAR(5000) 		PATH		'deindustry_siccode_name',
					deindustry_siccode4		NVARCHAR(5000) 		PATH		'deindustry_siccode4',
					deindustry_siccode3		NVARCHAR(5000) 		PATH		'deindustry_siccode3',
					deindustry_siccode2		NVARCHAR(5000) 		PATH		'deindustry_siccode2',
					deindustry_siccode		NVARCHAR(5000) 		PATH		'deindustry_siccode',
					deisolevel		NVARCHAR(5000) 		PATH		'deisolevel',
					deisoindicator		NVARCHAR(5000) 		PATH		'deisoindicator',
					deglobal_ultimate_name		NVARCHAR(5000) 		PATH		'deglobal_ultimate_name',
					deglobal_ultimate_id		NVARCHAR(5000) 		PATH		'deglobal_ultimate_id',
					defederal_tax_id		NVARCHAR(5000) 		PATH		'defederal_tax_id',
					defax_number		NVARCHAR(5000) 		PATH		'defax_number',
					deethnicity_enterprise		NVARCHAR(5000) 		PATH		'deethnicity_enterprise',
					deemployee_rating		NVARCHAR(5000) 		PATH		'deemployee_rating',
					dedomestic_ultimate_name		NVARCHAR(5000) 		PATH		'dedomestic_ultimate_name',
					dedomestic_ultimate_id		NVARCHAR(5000) 		PATH		'dedomestic_ultimate_id',
					dediversity_ethnicity		NVARCHAR(5000) 		PATH		'dediversity_ethnicity',
					decredit_rating		NVARCHAR(5000) 		PATH		'decredit_rating',
					decountry		NVARCHAR(5000) 		PATH		'decountry',
					decongressional_district		NVARCHAR(5000) 		PATH		'decongressional_district',
					deconfidence		NVARCHAR(5000) 		PATH		'deconfidence',
					decity		NVARCHAR(5000) 		PATH		'decity',
					decertified_ethnicity		NVARCHAR(5000) 		PATH		'decertified_ethnicity',
					country		NVARCHAR(5000) 		PATH		'country',
					contact_phone_number		NVARCHAR(5000) 		PATH		'contact_phone_number',
					contact_last_name		NVARCHAR(5000) 		PATH		'contact_last_name',
					contact_first_name		NVARCHAR(5000) 		PATH		'contact_first_name',
					contact_email		NVARCHAR(5000) 		PATH		'contact_email',
					common_supplier_name		NVARCHAR(5000) 		PATH		'common_supplier_name',
					common_supplier_id		NVARCHAR(5000) 		PATH		'common_supplier_id',
					city		NVARCHAR(5000) 		PATH		'city',
					certified_ethnicity		NVARCHAR(5000) 		PATH		'certified_ethnicity',
					approval_status		NVARCHAR(5000) 		PATH		'approval_status',
					alias2		NVARCHAR(5000) 		PATH		'alias2',
					alias1		NVARCHAR(5000) 		PATH		'alias1',
					annumber		NVARCHAR(5000) 		PATH		'annumber',
					year_founded		NVARCHAR(5000) 		PATH		'year_founded',
					number_of_employees		NVARCHAR(5000) 		PATH		'number_of_employees',
					deyear_started		NVARCHAR(5000) 		PATH		'deyear_started',
					deserscore		NVARCHAR(5000) 		PATH		'deserscore',
					dehierarchy_code		NVARCHAR(5000) 		PATH		'dehierarchy_code',
					defssscore		NVARCHAR(5000) 		PATH		'defssscore',
					defsspercentile		NVARCHAR(5000) 		PATH		'defsspercentile',
					defssclass		NVARCHAR(5000) 		PATH		'defssclass',
					dediversity_status_enterprise		NVARCHAR(5000) 		PATH		'dediversity_status_enterprise',
					dediversity_status		NVARCHAR(5000) 		PATH		'dediversity_status',
					decertified_diversity_status		NVARCHAR(5000) 		PATH		'decertified_diversity_status',
					decssscore		NVARCHAR(5000) 		PATH		'decssscore',
					decsspercentile		NVARCHAR(5000) 		PATH		'decsspercentile',
					decssclass		NVARCHAR(5000) 		PATH		'decssclass'
			) as XTABLE  								
		);									
		Truncate Table "SAP_CONTENT#ARIBA_SPEND_ANALYSIS"."TEMP_SupplierDimSystem_XML"; 									
	END;										
---------------------------											
