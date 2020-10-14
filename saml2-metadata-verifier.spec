Name:		saml2-metadata-verifier
Version:	1.1
Release:	1%{?dist}
Summary:	Verifies saml2 sp and idp metadata

License:	MIT
URL:		https://github.com/FalcoSuessgott/saml2-metadata-verifier
Source0:        %{name}-%{version}.tar.gz
BuildRoot:      %{_tmppath}/%{name}-root-%(%{__id_u} -n)
BuildArch:      noarch

BuildRequires:	bash
Requires:	xmllib2

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
* Wed Oct 14 2020 Tom Morelly <tom-morelly@gmx.de> 1.1-1
- new package built with tito

* Wed Oct 14 2020 Tom Morelly <tom.morelly@sva.de> 1.0.0
- init release
