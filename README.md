# SAML2 metadata verifier ![pipeline](https://github.com/FalcoSuessgott/saml2-metadata-verifier/workflows/pipeline/badge.svg)

Table of Contents
=================

   * [SAML2 metadata verifier](#saml2-metadata-verifier)
      * [How it works](#how-it-works)
      * [Dependencies](#dependencies)
      * [Installation](#installation)
         * [from sources](#from-sources)
         * [via rpm](#via-rpm)
      * [Usage](#usage)
      * [Example](#example)
      * [Credits](#credits)


## How it works
`saml2-metadata-verifier` parses the provided metadata-xml-file and verifies it to the SAML2.0 xsd-files using `libxml2`. If the metadata file has values or options that are invalid for the SAML2.0 standard it prints out the errors. 

## Features
* once builded - works offline without fetching xsds from the internet using `XMLCATALOG`
* iterate over `entityID`s if a file has more than one `entityID`, usefull for Service Provider

## Installation
### Dependencies
* libxml2 

```bash
curl -L ftp://xmlsoft.org/libxml2/LATEST_LIBXML2 -o ./LIBXML2_LATEST.tar.gz
tar -xf ./LIBXML2_LATEST.tar.gz
cd ./libxml2*
./configure --prefix=/usr  --enable-static --with-threads --with-history
make
sudo make install
```

### build from sources
```bash
git clone https://github.com/FalcoSuessgott/saml2-metadata-verifier.git
sudo make
```
### install via rpm
```bash
yum install tito libxml2-devel
git clone https://github.com/FalcoSuessgott/saml2-metadata-verifier.git
sudo make
tito build --rpm --test
yum localinstall /tmp/tito/noarch/*.rpm
```

## Usage
```bash
saml2-metadata-verifier -h                             
Usage: saml2-metadata-verifier [OPTIONS...]

OPTIONS:
  -f, --file               path to metadata file
  -v, --verbose            verbos
```

## Example
```bash
./saml2-metadata-verifier -f metadata.xml
-:77: element ContactPerson: Schemas validity error : Element '{urn:oasis:names:tc:SAML:2.0:metadata}ContactPerson', attribute 'contactType': [facet 'enumeration'] The value 'developer' is not an element of the set {'technical', 'support', 'administrative', 'billing', 'other'}.
- fails to validate
```

## Credits
Shotouts to [@joostd](https://gist.github.com/joostd)

https://gist.github.com/joostd/6057099
