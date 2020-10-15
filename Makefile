all: saml-2.0-os xsd/xenc-schema.xsd xsd/xml.xsd xsd/xmldsig-core-schema.xsd xcatalog/saml-metadata.xml

saml-2.0-os:
	mkdir -p saml-2.0-os
	wget http://docs.oasis-open.org/security/saml/v2.0/saml-2.0-os.zip
	unzip -d saml-2.0-os saml-2.0-os.zip *.xsd
	# remove old references 
	sed -i -e 's!2001/xml.xsd!2001/03/xml.xsd!g' saml-2.0-os/saml-schema-metadata-2.0.xsd
	rm -rf saml-2.0-os.zip*

xcatalog/saml-metadata.xml:
	mkdir -p xcatalog
	xmlcatalog --noout --create xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd ../xsd/xmldsig-core-schema.xsd xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd ../xsd/xenc-schema.xsd xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/2001/03/xml.xsd ../xsd/xml.xsd xcatalog/saml-metadata.xml

xsd/xenc-schema.xsd:
	mkdir -p xsd
	wget -O xsd/xenc-schema.xsd http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd

xsd/xmldsig-core-schema.xsd:
	mkdir -p xsd
	wget -O xsd/xmldsig-core-schema.xsd http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd

xsd/xml.xsd:
	mkdir -p xsd
	wget -O xsd/xml.xsd http://www.w3.org/2001/03/xml.xsd

clean:
	rm -rf xcatalog xsd saml-2.0-os
