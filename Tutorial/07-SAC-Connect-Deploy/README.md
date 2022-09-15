## Connect your SAP Analytics Cloud service to Data Warehouse Cloud

To connect the SAP Analytics Cloud Spend Analysis visualization layer to the Data Warehouse Cloud Views that are now deployed, we need to ensure that the SAP Analytics Cloud service and the Data Warehouse Cloud service are connected and a Live Data Connection is established.

Establishing a connection between the two Services will require an Administrator for the SAP Analytics Cloud tenant.  The steps to establish trust between SAP Analytics Cloud and Data Warehouse Cloud are outlined here: https://help.sap.com/docs/SAP_ANALYTICS_CLOUD/00f68c2e08b941f081002fd3691d86a7/ad4281e2875949f0b4d45d1072ff4c38.html

Follow those steps, establish a live connection to Data Warehouse Cloud, name it “SAP Data Warehouse Cloud” and test that you can see the views in Data Warehouse Cloud from SAP Analytics Cloud.

*the SAP Analytics Cloud business content requires this naming convention currently

## Download and Deploy the SAP Analytics Cloud Business Content

SAP Analytics Cloud is used as the visualization layer for Spend Analysis and comes with several pre-built dashboards to get you insights into your Spend Data immediately.  In SAP Analytics Cloud, navigate to the Content Network section and click on the Business Content tile

![alt text](/Tutorial/images/SACLane_DLContent1.png)


From the list of available downloadable Business Content, click on the SAP Ariba: Spend Analysis line, this will pop up a detail screen about the content.  There is no need to change the any of the Import Options, just click Import to kick off the download.

Once the notification indicates that the download is complete, navigate to Files -> My Files -> Public -> SAP_Content -> SAP_PROC_Spend_Analysis to access any of the three dashboards from this package.  Keep in mind that until we configure and run the Integration Flows, there will be no data to populate these Analytic Dashboards. 


Further details about the SAP Analytics Cloud portion of the Spend Analysis business content can be found here:  https://help.sap.com/docs/SAP_ANALYTICS_CLOUD/42093f14b43c485fbe3adbbe81eff6c8/7815a7238338495eb47651b0c6aa3c4e.html
