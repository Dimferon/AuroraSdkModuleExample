TARGET = AuroraModuleExample

CONFIG += sailfishapp
CONFIG += qml_debug
CONFIG += c++11

SOURCES += \
        $$files(src/*.cpp)

HEADERS += \
    $$files(src/*.h) \

INCLUDEPATH += $$PWD/src \

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

DISTFILES += \
    qml/AuroraModuleExample.qml
