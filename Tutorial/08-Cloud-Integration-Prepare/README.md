## Overview of Integration Flows

The scenario needs to populate 10 SAP Data Warehouse Cloud tables with SAP Ariba data.

Note that for each table, 6 integration flows are required that accomplish the data transfer.  In the following list, you find the naming convention for these 6 artifacts and the purpose of each ( **_ARIBATABLE_** is a placeholder for the table in Data Warehouse Cloud)

1. **_ARIBATABLE_**_1_AribaJobSubmit:   Submits the initial Job using ViewTemplateName to Ariba. 

2. **_ARIBATABLE_**_2_AribaJobPaging:  If the result set from the initial job requires more than 1 page as a response (a response page has a limit of 500,000 records – 10 zips), this job automates the request submission for additional pages to complete entire response based on total pages needed to complete the request.

3. **_ARIBATABLE_**_3_AribaJobMonitor: This Job accomplishes the following steps:
- Poll the SAP Ariba system to determine if the Job has been completed
- If the Job has been completed, the integration flow collects all .zip file names from the completed job and creates a list of .zip files to collect
- Iterates through all pages as needed to get a complete list of .zip filess from the job
- Trigger the next integration flow once all pages and all .zip files have been processed

4. **_ARIBATABLE_**_4_AribaBuildRequest:  Iterates through the list of .zip file names, collates them with the JobID and passes that information to the next integration flow, one at a time.

5. **_ARIBATABLE_**_5_AribaFetchPayload: 
- Builds the GET request using JobID and ZipName passed from previous integration flow.
- Captures any exceptions thrown from URL redirects on the SAP Ariba side.
- Builds corrected GET requests and passes them to the next integration flow.

6. **_ARIBATABLE_**_6_AribaPayloadWriteDB: 
- Sends the corrected GET request built in integration flow 5 to SAP Ariba.
- Retrieves the .zip file from SAP Ariba and unzips it.
- Splits the payload into manageable chunks and sends the data in XML format to a temporary table in SAP Data Warehouse Cloud.
- Repeats this process until all .zip files from the reponse have been processed
  
  
  ## Configure your BTP accounts
  
  These steps are typically accomplished by your BTP Administrator.  Please check with them that your Global account and your Subaccounts have been set up and that you have access to deploy/run Integration Flows:
  There is a checklist that helps you ensure you have configured properly your global account. See Getting Started Checklist.
