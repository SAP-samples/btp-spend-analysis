## Overview of Integration Flows

There are 10 tables in Data Warehouse Cloud that need to be populated with Ariba data.  For each of those tables, there are 6 artifacts to accomplish the data transfer.  Here is the naming convention for the 6 artifacts and the purpose of each ( **_ARIBATABLE_** is a placeholder for the table in Data Warehouse Cloud)

1. **_ARIBATABLE_**_1_AribaJobSubmit:   Submits the initial Job using ViewTemplateName to Ariba. 
2. **_ARIBATABLE_**_2_AribaJobPaging:  If the ResultSet from the initial job requires more than 1 page as a response (more than 500K rows – 10 zips), this job automates the submission of additional pages automatically based on total pages needed to complete the request.
3. **_ARIBATABLE_**_3_AribaJobMonitor: This Job accomplishes the following:
Poll the Ariba system to determine if the Job is complete
If the Job is complete, the Flow will gather up all the zip file names from the completed job creating a list of Zips to collect
Iterate through all Pages as needed to get a complete list of Zips from the Job
Trigger the next Flow once all Pages and all Zips have been cycled through
4. **_ARIBATABLE_**_4_AribaBuildRequest:  Iterates through the list of Zip Names, collates them with the JobID and passes that information one at a time to the next Flow
5. **_ARIBATABLE_**_5_AribaFetchPayload: Builds the GET request using JobID and ZipName passed from previous Flow; Captures any exceptions thrown from URL redirects on the Ariba side; Builds corrected Get request and passes it to the next Flow
6. **_ARIBATABLE_**_6_AribaPayloadWriteDB: Sends the corrected GET request built in Flow 5 to Ariba.  Retrieves the physical ZIP file from Ariba, unzips it, splits the payload into manageable chunks and sends as XML to a temporary table in Data Warehouse Cloud.
  
  
  ## Configure your BTP accounts
  
  These steps are typically accomplished by your BTP Administrator.  Please check with them that your Global account and your Subaccounts have been set up and that you have access to deploy/run Integration Flows:
  There is a checklist that helps you ensure you have configured properly your global account. See Getting Started Checklist.
