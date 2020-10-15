Name:		saml2-metadata-verifier
Version:	1.10
Release:	1%{?dist}
Summary:	Verifies saml2 sp and idp metadata

License:	MIT
URL:		https://github.com/FalcoSuessgott/saml2-metadata-verifier
Source0:        %{name}-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-root-%(%{__id_u} -n)
BuildArch:      noarch

BuildRequires:	bash
Requires:	libxml2-devel >= 2.9.0

%description
Verifies saml2 sp and idp metadata

%prep
%setup -q

%build

%install
rm -rf $RPM_BUILD_ROOT
%{__install} -Dm 755 %{name} ${RPM_BUILD_ROOT}%{_bindir}/%{name}

%{__install} -d -p -m 0755 ${RPM_BUILD_ROOT}%{_sharedstatedir}/xcatalog/
%{__install} -d -p -m 0755 ${RPM_BUILD_ROOT}%{_sharedstatedir}/xsd/
%{__install} -d -p -m 0755 ${RPM_BUILD_ROOT}%{_sharedstatedir}/saml-2.0-os/

%{__install} -Dm 755 xsd/* ${RPM_BUILD_ROOT}%{_sharedstatedir}/xsd/
%{__install} -Dm 755 saml-2.0-os/* ${RPM_BUILD_ROOT}%{_sharedstatedir}/saml-2.0-os/
%{__install} -Dm 755 xcatalog/* ${RPM_BUILD_ROOT}%{_sharedstatedir}/xcatalog/


%files
%attr(755, root, root) %{_bindir}/%{name}
%attr(755, root, root) %{_sharedstatedir}/xcatalog
%attr(755, root, root) %{_sharedstatedir}/saml-2.0-os
%attr(755, root, root) %{_sharedstatedir}/xsd


%changelog
* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.10-1
- comment (tom-morelly@gmx.de)
- fix old referenced xsd bug (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.9-1
- 

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.8-1
- add verbose feature and fix xml.xsd (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.7-1
- use full paths (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.6-1
- 

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.5-1
- build badge (tom-morelly@gmx.de)
- tests (tom-morelly@gmx.de)
- clean up (tom-morelly@gmx.de)
- install deps (tom-morelly@gmx.de)
- install xmllib2 (tom-morelly@gmx.de)
- use centos7 (tom-morelly@gmx.de)
- install xmllib2 (tom-morelly@gmx.de)
- internal cmd (tom-morelly@gmx.de)
- sudo cmd (tom-morelly@gmx.de)
- add tests (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.4-1
- new paths (tom-morelly@gmx.de)
- improved shell script (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.3-1
- add deps (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.2-1
- creating lib dirs (tom-morelly@gmx.de)
- typo (tom-morelly@gmx.de)
- added spec file (tom-morelly@gmx.de)

* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.1-1
- new package built with tito

* Wed Oct 14 2020 Tom Morelly <tom.morelly@sva.de> 1.0.0
- init release
