## Services and Components

The components in this end to end Integration are the following:

|Service | Description|
---------|---------
|[SAP Integration Suite](https://discovery-center.cloud.sap/serviceCatalog/integration-suite/?region=all&tab=service_plan) | Enterprise-wide integration across heterogeneous landscapes|
|[SAP Data Warehouse Cloud](https://discovery-center.cloud.sap/#/serviceCatalog/sap-data-warehouse-cloud/?service_plan=standard&region=all&tab=service_plan) | Cloud data management and data warehousing as a service|
|[SAP Analytics Cloud](https://discovery-center.cloud.sap/#/serviceCatalog/sap-analytics-cloud/?region=all&tab=service_plan) | Cloud Analytics and Planning as a service|

 

### Overview

First understand the components at play in this Integration Flow.  Ariba contains the source data, Cloud Integration Suite will be orchestrating the data transfer, Data Warehouse Cloud is the target destination for the data and SAP Analytics Cloud is the visualization and analytical layer sitting on top of that. 

![Alt text](/Tutorial/images/OverviewMarketecture.png)

The asynchronous Ariba Analytical API can deliver large volumes of data for the requesting application.  The application first submits a job to the Ariba analytical API telling it which table and filter conditions to fulfill.  Ariba then constructs a resultset, packages up the response into Zip files and provides the addresses of those zips to the requesting application.  Each zip file can contain up to 50,000 rows of data and if the overall response is larger than 500,000 rows (10 zips), a second Page of up to 10 zips is created and the address of that page and those zip names is provided.

The Integration Flow for Spend Analytics does the following:

Submits a Job to Ariba for the 8 Dimension tables and 2 Fact tables needed to power the Data Warehouse Cloud/SAP Analytics Cloud Business Content
Polls Ariba to determine when the Ariba response has finished and is ready to return the Pages and Zips for the response
Builds the API requests for all of the Zips in the Ariba response and follows any URL Redirects to get to the files
Pulls the Files to Cloud Integration Suite, Unzips the files, Builds an XML blob per zip and pushes the XML to temporary space in Data Warehouse Cloud
After pushing all the response data to Data Warehouse Cloud as XML, kicks off Data Warehouse Cloud stored procedures to unpack the XML to the appropriate Table and Columns in the HANA Cloud layer of Data Warehouse Cloud
The Data Warehouse Cloud views and SAP Analytics Cloud dashboards then make use of the Ariba data to provide rich analytical capabilities for the Spend data.

![Alt text](/Tutorial/images/DetailedMarketecture.png)


For detailed documentation about the asynchronous Ariba Analytical API please review the documentation here: https://help.sap.com/docs/ARIBA_APIS/bf0cde439a0142fbbaf511bfac5b594d/6bb9d440d99b45938a75e9218650e7de.html
