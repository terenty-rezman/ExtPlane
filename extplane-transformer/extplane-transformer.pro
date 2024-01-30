QT += qml quick network

CONFIG += c++11
CONFIG -= debug_and_release
CONFIG -= mqtt

RESOURCES += qml.qrc

INCLUDEPATH += ../extplane-server
INCLUDEPATH += $$PWD/../util/
DEPENDPATH += . ../extplane-server
LIBS += -L../extplane-server/release -lextplane-server
DESTDIR = .
debug.DESTDIR = $$DESTDIR
release.DESTDIR = $$DESTDIR

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

unix:!macx {
    QMAKE_POST_LINK += $(COPY_FILE) $(TARGET) $(TARGET)-linux
}

SOURCES += main.cpp \
    ../extplane-server/datarefs/dataref.cpp \
    ../extplane-server/datarefs/floatdataref.cpp \
    ../extplane-server/datarefprovider.cpp \
    extplanetransformer.cpp \
    datasources/flightgeardatasource.cpp \
    datasources/condordatasource.cpp \
    ../util/basictcpclient.cpp \
    datasource.cpp \

HEADERS += \
    extplanetransformer.h \
    datasources/flightgeardatasource.h \
    datasources/condordatasource.h \
    ../util/basictcpclient.h \
    datasource.h \
