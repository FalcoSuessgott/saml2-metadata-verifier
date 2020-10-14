# SAML2 metadata verifier

[![Actions Status](https://github.com/FalcoSuessgott/saml2-metadata-verifier/workflows/sh_unittest}/badge.svg)](https://github.com/FalcoSuessgott/saml2-metadata-verifier/actions)
## How it works
`saml2-metadata-verifier` parses the provided metadata-xml-file and verifies it to the SAML2.0 xsd-files using `libxml2`. If the metadata file has values or options that are invalid for the SAML2.0 standard it prints out the errors. 


## Dependencies
* libxml2 

```bash
curl -L ftp://xmlsoft.org/libxml2/LATEST_LIBXML2 -o ./LIBXML2_LATEST.tar.gz
tar -xf ./LIBXML2_LATEST.tar.gz
cd ./libxml2*
./configure --prefix=/usr  --enable-static --with-threads --with-history
make
sudo make install
```

## Installation
* There is also a rpm available. 
```bash
git clone https://github.com/FalcoSuessgott/saml2-metadata-verifier.git
sudo make
```

## Usage
```bash
bash saml2-metadata-verifier -h
Usage: saml2-metadata-verifier [OPTIONS...]

OPTIONS:
  -f, --file               path to metadata file
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
