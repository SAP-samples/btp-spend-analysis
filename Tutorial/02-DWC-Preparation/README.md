## Data Warehouse Cloud & SAP Analytics Cloud overview
Data Warehouse Cloud is the target destination for the data being pulled from the Ariba API, and the Business Content we are activating in Data Warehouse Cloud is the SAP Ariba: SPEND ANALYSIS package. 

Documentation for this package is located here:  https://help.sap.com/doc/4b618244ad5f4fbb8423d08996f8b891/cloud/en-US/SAP_Data_Warehouse_Cloud_Content.pdf  in section 4.2

At a high level, the content contains:

- SAP Analytics Cloud Stories – free download from the content network
- Data Warehouse Cloud Views (RL and HL) – free download from the content network
- Data Warehouse Cloud Inbound Tables – will be built as part of the next steps in this mission
 

![alt text](/Tutorial/images/DWCLane_Overview1.png)


To get the content working the following steps must be followed:

1. Create a Space in Data Warehouse Cloud for the content
2. Download the Spend Analysis content package
3. Deploy HANA table create scripts to build the Inbound Layer
4. Deploy the downloaded content – the HL and RL layer*

Attempting to deploy the HL and IL layers out of turn will throw errors as the dependent objects won’t be in place.  It’s best to follow the mission steps in order.
