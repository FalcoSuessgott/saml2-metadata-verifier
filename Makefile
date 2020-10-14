all: /var/lib/saml-2.0-os /var/lib/xsd/xenc-schema.xsd /var/lib/xsd/xmldsig-core-schema.xsd /var/lib/xcatalog/saml-metadata.xml

/var/lib/saml-2.0-os:
	mkdir -p /var/lib/saml-2.0-os
	wget http://docs.oasis-open.org/security/saml/v2.0/saml-2.0-os.zip
	unzip -d /var/lib/saml-2.0-os saml-2.0-os.zip *.xsd
	rm -rf /var/lib/saml-2.0-os.zip

/var/lib/xcatalog/saml-metadata.xml:
	mkdir -p /var/lib/xcatalog
	xmlcatalog --noout --create /var/lib/xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd ../xsd/xmldsig-core-schema.xsd /var/lib/xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd ../xsd/xenc-schema.xsd /var/lib/xcatalog/saml-metadata.xml
	xmlcatalog --noout --add uri http://www.w3.org/2001/03/xml.xsd /opt/local/share/xml/xmltooling/xml.xsd /var/lib/xcatalog/saml-metadata.xml

/var/lib/xsd/xenc-schema.xsd:
	mkdir -p /var/lib/xsd
	wget -O /var/lib/xsd/xenc-schema.xsd http://www.w3.org/TR/2002/REC-xmlenc-core-20021210/xenc-schema.xsd

/var/lib/xsd/xmldsig-core-schema.xsd:
	mkdir -p /var/lib/xsd
	wget -O /var/lib/xsd/xmldsig-core-schema.xsd http://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd

clean:
	rm -rf /var/lib/xcatalog /var/lib/xsd /var/lib/saml-2.0-os
