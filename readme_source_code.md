# ABAP RAP Workshops - solutions

## Description

In this repository you will also find several packages that contain the solutions for the various workshops.  

### RAP100

### RAP610  

### Microsoft integration 

## Requirements

The repository uses folder logic **FULL**. That means that the content can only be imported into packages that have exactly the same name.  

The code for each workshop is stored in a separate sub-package (for example `ZRAP100_000`, `Z_ONLINESHOP_000` --> RAP610 and `Z_ONLINE_SHOP_MCRSFT1` --> Microsoft integration of online shop demo) of the super package `ZABAP_STANDARD`.  

## Download and Installation

### SAP S/4HANA 2022 (on premise) and higher

> Caution: 
> Currently there is a bug in the report `ZABAPGIT_STANDALONE` that does not allow you to import the content of the packages in the ABAP language Version **ABAP for Cloud Development**.  
> As a workaround just create a package in the ABAP language version **ABAP Standard**.  

You have to create a package (e.g. `ZABAP_CLOUD`) beforehand using the softwarecomponent `HOME`.  (This will be changed once the bug in **ZABAPGIT_STANDALONE** is fixed.  

### SAP S/4HANA Cloud, ABAP Environment

You have to create a package (e.g. `ZABAP_CLOUD`) beforehand using the package `ZLOCAL` as the super package. 

## Known Issues

- Bug in ZABAPGIT_STANDALONE currently blocks the import of the packages in packages that have the ABAP language version **ABAP for Cloud Development**.  

## How to obtain support

[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing
If you wish to contribute code, offer fixes or improvements, please send a pull request. Due to legal reasons, contributors will be asked to accept a DCO when they create the first pull request to this project. This happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## License
Copyright (c) 2022 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.
