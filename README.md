# SAML2 metadata verifier ![pipeline](https://github.com/FalcoSuessgott/saml2-metadata-verifier/workflows/pipeline/badge.svg) ![docker](https://img.shields.io/docker/pulls/gottziehtalles/saml2-metadata-verifier)
> verify SP and IDP metadata 

Table of Contents
=================

   * [Table of Contents](#table-of-contents)
      * [How it works](#how-it-works)
      * [Features](#features)
      * [Dependencies](#dependencies)
         * [libxml2 from sources](#libxml2-from-sources)
         * [libxml2 via rpm](#libxml2-via-rpm)
         * [libmxl2 via apt](#libmxl2-via-apt)
      * [Installation](#installation)
         * [build from sources](#build-from-sources)
         * [install via rpm](#install-via-rpm)
      * [CLI Usage](#cli-usage)
      * [Usage with Docker](#usage-with-docker)
      * [Example](#example)
      * [Credits](#credits)


## How it works
`saml2-metadata-verifier` parses the provided metadata-xml-file and validates it to the SAML2.0 xsd-files using `libxml2`. If the metadata file has values or options that are invalid for the SAML2.0 standard it prints out the errors. 

## Features
* once builded - works offline without having to fetch xsd’s from the internet using `XMLCATALOG`
* can iterate over multiple `entityID` tags in one file


## Dependencies
You will need `libxml2`. You can install the dependency from sources, rpm or apt packages:

###  libxml2 from sources
```bash
curl -L ftp://xmlsoft.org/libxml2/LATEST_LIBXML2 -o ./LIBXML2_LATEST.tar.gz
tar -xf ./LIBXML2_LATEST.tar.gz
cd ./libxml2*
./configure --prefix=/usr  --enable-static --with-threads --with-history
make
sudo make install
```

### libxml2 via rpm
```
yum install libxml2-devel
```

### libmxl2 via apt
```
apt-get install libxml2-dev
```

## Installation
You can install `saml2-metadata-verifier` from sources or rpm:

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

## CLI Usage
```bash
saml2-metadata-verifier -h                             
Usage: saml2-metadata-verifier [OPTIONS...]

OPTIONS:
  -f, --file               path to metadata file
  -v, --verbose            verbos
```

## Usage with Docker
```bash
docker run --rm \
   -v ${PWD}/metadata.xml:/saml/metadata.xml \
   gottziehtalles/saml2-metadata-verifier metadata.xml
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
