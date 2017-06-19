#!../../bin/linux-x86_64/HVTest

## You may have to change HVTest to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/db" 

# Allow PV name prefixes and serial port name to be set from environment 
epicsEnvSet "P" "$(P=HV)" 
epicsEnvSet "R" "$(R=Test)" 
epicsEnvSet "TTY" "$(TTY=/dev/ttyUSB0)"


## Register all support components 
cd "${TOP}" 

dbLoadDatabase "dbd/HVTest.dbd" 
HVTest_registerRecordDeviceDriver pdbbase

# Set up ASYN ports 
drvAsynSerialPortConfigure("L0","$(TTY)",0,0,0)
#drvAsynIPPortConfigure("L0","172.28.175.1:44888",0,0,0)
#drvAsynIPPortConfigure("L0","ip6-localhost:51058",0,0,0)
#drvAsynIPPortConfigure("L0","ip6-localhost:51074",0,0,0)


#asynSetOption ("L0", -1, "baud", "9600")
#asynSetOption ("L0", -1, "bits", "8")
#asynSetOption ("L0", -1, "parity", "none")
#asynSetOption ("L0", -1, "stop", "1")
#asynSetOption ("L0", -1, "clocal", "Y")
#asynSetOption ("L0", -1, "crtscts", "Y")
#asynOctetSetOutputEos("L0", -1, "\n") 
#asynSetTraceMask("L0",-1,0x9) 
#asynSetTraceIOMask("L0",-1,0x1) 
#-1,0x1) #1 reads out only error messages 

## Load record instances 
#dbLoadRecords("db/asynRecord.db","P=$(P)$(R),R=asyn,PORT=L0,ADDR=-1,OMAX=0,IMAX=0") 
dbLoadRecords("db/devHeinz.db","P=$(P),R=$(R),PORT=L0,A=0") 


## Start EPICS 
cd "${TOP}/iocBoot/${IOC}" 
iocInit 
