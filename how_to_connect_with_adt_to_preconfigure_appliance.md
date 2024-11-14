# Create an ABAP project in ADT  

This document describes how to create a **ABAP Project** to connect to an SAP S/4HANA on premise or private cloud system.  
The screen shots taken use a **SAP S/4HANA Fully-Activated Appliance** system.  More details about this offering can be found in the following blog post [SAP S/4HANA Fully-Activated Appliance: Create your SAP S/4HANA system in a fraction of the usual setup time](https://blogs.sap.com/2018/12/12/sap-s4hana-fully-activated-appliance-create-your-sap-s4hana-1809-system-in-a-fraction-of-the-usual-setup-time/).

1. Click on  **File > New > New ABAP Project**

   ![New ABAP Project](images/100_create_a_new_abap_project.png)

2. In the *System Connection* dialogue click on the link **new system connection**  

   ![System Connection](images/110_create_a_new_abap_project.png)

3. In the *Connection Settings* dialogue choose the connection type **Custom Application Server**  
   
   Then enter the following connection information
   - System ID: S4H
   - Application Server: xxx.xxx.xxx.xxx
   - Instance Number: 00
   
   and **deactivate** the check box **Activate Secure Network Communication (SNC)**
   
   Press Next.   

   ![Connection Settings](images/120_create_a_new_abap_project.png)

4. In the *Logon to System* dialogue enter the following data
    
   - Client: xxx
   - User: DEVELOPER###
   - Password: xxxxxxxx
   - Language: xx

   Press Next

   ![Logon to System](images/130_create_a_new_abap_project.png)
   
5. In the *Project Name* screen you can choose an individual name for your project or leave the default value proposed by ADT.
  
   ![Project Name](images/140_create_a_new_abap_project.png)

6. Press **Finish**.

## For MAC users

Please use a connection string  

`?`conn=/H/<IP S4 Hana System>/S/3200</IP>```


