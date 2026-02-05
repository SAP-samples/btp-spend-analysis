## Datasphere Spaces

Before you can import any SAP or partner content package, the space into which the content will imported, needs to be created.   SAP Content is currently imported into the space SAP_CONTENT.

Note or Instruction on using different space other than SAP_CONTENT:

> You can also import the business content package into a different customer space e.g. *SAP_ARIBA* other than *SAP_CONTENT* space by going into *Import Options* Space Mapping drop-down box to selected the required space. In the mission we have content created based on the space name *SAP_CONTENT* same can be replaced with customer space name e.g. *SAP_ARIBA* etc.

 Therefore, create a space with the technical name “SAP_CONTENT” before you can import any content package. Use the description “SAP Content”. In addition, assign the user that is to import the content to the space SAP_CONTENT

You will need the Administrator role to create a space.

- For more information on the steps to create a space in SAP Datasphere, go to [Create a Space](https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/9f804b8efa8043539289f42f372c4862/bbd41b82ad4d4d9ba91341545f0b37e7.html)

- Assign a user to the Space in the ‘Member Assignment’ section.  You need this to test the final content package in SAP Analytics Cloud.  For more instructions, go to [Assign Members to Your Space](https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/be5967d099974c69b77f4549425ca4c0/9d59fe511ae644d98384897443054c16.html)

- Create a database user in the Database Users section.  You need this user to access the SAP HANA Cloud layer and run the SQL Table Creation scripts (needed for the Inbound Layer objects for the content).  For more instructions, go to [Create a Database User](https://help.sap.com/docs/SAP_DATA_WAREHOUSE_CLOUD/be5967d099974c69b77f4549425ca4c0/798e3fd6707940c3bd2219b2d1ebaac2.html)

Take note of the database user name and password.  You need this information when you connect the SAP Integration Suite integration scenario to SAP Datasphere.  Verify that you can open the Database Explorer with this user 

![DWC Create Space](../images/DWCLane_SpaceCreate1.png)
