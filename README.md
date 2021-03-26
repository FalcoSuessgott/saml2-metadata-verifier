# saml2-metadata-verifier 
> verify SAML SP and IDP  metadata 

![CI](https://github.com/FalcoSuessgott/saml2-metadata-verifier/workflows/CI/badge.svg)
![docker](https://img.shields.io/docker/pulls/falcosuessgott/saml2-metadata-verifier)

Table of Contents
=================

   * [saml2-metadata-verifier](#saml2-metadata-verifier)
   * [Table of Contents](#table-of-contents)
      * [How it works](#how-it-works)
      * [Dependencies](#dependencies)
         * [libxml2 from sources](#libxml2-from-sources)
         * [CentOS/RHEL](#centosrhel)
         * [Debian/Ubuntu](#debianubuntu)
      * [Installation](#installation)
      * [Usage](#usage)
      * [Usage with Docker](#usage-with-docker)
      * [Example](#example)
      * [Credits](#credits)

## How it works
`saml2-metadata-verifier` parses the provided metadata-xml-file and validates it to the SAML2.0 xsd-files using `xmllint`. If the metadata file has values or options that are invalid for the SAML2.0 standard it prints out the errors. 

## Dependencies
You will need `xmllint`. You can install the dependency from sources, rpm or apt packages:

###  libxml2 from sources
```bash
curl -L ftp://xmlsoft.org/libxml2/LATEST_LIBXML2 -o ./LIBXML2_LATEST.tar.gz
tar -xf ./LIBXML2_LATEST.tar.gz
cd ./libxml2*
./configure --prefix=/usr  --enable-static --with-threads --with-history
make
sudo make install
```

### CentOS/RHEL
```
yum install libxml2-devel
```

### Debian/Ubuntu
```
apt-get install libxml2-utils
```

## Installation
```bash
git clone https://github.com/FalcoSuessgott/saml2-metadata-verifier.git
make
```

## Usage
```bash
saml2-metadata-verifier -h                             
Usage: saml2-metadata-verifier [OPTIONS...]

OPTIONS:
  -f, --file               path to metadata file
  -v, --verbose            verbos
```

## Usage with Docker
```bash
docker run --rm -v ${PWD}/metadata.xml:/saml/metadata.xml gottziehtalles/saml2-metadata-verifier metadata.xml 
# change -v ${PWD}/metadata.xml to your metadata file
```

## Example
```bash
./saml2-metadata-verifier.sh -f test/invalid_metadata.xml
-:77: element ContactPerson: Schemas validity error : Element '{urn:oasis:names:tc:SAML:2.0:metadata}ContactPerson', attribute 'contactType': [facet 'enumeration'] The value 'developer' is not an element of the set {'technical', 'support', 'administrative', 'billing', 'other'}.
- fails to validate
```

## Credits
Shotouts to [@joostd](https://gist.github.com/joostd)

https://gist.github.com/joostd/6057099
