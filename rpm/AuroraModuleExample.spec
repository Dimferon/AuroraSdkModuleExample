%{!?qtc_qmake:%define qtc_qmake %qmake}
%{!?qtc_qmake5:%define qtc_qmake5 %qmake5}
%{!?qtc_make:%define qtc_make make}
%{?qtc_builddir:%define _builddir %qtc_builddir}
%define __provides_exclude_from ^%{_libdir}/.*$

Name:       AuroraModuleExample
Summary:    Пример проекта с qt и qml модулями 
Version:    0.0.1
Release:    1
Group:      Qt/Qt
License:    LICENSE
URL:        https://github.com/Dimferon/AuroraModuleExample
Source0:    %{name}-%{version}.tar.bz2
Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   poppler

BuildRequires:  pkgconfig(sailfishapp) >= 1.0.3
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(Qt5Location)
BuildRequires:  pkgconfig(Qt5Positioning)
BuildRequires:  pkgconfig(Qt5Sensors)

BuildRequires:  desktop-file-utils

%description
AuroraModuleExample - пример приложения использующего qt и qml модули


%prep
%autosetup
#cd %{qtc_builddir}
%setup -q -n %{name}-%{version}

%build

%qtc_qmake5

%qtc_make %{?_smp_mflags}

%install
rm -rf %{buildroot}
%qmake5_install

desktop-file-install --delete-original       \
  --dir %{buildroot}%{_datadir}/applications             \
   %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%{_bindir}
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png

#Подключаем файлы модуля к проекту
%{_libdir}/qt5/qml/test_module/test_cppmodule/*.so
%{_libdir}/qt5/qml/test_module/test_cppmodule/*.qml
%{_libdir}/qt5/qml/test_module/test_cppmodule/plugin.qmltypes
%{_libdir}/qt5/qml/test_module/test_cppmodule/qmldir

#Подключаем файлы модуля к проекту

