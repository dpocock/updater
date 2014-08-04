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
CONFIG += qt warn_on
DEPENDPATH  += ../$${XTUPLE_BLD}/common

TARGET = updater
OBJECTS_DIR = tmp
MOC_DIR     = tmp
UI_DIR      = tmp

QMAKE_LIBDIR += ../lib ../$${OPENRPT_BLD}/lib ../$${XTUPLE_BLD}/lib
LIBS += -lxtuplecommon -lupdatercommon -lopenrptcommon -lrenderer
macx: LIBS += -lz

win32-msvc* {
  PRE_TARGETDEPS += ../lib/updatercommon.lib          \
                    ../$${XTUPLE_BLD}/lib/xtuplecommon.$${XTLIBEXT} \
                    ../$${OPENRPT_BLD}/lib/openrptcommon.$${OPENRPTLIBEXT} \
                    ../$${OPENRPT_BLD}/lib/renderer.$${OPENRPTLIBEXT}
} else {
  PRE_TARGETDEPS += ../lib/libupdatercommon.a          \
                    ../$${XTUPLE_BLD}/lib/libxtuplecommon.$${XTLIBEXT} \
                    ../$${OPENRPT_BLD}/lib/libopenrptcommon.$${OPENRPTLIBEXT} \
                    ../$${OPENRPT_BLD}/lib/librenderer.$${OPENRPTLIBEXT}
}

DESTDIR = ../bin

RC_FILE = rcloader.rc
macx {
  RC_FILE = ../images/updater.icns
  QMAKE_INFO_PLIST = Info.plist
}

FORMS   += loaderwindow.ui
HEADERS += loaderwindow.h
SOURCES += loaderwindow.cpp \
           main.cpp

QT += xml sql

RESOURCES += loader.qrc
