# How to edit the HOSTS file when using a SAP S/4HANA 2022 preconfigured appliance system

ABAP cloud workshops can also be run on SAP S/4HANA 2022 systems. Here we make use of the so called *Preconfigured Appliance* systems that are available for SAP S/4HANA 2022.
These servers as a default use a generic host name which will not be resolved by your network settings by default.  
Therefore you can either replace the string **vhcals4hcs.dummy.nodomain** in the browser URL with the IP adress provided to you by the workshop instructor or you add the information how to resolve this hostname with the IP adress of your SAP S/4HANA demo system.

You will add a short cut to your desktop that lets you display / edit the HOSTS file conviniently using notepad.exe.   

## Windows 

1. Right click on your desktop 
2. Select **New > Shortcut**.

   ![Edit HOSTS](images/100_edit_hosts.png).

3. In the *Create Shortcut* dialogue enter the following string and press **Next**:
   `C:\Windows\System32\notepad.exe C:\Windows\System32\drivers\etc\hosts`. 
   
   ![Edit HOSTS](images/110_edit_hosts.png).
   
4. Provide the shortcut with a meaningful name such as **Edit HOSTS**.

   ![Edit HOSTS](images/120_edit_hosts.png).

5. Right click on the newly created shortcut and select **Run as administrator**.   
 
   ![Edit HOSTS](images/130_edit_hosts.png).

7. Confirm the popup of the User Accesss Control that needs the confirmation that you are OK with notepad being started with administrative rights

8. Enter the following three lines at the bottom of your HOSTS file, where xxx.xxx.xxx.xxx has to be replaced by the IP adress of your SAP S/4HANA preconfigured appliance system.

<pre>
# Customer Workshops Template SAP S/4HANA 2022
xxx.xxx.xxx.xxx vhcals4hcs.dummy.nodomain
#
</pre>

8. Save your changes 



