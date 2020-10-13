# SAML2 SP & IDP Metadata verifier

## Installation
```bash
git clone https://github.com/FalcoSuessgott/saml2-metadata-verifier.git
make
```

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

## Usage
```bash
chmod u+x validate-metadata.sh
cat $METADATA_FILE.xml | ./validate-metadata.sh
```

## Example
```bash
cat sp-metadata.xml | ./validate-metadata.sh -
-:77: element ContactPerson: Schemas validity error : Element '{urn:oasis:names:tc:SAML:2.0:metadata}ContactPerson', attribute 'contactType': [facet 'enumeration'] The value 'developer' is not an element of the set {'technical', 'support', 'administrative', 'billing', 'other'}.
- fails to validate
```

## Credits
Shotouts to [@joostd](https://gist.github.com/joostd)

https://gist.github.com/joostd/6057099