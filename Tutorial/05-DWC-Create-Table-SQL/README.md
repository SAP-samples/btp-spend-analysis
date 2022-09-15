## Preparing HANA Cloud Tables

The base tables in HANA Cloud need to be built in the Data Warehouse Cloud system, as do the stored procedures that handle some of the data orchestration.  This work happens in the HANA DB Explorer in Data Warehouse Cloud.

Download or copy the following 10 SQL Scripts 

- [ISM_BASE_TABLE_CREATES](/src/SQL/ISM_BASE_TABLE_CREATES.sql)
- [ISM_Script_Account_Dim.sql](/src/SQL/ISM_Script_Account_Dim.sql)
- [ISM_Script_CompanySite_Dim.sql](/src/SQL/ISM_Script_CompanySite_Dim.sql)
- [ISM_Script_Contract_Dim.sql](/src/SQL/ISM_Script_Contract_Dim.sql)
- [ISM_Script_CostCenter_Dim.sql](/src/SQL/ISM_Script_CostCenter_Dim.sql)
- [ISM_Script_InvoiceLineItem_Fact.sql](/src/SQL/ISM_Script_InvoiceLineItem_Fact.sql)
- [ISM_Script_Part_Dim.sql](/src/SQL/ISM_Script_Part_Dim.sql)
- [ISM_Script_POLineItem_Fact.sql](/src/SQL/ISM_Script_POLineItem_Fact.sql)
- [ISM_Script_SourceSystem_Dim.sql](/src/SQL/ISM_Script_SourceSystem_Dim.sql)
- [ISM_Script_Supplier_Dim.sql](/src/SQL/ISM_Script_Supplier_Dim.sql)
- [ISM_Script_UNSPCS_Dim.sql](/src/SQL/ISM_Script_UNSPCS_Dim.sql)

The ISM_BASE_TABLE_CREATES script will create the 10 final destination tables in HANA where the Ariba data will land.  There are 8 Dimension and 2 Fact tables that will be created from this script.
The other 10 scripts will create the temporary tables and stored procedures for each of those Dimension and Fact tables that are eused by the Cloud Integration Suite Integration Flow as part of the data transfer.   

Perform the following steps for each of the SQL Scripts

1. Navigate to the SAP_Content Space in your Data Warehouse Cloud system
2. Navigate to Space Management -> Database Users section.  Select the Database User that you created previously and Launch “Open Database Explorer”.  This will open a new tab with the SAP HANA Database Explorer for SAP HANA Cockpit. 
3. Open a new SQL Console
4. Paste the SQL Script from the one of the downloaded files
5. Click RUN (green circled arrow in the console)


![alt text](/Tutorial/images/DWCLane_CreateTable1.png)
 

Repeat those 5 steps for each of the 10 downloaded SQL script files to create all the base tables.
