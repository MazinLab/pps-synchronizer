// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xpps_synchronizer_control.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPps_synchronizer_control_CfgInitialize(XPps_synchronizer_control *InstancePtr, XPps_synchronizer_control_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPps_synchronizer_control_Set_mode_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_MODE_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_mode_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_MODE_REG_DATA);
    return Data;
}

void XPps_synchronizer_control_Set_counter_config_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_COUNTER_CONFIG_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_counter_config_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_COUNTER_CONFIG_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_counter_status_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_COUNTER_STATUS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_counter_status_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_COUNTER_STATUS_REG_CTRL);
    return Data & 0x1;
}

void XPps_synchronizer_control_Set_delay_ns_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_DELAY_NS_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_delay_ns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_DELAY_NS_REG_DATA);
    return Data;
}

void XPps_synchronizer_control_Set_load_secs_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOAD_SECS_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_load_secs_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOAD_SECS_REG_DATA);
    return Data;
}

void XPps_synchronizer_control_Set_load_ns_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOAD_NS_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_load_ns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOAD_NS_REG_DATA);
    return Data;
}

void XPps_synchronizer_control_Set_load_subns_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOAD_SUBNS_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_load_subns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOAD_SUBNS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_capture_secs_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CAPTURE_SECS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_capture_secs_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CAPTURE_SECS_REG_CTRL);
    return Data & 0x1;
}

u32 XPps_synchronizer_control_Get_capture_ns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CAPTURE_NS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_capture_ns_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CAPTURE_NS_REG_CTRL);
    return Data & 0x1;
}

u32 XPps_synchronizer_control_Get_capture_subns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CAPTURE_SUBNS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_capture_subns_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CAPTURE_SUBNS_REG_CTRL);
    return Data & 0x1;
}

u32 XPps_synchronizer_control_Get_current_secs_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CURRENT_SECS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_current_secs_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CURRENT_SECS_REG_CTRL);
    return Data & 0x1;
}

u32 XPps_synchronizer_control_Get_current_ns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CURRENT_NS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_current_ns_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CURRENT_NS_REG_CTRL);
    return Data & 0x1;
}

u32 XPps_synchronizer_control_Get_current_subns_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CURRENT_SUBNS_REG_DATA);
    return Data;
}

u32 XPps_synchronizer_control_Get_current_subns_reg_vld(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_CURRENT_SUBNS_REG_CTRL);
    return Data & 0x1;
}

void XPps_synchronizer_control_Set_lockout_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOCKOUT_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_lockout_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_LOCKOUT_REG_DATA);
    return Data;
}

void XPps_synchronizer_control_Set_rollover_thresh_reg(XPps_synchronizer_control *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPps_synchronizer_control_WriteReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_ROLLOVER_THRESH_REG_DATA, Data);
}

u32 XPps_synchronizer_control_Get_rollover_thresh_reg(XPps_synchronizer_control *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPps_synchronizer_control_ReadReg(InstancePtr->Control_BaseAddress, XPPS_SYNCHRONIZER_CONTROL_CONTROL_ADDR_ROLLOVER_THRESH_REG_DATA);
    return Data;
}

