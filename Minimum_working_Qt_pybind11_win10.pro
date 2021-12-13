QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# ВАЖНО, ИЗ-ЗА переменной "slots" в Python.h
# вместо slots, signals, emit - Q_SIGNALS (или Q_SIGNAL),  Q_SLOTS (или Q_SLOT) и Q_EMIT
CONFIG += no_keywords

SOURCES += \
        main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += G:/pybind11-master/include

# обычный питон, что установлен в системе
INCLUDEPATH += C:/Users/z/AppData/Local/Programs/Python/Python39/include

# нужен именно embed той же версии, что обычный питон, что установлен
# https://www.python.org/downloads/windows/
LIBS += -L"G:/Downloads/Downloads/python-3.9.0-embed-amd64" -lpython39
