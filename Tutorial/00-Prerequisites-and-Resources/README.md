## Ariba Prerequisites

SAP Ariba Spend Analytics requires access to the SAP Ariba analytical API to pull the data needed to activate the solution.  You need to have access to the SAP Ariba Developer Portal.  For more information, go to [this page](https://developer.ariba.com/).  If you don't have an account, you'll need to request access.

Full documentation of the Ariba APIs are here: [Analytical Reporting](https://developer.ariba.com/api/apis)
The Analytical API is located under the General Tab in the Ariba API documentation.

## Cloud Integration Suite Prerequisites

SAP Integration Suite connects and contextualizes processes and data while enabling new content-rich applications to be assembled faster with less dependence on IT. Pre-built integration packs along with existing investments can be composed to deliver new outcomes with less involvement by integration experts.

[Cloud Integration Suite Help](https://help.sap.com/docs/SAP_CLOUD_PLATFORM_INTEGRATION_SUITE/51ab953548be4459bfe8539ecaeee98d/5cc6987511104c418b7cb4c25f3d9cb0.html)

## Datasphere Prerequisites

SAP Datasphere is an all-in-one cloud product offered as software as a service (SaaS) for data management and storage. It is used as the data foundation layer for the SAP Ariba Spend Analytics solution. Ensure that you have access to SAP Datasphere and that you have a user with either Administrator or Space Administrator role. This use is needed to import the business content from SAP for Spend. 

You can find further information about accessing the Business Content in Datasphere here:

[Datasphere Business Content Help](https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/be5967d099974c69b77f4549425ca4c0/400078d689bf4454b3fc977a4e201c2f.html)

SAP Datasphere is built on SAP HANA Cloud technology.  To complete this integration scenario, you need database access in the SAP HANA Cloud layer.  You need a user with either the DW Space Administrator or the DW Integrator role to create the database user and grant them the privileges to write to the Open SQL schema. 

Further information about Privileges needed to create a Database User in Datasphere can be found here: [Datasphere Users/Privileges Help](https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/be5967d099974c69b77f4549425ca4c0/798e3fd6707940c3bd2219b2d1ebaac2.html?q=hana)

Check with your SAP Datasphere administrator if you need to first configure standard IT setups such as SAML SSO in Datasphere.

## SAP Analytics Cloud Prerequisites

SAP Analytics Cloud is an all-in-one cloud product offered as software as a service (SaaS) for business intelligence (BI), planning, and predictive analytics.  It is used as the visualization layer for the SAP Spend Analytics solution.  The Spend Analytics dashboards are delivered via the Business Content Network in SAP Analytics Cloud.  Information about accessing the Business Content in SAP Analytics Cloud can be found here:  [SAP Analytics Cloud Business Content Help](https://help.sap.com/docs/SAP_ANALYTICS_CLOUD/00f68c2e08b941f081002fd3691d86a7/078868f57f3346a98c3233207bd211c7.html)

Ensure that you have access to the SAP Analytics Cloud service, and that you have a user in the system.  Your user will need  Read and Maintain permissions for ‘Lifecycle’ as you be downloading content from the Business Content Network.  If you are using the SAP Analytics Cloud standard application roles, Admin and BI Admin have those permissions.


## Additional Resources

List of additional guides for generalized help for the three solutions used in this integration:

- [SAP Integration Suite help](https://help.sap.com/docs/SAP_CLOUD_PLATFORM_INTEGRATION_SUITE)
- [Datasphere help](https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD)
- [SAP Analytics Cloud help](https://help.sap.com/docs/SAP_ANALYTICS_CLOUD)
- [SAP Analytics Cloud Business Content overview](https://community.sap.com/topics/cloud-analytics/business-content)

