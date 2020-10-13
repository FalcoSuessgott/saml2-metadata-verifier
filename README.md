# SAML2 SP & IDP Metadata verifier
Ressources:

https://gist.github.com/joostd/6057099


## Installation
```bash
git clone https://github.com/FalcoSuessgott/saml2-metadata-verifier.git
make
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