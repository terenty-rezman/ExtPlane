QT += network
QT -= gui

CONFIG += c++11
CONFIG -= mqtt

include(extplane-client-qt.pri)

SOURCES += democlient.cpp

HEADERS += democlient.h

