# How to connect to an SAP S/4HANA on premise system (DSAG-Technologietage 2023)

This document describes how to create an **ABAP Project** to connect to an SAP S/4HANA on premise system.

1. Click on  **File > New > ABAP Project** to create a new ABAP project.

   ![New ABAP Project](images/logon.png)

2. In the *System Connection* select **S4H** and click **Next >**. The system **S4H** is already configured in SAP logon. 

   ![System Connection](images/logon2.png)

3. Click **Next >**.   

   ![Connection Settings](images/logon3.png)

4. In the *Logon to System* dialogue enter the following data
    
   - Client: xxx
   - User: DEVELOPER###
   - Password: xxxxxxxx
   - Language: xx

   Click **Next >**.

   ![Logon to System](images/logon4.png)
   
5. In the *Project Name* screen you can choose an individual name for your project or leave the default value proposed by ADT. Press **Finish**.
  
   ![Project Name](images/logon5.png) 

7. Add `ZLOCAL` to your favorites packages. Right click on the folder **Favorite Packages** in your newly created ABAP project.   

   ![add_to_favorites](images/logon6.png)  
   
8. Search for `ZLOCAL`. Select the entry and press **OK**.   
   
   ![add_to_favorites](images/logon7.png) 
 
9. Check your result.
 
   ![add_to_favorites](images/logon8.png) 
 

