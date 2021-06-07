[Home](README.md)

# Requirements needed to participate in a ABAP Platform RAP workshop

In order to participate in an ABAP Platform RAP workshop you have to prepare four things beforehand:

- Sign up for a free trial account on SAP BTP  
- Create an SAP BTP ABAP Environment Trial User  
- Install the ABAP Development Tools (ADT) 
- Adapt the Web Browser settings in your ADT installation

## 1. Sign up for a free trial account on SAP BTP  

You have signed up for a free trial account on SAP BTP as described here: [Get a Free Account on SAP BTP Trial](https://developers.sap.com/tutorials/hcp-create-trial-account.html).
> **Please note**  
> You **MUST** select either **Europe (Frankfurt)** or **US (VA)** as a region because the ABAP environment is currently only available in these two regions. 


## 2. Create an SAP BTP ABAP Environment Trial User

You have prepared your ABAP Trial which can be easily done via the [SAP BTP cockpit](https://cockpit.hanatrial.ondemand.com) in just 3 steps.
  - Click on Enter **Your Trial Account**.
  ![Enter Trial](images/intro_0000.png)
  - Click on **Boosters** in the menu on the left hand side
  - Choose the tile **Prepare an Account for ABAP Trial** and follow the wizard
  ![Start booster](images/intro_0010.png)

  For a detailed step-by-step description check out step 1 of our [Onboarding Tutorial](https://developers.sap.com/tutorials/abap-environment-trial-onboarding.html#146ad3ba-8f2e-454b-93f2-0bbd1dc0ae1f).
  
## 3. Install the ABAP Development Tools (ADT) 

In order to install the ABAP Development Tools (ADT) we strongly recommend to use the Eclipse Installer 2021 03 R which now includes a JRE for macOS, Windows and Linux.

- Download the [latest Eclipse installer version](https://www.eclipse.org/downloads/packages/installer)  
- Start the installer.   
- When being asked by the installer choose the **Eclipse IDE for Java Developers**  
- Start your newly installed Eclipse  
- In Eclipse, choose in the menu bar **Help > Install New Software...**  
- Enter the URL https://tools.hana.ondemand.com/latest  
- Press **Enter** to display the available features.  
- Select **ABAP Core Development Tools (Developer Edition)** and choose **Next**.  
- Continue with the wizard and confirm the license confirmation popup. 

## 4. Adapt the Web Browser settings in your ADT installation

- In Eclipse, choose in the menu bar **Window > Preferences**.    
- Enter **Web Browser** in the search field.  
- Activate the radio button **Use external web browser**.  
- Select one of the listed external web browsers that are available, e.g. your **Default system web browser**  
  (Please make sure that **Internet Explorer** is **NOT selected**). 
