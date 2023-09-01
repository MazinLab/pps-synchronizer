// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xpps_synchronizer_control.h"

extern XPps_synchronizer_control_Config XPps_synchronizer_control_ConfigTable[];

XPps_synchronizer_control_Config *XPps_synchronizer_control_LookupConfig(u16 DeviceId) {
	XPps_synchronizer_control_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPPS_SYNCHRONIZER_CONTROL_NUM_INSTANCES; Index++) {
		if (XPps_synchronizer_control_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPps_synchronizer_control_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPps_synchronizer_control_Initialize(XPps_synchronizer_control *InstancePtr, u16 DeviceId) {
	XPps_synchronizer_control_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPps_synchronizer_control_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPps_synchronizer_control_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

