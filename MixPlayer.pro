TEMPLATE = app

CONFIG += staticlib

QT += qml quick multimedia

SOURCES += main.cpp \
    imagehandler.cpp \
    fileio.cpp

RC_FILE = WindowsResource.rc

RESOURCES += qml.qrc \
    js.qrc \
    gfx.qrc

# win32:RC_FILE = WindowsResource.rc
win32: RC_FILE = WindowsResource.rc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    imagehandler.h \
    fileio.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
