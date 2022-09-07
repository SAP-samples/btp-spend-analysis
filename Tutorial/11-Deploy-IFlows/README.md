## Deploy Integration Flows

Download the Integration Flow package here https://github.tools.sap/I819235/btp_spend_analytics/blob/main/src/Flows/Ariba_Spend_Analysis.zip to a folder on your computer.  You will need this file in the steps below, so make note of where it is.

This package contains 62 Integration Flows.  They break down as follows:

- 10 Sets of 6 Flows - 1 Set for each Table we connect to
- 2 Manager Flows - 1 for Facts / 1 for Dimensions
The Manager Flows can be used as a centralized location to configure date/time parameters for all Flows at one time.

 

1. From the main screen in SAP Integration Suite, click the 'Design, Develop and Operate Integration Scenarios' tile:  

![alt text](/Tutorial/images/ISuite_Import1.png)

2. Select the 'Build and Develop Integration Content' icon from the left menu bar  

![alt text](/Tutorial/images/ISuite_Import2.png)

3. In the top right of the screen, click Import  

![alt text](/Tutorial/images/ISuite_Import3.png)

4. Go to the Configure option of each iFlow with name containing ”_1_” and change the config params like dates, APIKEY, etc (screenshot below)
 
![alt text](/Tutorial/images/CISLane_DeployIFLOW2.png)
 

5 Trigger “Dimension Tables” interface, Deploy iflow -> “SAP_1_Ariba_Dimension_Tables”
6 Trigger “Fact Tables” interface, Deploy iflow -> “SAP_2_Ariba_Fact_Tables” 
 

> Important Note – Application has a known CPI limitation.  if the dataset from Ariba to contains more than a million records CPI server will run into “Disk Space” Errors.  So, the workaround is: You fetch & process limited amounts of data from ariba. Example: if you can make ensure “From and To” date range to fetch from ariba is about than 3 months duration.  Or if you have to run for a duration of 1 year, break down into chunks of 4 quarters in the date range config selection.
