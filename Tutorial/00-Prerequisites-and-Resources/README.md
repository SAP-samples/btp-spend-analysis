## Ariba Prerequisites

The Spend Analytics solution requires access to the Ariba Analytical API, so that you can pull the data needed to power up the solution.  You'll need to have access to the SAP Ariba Developer Portal, check by going here https://developer.ariba.com/, if you do not have an account then you'll need to request access.

Full documentation of the Ariba API that will be used is under the General tab -> Analytical Reporting area at https://developer.ariba.com/api/apis

## Cloud Integration Suite Prerequisites

Cloud Integration Suite connects and contextualizes processes and data while enabling new content-rich applications to be assembled faster with less dependence on IT. Pre-built integration packs along with existing investments can be composed to deliver new outcomes with less involvement by integration experts.

https://help.sap.com/docs/SAP_CLOUD_PLATFORM_INTEGRATION_SUITE/51ab953548be4459bfe8539ecaeee98d/5cc6987511104c418b7cb4c25f3d9cb0.html

## Data Warehouse Cloud Prerequisites

Data Warehouse Cloud is an all-in-one cloud product offered as software as a service (SaaS) for data management and storage.  It will be used as the data foundation layer for the Spend Analytics solution.  Ensure that you have access to the Data Warehouse Cloud service, and that you have a user with either Administrator or Space Administrator role which will be needed to import the business content from SAP for Spend. 

Further information about accessing the Business Content in Data Warehouse Cloud can be found here:

https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/be5967d099974c69b77f4549425ca4c0/400078d689bf4454b3fc977a4e201c2f.html

Data Warehouse Cloud is built on HANA Cloud technology, and to complete this integration, you will need database access to the HANA Cloud layer.  You will need a user with either the DW Space Administrator or the DW Integrator role to create the database user and grant them the privileges to write to the Open SQL schema. 

Further information about Privileges needed to create a Database User in Data Warehouse Cloud can be found here: https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/be5967d099974c69b77f4549425ca4c0/798e3fd6707940c3bd2219b2d1ebaac2.html?q=hana

 
Check with your Data Warehouse Cloud admin if you need to first configure standard IT setups such as SAML SSO in Data Warehouse Cloud.

## SAP Analytics Cloud Prerequisites

SAP Analytics Cloud is an all-in-one cloud product offered as software as a service (SaaS) for business intelligence (BI), planning, and predictive analytics.  It will be used as the visualization layer for the Spend Analytics solution.  Ensure that you have access to the SAP Analytics Cloud service, and that you have a user in the system with Read and Maintain permissions for ‘Lifecycle’ as you will need that to download content from the Content Network.  If you are using the SAP Analytics Cloud standard application roles, Admin and BI Admin have those permissions.

Further information about accessing the Business Content in SAP Analytics Cloud can be found here:  https://help.sap.com/docs/SAP_ANALYTICS_CLOUD/00f68c2e08b941f081002fd3691d86a7/078868f57f3346a98c3233207bd211c7.html

## Additional Resources

List of additional guides for generalized help for the three solutions used in this integration:

 

- SAP Integration Suite help:  https://help.sap.com/docs/SAP_CLOUD_PLATFORM_INTEGRATION_SUITE
- Data Warehouse Cloud help:  https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD
- SAP Analytics Cloud help:  https://help.sap.com/docs/SAP_ANALYTICS_CLOUD
- SAP Analytics Cloud Business Content overview: https://community.sap.com/topics/cloud-analytics/business-content

