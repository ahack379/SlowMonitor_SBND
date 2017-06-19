TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = HVTest
# HVTest.dbd will be created and installed
DBD += HVTest.dbd

# HVTest.dbd will be made up from these files:
HVTest_DBD += base.dbd

HVTest_DBD += HVTest.dbd

# Include dbd files from all support applications:
HVTest_DBD += asyn.dbd
HVTest_DBD += stream.dbd
HVTest_DBD += drvAsynSerialPort.dbd
HVTest_DBD += drvAsynIPPort.dbd

COMMONDBDS += asyn.dbd

DB_INSTALLS += $(ASYN)/db/asynRecord.db 

$(info    )
$(info STUFF $(DB_INSTALLS) ) #EPICS_BASE_IOC_LIBS))
$(info    )

# Add all the support libraries needed by this IOC
HVTest_LIBS += stream asyn
#HVTest_LIBS += devHVTest
$(info VAR is $(HVTest_LIBS))

# HVTest_registerRecordDeviceDriver.cpp derives from HVTest.dbd
HVTest_SRCS += HVTest_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
HVTest_SRCS_DEFAULT += HVTestMain.cpp
HVTest_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#HVTest_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
HVTest_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

