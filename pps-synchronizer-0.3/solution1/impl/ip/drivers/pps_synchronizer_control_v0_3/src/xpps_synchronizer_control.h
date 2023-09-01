// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPPS_SYNCHRONIZER_CONTROL_H
#define XPPS_SYNCHRONIZER_CONTROL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpps_synchronizer_control_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XPps_synchronizer_control_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XPps_synchronizer_control;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPps_synchronizer_control_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPps_synchronizer_control_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPps_synchronizer_control_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPps_synchronizer_control_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPps_synchronizer_control_Initialize(XPps_synchronizer_control *InstancePtr, u16 DeviceId);
XPps_synchronizer_control_Config* XPps_synchronizer_control_LookupConfig(u16 DeviceId);
int XPps_synchronizer_control_CfgInitialize(XPps_synchronizer_control *InstancePtr, XPps_synchronizer_control_Config *ConfigPtr);
#else
int XPps_synchronizer_control_Initialize(XPps_synchronizer_control *InstancePtr, const char* InstanceName);
int XPps_synchronizer_control_Release(XPps_synchronizer_control *InstancePtr);
#endif


void XPps_synchronizer_control_Set_mode_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_mode_reg(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_counter_config_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_counter_config_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_counter_status_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_counter_status_reg_vld(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_delay_ns_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_delay_ns_reg(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_load_secs_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_load_secs_reg(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_load_ns_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_load_ns_reg(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_load_subns_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_load_subns_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_capture_secs_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_capture_secs_reg_vld(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_capture_ns_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_capture_ns_reg_vld(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_capture_subns_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_capture_subns_reg_vld(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_current_secs_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_current_secs_reg_vld(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_current_ns_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_current_ns_reg_vld(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_current_subns_reg(XPps_synchronizer_control *InstancePtr);
u32 XPps_synchronizer_control_Get_current_subns_reg_vld(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_lockout_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_lockout_reg(XPps_synchronizer_control *InstancePtr);
void XPps_synchronizer_control_Set_rollover_thresh_reg(XPps_synchronizer_control *InstancePtr, u32 Data);
u32 XPps_synchronizer_control_Get_rollover_thresh_reg(XPps_synchronizer_control *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
