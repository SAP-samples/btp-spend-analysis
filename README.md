
# SAP BTP Integration Suite Integration Flows for Ariba Spend Analysis
<!-- Please include descriptive title -->

<!--- Register repository https://api.reuse.software/register, then add REUSE badge:
[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/REPO-NAME)](https://api.reuse.software/info/github.com/SAP-samples/REPO-NAME)
-->

## Description
Power up business content for SAP Analytics Cloud and SAP Ariba Spend Analysis using SAP Integration Suite.

The sample integration flows in this repository demonstrate how to use SAP BTP Integration Suite to pull data from the SAP Ariba Analytical Reporting API, process it into SAP Data Warehouse Cloud, and analyze it using the SAP Analytics Cloud Spend Analysis business content. 

Watch a [high level overview video of the business content](https://share.video.sap.com/media/1_a3htg2ip) that you will be unlocking. 

**Current Position - What is the challenge**
To power up the Ariba Spend Analytics Business Content for Data Warehouse Cloud and SAP Analytics Cloud, you need to move your Ariba data into Data Warehouse Cloud.  Ariba provides an Analytical API for customers to access the data generated by the Spend Analysis entitlement.  Due to the format of the API response, there is no direct ingestion mechanism for Data Warehouse Cloud to pull the Ariba data, therefore some form of ETL tooling needs to be introduced for that data movement.

**Destination - What is the Outcome**
After following this Discovery Mission, you will have deployed the Data Warehouse Cloud and SAP Analytics Cloud Business Content for Spend; you will have deployed the Cloud Integration Suite IFlow into your Business Technology Platform space and used it to move data from your Ariba system into your Data Warehouse Cloud system.


**How you get there - What is the solution**
The solution consists of the prebuilt business content for Data Warehouse Cloud and SAP Analytics Cloud to allow you visibility into your Spend data; a custom Integration Flow that orchestrates the transportation of data from Ariba to Data Warehouse Cloud.

**Solution Diagram**

![Overview](/Tutorial/images/OverviewMarketecture.png)


## Download and Installation

Integration Flows are attached as a .zip to this release.  All SQL scripts are found in the /src/SQL dir

This git repository contains all Integration Flows, HANA SQL Scripts and documentation needed for the Intelligent Spend Analytics Discovery Mission.  The integration is specific to the Ariba Spend Analysis entitlement and provides a way for BTP Cloud Integration to pull data from the Ariba Analytical API, process it into SAP Data Warehouse Cloud so that the SAP Analytics Cloud Spend Analysis business content can be used.

### Step 1: [Solution Overview and Architecture](/Tutorial/01-Solution-Overview-and-Architecture)
### Step 2: [Review Prerequisites and Resources](/Tutorial/00-Prerequisites-and-Resources)
### Step 3: [Data Warehouse Cloud Preparation](/Tutorial/02-DWC-Preparation)
### Step 4: [Create the Data Warehouse Cloud Space](/Tutorial/03-DWC-Space-Creation)
### Step 5: [Download the DWC Business Content](/Tutorial/04-DWC-Content-Download)
### Step 6: [Create the HANA artifacts](/Tutorial/05-DWC-Create-Table-SQL)
### Step 7: [Deploy the DWC Business Content](/Tutorial/06-DWC-Deploy-Content)
### Step 8: [Connect SAP Analytics Cloud Content](/Tutorial/07-SAC-Connect-Deploy)
### Step 9: [BTP Cloud Integration Preparation](/Tutorial/08-Cloud-Integration-Prepare)
### Step 10: [Connect Cloud Integration Suite to Ariba](/Tutorial/09-Connect-IS-Ariba)
### Step 11: [Connect Cloud Integration Suite to DWC](/Tutorial/10-Connect-IS-DWC)
### Step 12: [Deploy Integration Flows](/Tutorial/11-Deploy-IFlows)

## Known Issues
<!-- You may simply state "No known issues. -->

## How to obtain support
[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing
If you wish to contribute code, offer fixes or improvements, please send a pull request. Due to legal reasons, contributors will be asked to accept a DCO when they create the first pull request to this project. This happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## License
Copyright (c) 2022 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.

[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/btp-spend-analysis)](https://api.reuse.software/info/github.com/SAP-samples/btp-spend-analysis)
