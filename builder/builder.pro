#
# This file is part of the xTuple ERP: PostBooks Edition, a free and
# open source Enterprise Resource Planning software suite,
# Copyright (c) 1999-2012 by OpenMFG LLC, d/b/a xTuple.
# It is licensed to you under the Common Public Attribution License
# version 1.0, the full text of which (including xTuple-specific Exhibits)
# is available at www.xtuple.com/CPAL.  By using this software, you agree
# to be bound by its terms.
#

include( ../global.pri )

TEMPLATE = app
CONFIG += qt warn_on thread

DESTDIR = ../bin

#TODO: use OPENRPT_DIR_REL instead of assuming ..
QMAKE_LIBDIR += ../lib ../$${OPENRPT_BLD}/lib
LIBS += -lupdatercommon -lopenrptcommon -lrenderer
win32-msvc* {
  PRE_TARGETDEPS += ../lib/updatercommon.lib          \
                    ../$${OPENRPT_BLD}/lib/openrptcommon.$${OPENRPTLIBEXT} \
                    ../$${OPENRPT_BLD}/lib/renderer.$${OPENRPTLIBEXT}
} else {
  PRE_TARGETDEPS += ../$${UPDATER_BLD}/lib/libupdatercommon.a \
                    ../$${OPENRPT_BLD}/lib/libopenrptcommon.$${OPENRPTLIBEXT} \
                    ../$${OPENRPT_BLD}/lib/librenderer.$${OPENRPTLIBEXT}
}

MOC_DIR = tmp
UI_DIR = tmp
OBJECTS_DIR = tmp

FORMS   += packagewindow.ui \
           texteditdialog.ui \
           providerdialog.ui \
           newprereqdialog.ui \
           queryeditor.ui
HEADERS += packagewindow.h \
           providerdialog.h \
           texteditdialog.h \
           queryeditor.h \
           newprereqdialog.h
SOURCES += main.cpp \
           packagewindow.cpp \
           providerdialog.cpp \
           texteditdialog.cpp \
           queryeditor.cpp \
           newprereqdialog.cpp

QT += xml qt3support sql

