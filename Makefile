all: saml-2.0-os xsd/xenc-schema.xsd xsd/xmldsig-core-schema.xsd xcatalog/saml-metadata.xml

saml-2.0-os:
	mkdir -p saml-2.0-os
	wget http://docs.oasis-open.org/security/saml/v2.0/saml-2.0-os.zip
	unzip -d saml-2.0-os saml-2.0-os.zip *.xsd

xcatalog/saml-metadata.xml:
	mkdir -p xcatalog
	xmlcatalog --noout --create xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd ../xsd/xmldsig-core-schema.xsd xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd ../xsd/xenc-schema.xsd xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/2001/03/xml.xsd /opt/local/share/xml/xmltooling/xml.xsd xcatalog/saml-metadata.xml

xsd/xenc-schema.xsd:
	mkdir -p xsd
	wget -Oxsd/xenc-schema.xsd http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd

xsd/xmldsig-core-schema.xsd:
	mkdir -p xsd
	wget -O xsd/xmldsig-core-schema.xsd http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd

clean:
	rm xcatalog/saml-metadata.xml
