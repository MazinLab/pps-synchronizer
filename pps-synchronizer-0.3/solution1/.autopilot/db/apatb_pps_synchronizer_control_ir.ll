; ModuleID = '/home/cudaa/Workspace/hls/pps-synchronizer/pps-synchronizer/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.mode_config_t = type { %"struct.ap_uint<4>", %"struct.ap_uint<2>", %"struct.ap_uint<3>", %"struct.ap_uint<3>" }
%"struct.ap_uint<4>" = type { %"struct.ap_int_base<4, false>" }
%"struct.ap_int_base<4, false>" = type { %"struct.ssdm_int<4, false>" }
%"struct.ssdm_int<4, false>" = type { i4 }
%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%struct.counter_config_t = type { i8, %"struct.ap_uint<6>" }
%"struct.ap_uint<6>" = type { %"struct.ap_int_base<6, false>" }
%"struct.ap_int_base<6, false>" = type { %"struct.ssdm_int<6, false>" }
%"struct.ssdm_int<6, false>" = type { i6 }
%struct.counter_status_t = type { %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_pps_synchronizer_control_ir(%struct.mode_config_t* noalias nocapture nonnull readonly %mode_reg, %struct.counter_config_t* noalias nocapture nonnull readonly %counter_config_reg, %struct.counter_status_t* noalias nocapture nonnull %counter_status_reg, i32* noalias nocapture nonnull readonly %delay_ns_reg, i32* noalias nocapture nonnull readonly %load_secs_reg, i32* noalias nocapture nonnull readonly %load_ns_reg, i8* noalias nocapture nonnull readonly %load_subns_reg, i32* noalias nocapture nonnull %capture_secs_reg, i32* noalias nocapture nonnull %capture_ns_reg, i8* noalias nocapture nonnull %capture_subns_reg, i32* noalias nocapture nonnull %current_secs_reg, i32* noalias nocapture nonnull %current_ns_reg, i8* noalias nocapture nonnull %current_subns_reg, i16* noalias nocapture nonnull readonly %lockout_reg, i32* noalias nocapture nonnull readonly %rollover_thresh_reg, i32* noalias nocapture nonnull dereferenceable(4) %load_secs_ctl, i32* noalias nocapture nonnull dereferenceable(4) %load_ns_ctl, i8* noalias nocapture nonnull dereferenceable(1) %load_subns_ctl, %"struct.ap_uint<6>"* noalias nocapture nonnull dereferenceable(1) %ns_per_clk_ctl, i8* noalias nocapture nonnull dereferenceable(1) %subns_per_clk_ctl, i32* noalias nocapture nonnull dereferenceable(4) %delay_ns_ctl, i16* noalias nocapture nonnull dereferenceable(2) %lockout_ctl, i32* noalias nocapture nonnull dereferenceable(4) %rollover_thresh_ctl, %"struct.ap_uint<4>"* noalias nocapture nonnull dereferenceable(1) %mode_ctl, %"struct.ap_uint<2>"* noalias nocapture nonnull dereferenceable(1) %capture_mode_ctl, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %sanity_mode_ctl, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %pps_sel_ctl, i32* noalias nocapture nonnull readonly %captured_secs_in, i32* noalias nocapture nonnull readonly %captured_ns_in, i8* noalias nocapture nonnull readonly %captured_subns_in, %"struct.ap_uint<1>"* noalias nocapture nonnull readonly %running_in, i32* noalias nocapture nonnull readonly %secs_in, i32* noalias nocapture nonnull readonly %ns_in, i8* noalias nocapture nonnull readonly %subns_in, %"struct.ap_uint<1>"* noalias nocapture nonnull readonly %captured_in) local_unnamed_addr #0 {
entry:
  %mode_reg_copy = alloca %struct.mode_config_t, align 512
  %counter_config_reg_copy = alloca %struct.counter_config_t, align 512
  %counter_status_reg_copy = alloca %struct.counter_status_t, align 512
  %delay_ns_reg_copy = alloca i32, align 512
  %load_secs_reg_copy = alloca i32, align 512
  %load_ns_reg_copy = alloca i32, align 512
  %load_subns_reg_copy = alloca i8, align 512
  %capture_secs_reg_copy = alloca i32, align 512
  %capture_ns_reg_copy = alloca i32, align 512
  %capture_subns_reg_copy = alloca i8, align 512
  %current_secs_reg_copy = alloca i32, align 512
  %current_ns_reg_copy = alloca i32, align 512
  %current_subns_reg_copy = alloca i8, align 512
  %lockout_reg_copy = alloca i16, align 512
  %rollover_thresh_reg_copy = alloca i32, align 512
  %load_secs_ctl_copy = alloca i32, align 512
  %load_ns_ctl_copy = alloca i32, align 512
  %load_subns_ctl_copy = alloca i8, align 512
  %ns_per_clk_ctl_copy = alloca i6, align 512
  %subns_per_clk_ctl_copy = alloca i8, align 512
  %delay_ns_ctl_copy = alloca i32, align 512
  %lockout_ctl_copy = alloca i16, align 512
  %rollover_thresh_ctl_copy = alloca i32, align 512
  %mode_ctl_copy = alloca i4, align 512
  %capture_mode_ctl_copy = alloca i2, align 512
  %sanity_mode_ctl_copy = alloca i3, align 512
  %pps_sel_ctl_copy = alloca i3, align 512
  %captured_secs_in_copy = alloca i32, align 512
  %captured_ns_in_copy = alloca i32, align 512
  %captured_subns_in_copy = alloca i8, align 512
  %running_in_copy = alloca i1, align 512
  %secs_in_copy = alloca i32, align 512
  %ns_in_copy = alloca i32, align 512
  %subns_in_copy = alloca i8, align 512
  %captured_in_copy = alloca i1, align 512
  call fastcc void @copy_in(%struct.mode_config_t* nonnull %mode_reg, %struct.mode_config_t* nonnull align 512 %mode_reg_copy, %struct.counter_config_t* nonnull %counter_config_reg, %struct.counter_config_t* nonnull align 512 %counter_config_reg_copy, %struct.counter_status_t* nonnull %counter_status_reg, %struct.counter_status_t* nonnull align 512 %counter_status_reg_copy, i32* nonnull %delay_ns_reg, i32* nonnull align 512 %delay_ns_reg_copy, i32* nonnull %load_secs_reg, i32* nonnull align 512 %load_secs_reg_copy, i32* nonnull %load_ns_reg, i32* nonnull align 512 %load_ns_reg_copy, i8* nonnull %load_subns_reg, i8* nonnull align 512 %load_subns_reg_copy, i32* nonnull %capture_secs_reg, i32* nonnull align 512 %capture_secs_reg_copy, i32* nonnull %capture_ns_reg, i32* nonnull align 512 %capture_ns_reg_copy, i8* nonnull %capture_subns_reg, i8* nonnull align 512 %capture_subns_reg_copy, i32* nonnull %current_secs_reg, i32* nonnull align 512 %current_secs_reg_copy, i32* nonnull %current_ns_reg, i32* nonnull align 512 %current_ns_reg_copy, i8* nonnull %current_subns_reg, i8* nonnull align 512 %current_subns_reg_copy, i16* nonnull %lockout_reg, i16* nonnull align 512 %lockout_reg_copy, i32* nonnull %rollover_thresh_reg, i32* nonnull align 512 %rollover_thresh_reg_copy, i32* nonnull %load_secs_ctl, i32* nonnull align 512 %load_secs_ctl_copy, i32* nonnull %load_ns_ctl, i32* nonnull align 512 %load_ns_ctl_copy, i8* nonnull %load_subns_ctl, i8* nonnull align 512 %load_subns_ctl_copy, %"struct.ap_uint<6>"* nonnull %ns_per_clk_ctl, i6* nonnull align 512 %ns_per_clk_ctl_copy, i8* nonnull %subns_per_clk_ctl, i8* nonnull align 512 %subns_per_clk_ctl_copy, i32* nonnull %delay_ns_ctl, i32* nonnull align 512 %delay_ns_ctl_copy, i16* nonnull %lockout_ctl, i16* nonnull align 512 %lockout_ctl_copy, i32* nonnull %rollover_thresh_ctl, i32* nonnull align 512 %rollover_thresh_ctl_copy, %"struct.ap_uint<4>"* nonnull %mode_ctl, i4* nonnull align 512 %mode_ctl_copy, %"struct.ap_uint<2>"* nonnull %capture_mode_ctl, i2* nonnull align 512 %capture_mode_ctl_copy, %"struct.ap_uint<3>"* nonnull %sanity_mode_ctl, i3* nonnull align 512 %sanity_mode_ctl_copy, %"struct.ap_uint<3>"* nonnull %pps_sel_ctl, i3* nonnull align 512 %pps_sel_ctl_copy, i32* nonnull %captured_secs_in, i32* nonnull align 512 %captured_secs_in_copy, i32* nonnull %captured_ns_in, i32* nonnull align 512 %captured_ns_in_copy, i8* nonnull %captured_subns_in, i8* nonnull align 512 %captured_subns_in_copy, %"struct.ap_uint<1>"* nonnull %running_in, i1* nonnull align 512 %running_in_copy, i32* nonnull %secs_in, i32* nonnull align 512 %secs_in_copy, i32* nonnull %ns_in, i32* nonnull align 512 %ns_in_copy, i8* nonnull %subns_in, i8* nonnull align 512 %subns_in_copy, %"struct.ap_uint<1>"* nonnull %captured_in, i1* nonnull align 512 %captured_in_copy)
  call void @apatb_pps_synchronizer_control_hw(%struct.mode_config_t* %mode_reg_copy, %struct.counter_config_t* %counter_config_reg_copy, %struct.counter_status_t* %counter_status_reg_copy, i32* %delay_ns_reg_copy, i32* %load_secs_reg_copy, i32* %load_ns_reg_copy, i8* %load_subns_reg_copy, i32* %capture_secs_reg_copy, i32* %capture_ns_reg_copy, i8* %capture_subns_reg_copy, i32* %current_secs_reg_copy, i32* %current_ns_reg_copy, i8* %current_subns_reg_copy, i16* %lockout_reg_copy, i32* %rollover_thresh_reg_copy, i32* %load_secs_ctl_copy, i32* %load_ns_ctl_copy, i8* %load_subns_ctl_copy, i6* %ns_per_clk_ctl_copy, i8* %subns_per_clk_ctl_copy, i32* %delay_ns_ctl_copy, i16* %lockout_ctl_copy, i32* %rollover_thresh_ctl_copy, i4* %mode_ctl_copy, i2* %capture_mode_ctl_copy, i3* %sanity_mode_ctl_copy, i3* %pps_sel_ctl_copy, i32* %captured_secs_in_copy, i32* %captured_ns_in_copy, i8* %captured_subns_in_copy, i1* %running_in_copy, i32* %secs_in_copy, i32* %ns_in_copy, i8* %subns_in_copy, i1* %captured_in_copy)
  call void @copy_back(%struct.mode_config_t* %mode_reg, %struct.mode_config_t* %mode_reg_copy, %struct.counter_config_t* %counter_config_reg, %struct.counter_config_t* %counter_config_reg_copy, %struct.counter_status_t* %counter_status_reg, %struct.counter_status_t* %counter_status_reg_copy, i32* %delay_ns_reg, i32* %delay_ns_reg_copy, i32* %load_secs_reg, i32* %load_secs_reg_copy, i32* %load_ns_reg, i32* %load_ns_reg_copy, i8* %load_subns_reg, i8* %load_subns_reg_copy, i32* %capture_secs_reg, i32* %capture_secs_reg_copy, i32* %capture_ns_reg, i32* %capture_ns_reg_copy, i8* %capture_subns_reg, i8* %capture_subns_reg_copy, i32* %current_secs_reg, i32* %current_secs_reg_copy, i32* %current_ns_reg, i32* %current_ns_reg_copy, i8* %current_subns_reg, i8* %current_subns_reg_copy, i16* %lockout_reg, i16* %lockout_reg_copy, i32* %rollover_thresh_reg, i32* %rollover_thresh_reg_copy, i32* %load_secs_ctl, i32* %load_secs_ctl_copy, i32* %load_ns_ctl, i32* %load_ns_ctl_copy, i8* %load_subns_ctl, i8* %load_subns_ctl_copy, %"struct.ap_uint<6>"* %ns_per_clk_ctl, i6* %ns_per_clk_ctl_copy, i8* %subns_per_clk_ctl, i8* %subns_per_clk_ctl_copy, i32* %delay_ns_ctl, i32* %delay_ns_ctl_copy, i16* %lockout_ctl, i16* %lockout_ctl_copy, i32* %rollover_thresh_ctl, i32* %rollover_thresh_ctl_copy, %"struct.ap_uint<4>"* %mode_ctl, i4* %mode_ctl_copy, %"struct.ap_uint<2>"* %capture_mode_ctl, i2* %capture_mode_ctl_copy, %"struct.ap_uint<3>"* %sanity_mode_ctl, i3* %sanity_mode_ctl_copy, %"struct.ap_uint<3>"* %pps_sel_ctl, i3* %pps_sel_ctl_copy, i32* %captured_secs_in, i32* %captured_secs_in_copy, i32* %captured_ns_in, i32* %captured_ns_in_copy, i8* %captured_subns_in, i8* %captured_subns_in_copy, %"struct.ap_uint<1>"* %running_in, i1* %running_in_copy, i32* %secs_in, i32* %secs_in_copy, i32* %ns_in, i32* %ns_in_copy, i8* %subns_in, i8* %subns_in_copy, %"struct.ap_uint<1>"* %captured_in, i1* %captured_in_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%struct.mode_config_t* noalias readonly, %struct.mode_config_t* noalias align 512, %struct.counter_config_t* noalias readonly, %struct.counter_config_t* noalias align 512, %struct.counter_status_t* noalias readonly, %struct.counter_status_t* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i8* noalias readonly, i8* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i8* noalias readonly, i8* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i8* noalias readonly, i8* noalias align 512, i16* noalias readonly, i16* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i8* noalias readonly, i8* noalias align 512, %"struct.ap_uint<6>"* noalias readonly, i6* noalias align 512, i8* noalias readonly, i8* noalias align 512, i32* noalias readonly, i32* noalias align 512, i16* noalias readonly, i16* noalias align 512, i32* noalias readonly, i32* noalias align 512, %"struct.ap_uint<4>"* noalias readonly, i4* noalias align 512, %"struct.ap_uint<2>"* noalias readonly, i2* noalias align 512, %"struct.ap_uint<3>"* noalias readonly, i3* noalias align 512, %"struct.ap_uint<3>"* noalias readonly, i3* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i8* noalias readonly, i8* noalias align 512, %"struct.ap_uint<1>"* noalias readonly, i1* noalias align 512, i32* noalias readonly, i32* noalias align 512, i32* noalias readonly, i32* noalias align 512, i8* noalias readonly, i8* noalias align 512, %"struct.ap_uint<1>"* noalias readonly, i1* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.mode_config_t(%struct.mode_config_t* align 512 %1, %struct.mode_config_t* %0)
  call fastcc void @onebyonecpy_hls.p0struct.counter_config_t(%struct.counter_config_t* align 512 %3, %struct.counter_config_t* %2)
  call fastcc void @onebyonecpy_hls.p0struct.counter_status_t(%struct.counter_status_t* align 512 %5, %struct.counter_status_t* %4)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %7, i32* %6)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %9, i32* %8)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %11, i32* %10)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %13, i8* %12)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %15, i32* %14)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %17, i32* %16)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %19, i8* %18)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %21, i32* %20)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %23, i32* %22)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %25, i8* %24)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %27, i16* %26)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %29, i32* %28)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %31, i32* %30)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %33, i32* %32)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %35, i8* %34)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<6>"(i6* align 512 %37, %"struct.ap_uint<6>"* %36)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %39, i8* %38)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %41, i32* %40)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %43, i16* %42)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %45, i32* %44)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<4>.37"(i4* align 512 %47, %"struct.ap_uint<4>"* %46)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* align 512 %49, %"struct.ap_uint<2>"* %48)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.22"(i3* align 512 %51, %"struct.ap_uint<3>"* %50)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.22"(i3* align 512 %53, %"struct.ap_uint<3>"* %52)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %55, i32* %54)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %57, i32* %56)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %59, i8* %58)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.9"(i1* align 512 %61, %"struct.ap_uint<1>"* %60)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %63, i32* %62)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %65, i32* %64)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %67, i8* %66)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.9"(i1* align 512 %69, %"struct.ap_uint<1>"* %68)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.mode_config_t(%struct.mode_config_t* noalias align 512, %struct.mode_config_t* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.mode_config_t* %0, null
  %3 = icmp eq %struct.mode_config_t* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.09 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %1, i32 0, i32 0, i32 0, i32 0, i32 0
  %.01.0.0.010 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i4* %.0.0.0.09 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i4
  store i4 %7, i4* %.01.0.0.010, align 512
  %.1.0.0.015 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %.12.0.0.016 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %8 = bitcast i2* %.1.0.0.015 to i8*
  %9 = load i8, i8* %8
  %10 = trunc i8 %9 to i2
  store i2 %10, i2* %.12.0.0.016, align 1
  %.2.0.0.021 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %1, i32 0, i32 2, i32 0, i32 0, i32 0
  %.23.0.0.022 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %0, i32 0, i32 2, i32 0, i32 0, i32 0
  %11 = bitcast i3* %.2.0.0.021 to i8*
  %12 = load i8, i8* %11
  %13 = trunc i8 %12 to i3
  store i3 %13, i3* %.23.0.0.022, align 2
  %.3.0.0.027 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %1, i32 0, i32 3, i32 0, i32 0, i32 0
  %.34.0.0.028 = getelementptr %struct.mode_config_t, %struct.mode_config_t* %0, i32 0, i32 3, i32 0, i32 0, i32 0
  %14 = bitcast i3* %.3.0.0.027 to i8*
  %15 = load i8, i8* %14
  %16 = trunc i8 %15 to i3
  store i3 %16, i3* %.34.0.0.028, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.counter_config_t(%struct.counter_config_t* noalias align 512, %struct.counter_config_t* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.counter_config_t* %0, null
  %3 = icmp eq %struct.counter_config_t* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0 = getelementptr %struct.counter_config_t, %struct.counter_config_t* %1, i32 0, i32 0
  %.01 = getelementptr %struct.counter_config_t, %struct.counter_config_t* %0, i32 0, i32 0
  %5 = load i8, i8* %.0, align 1
  store i8 %5, i8* %.01, align 512
  %.1.0.0.07 = getelementptr %struct.counter_config_t, %struct.counter_config_t* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %.12.0.0.08 = getelementptr %struct.counter_config_t, %struct.counter_config_t* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %6 = bitcast i6* %.1.0.0.07 to i8*
  %7 = load i8, i8* %6
  %8 = trunc i8 %7 to i6
  store i6 %8, i6* %.12.0.0.08, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.counter_status_t(%struct.counter_status_t* noalias align 512, %struct.counter_status_t* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq %struct.counter_status_t* %0, null
  %3 = icmp eq %struct.counter_status_t* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.0.07 = getelementptr %struct.counter_status_t, %struct.counter_status_t* %1, i32 0, i32 0, i32 0, i32 0, i32 0
  %.01.0.0.08 = getelementptr %struct.counter_status_t, %struct.counter_status_t* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i1* %.0.0.0.07 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %.01.0.0.08, align 512
  %.1.0.0.013 = getelementptr %struct.counter_status_t, %struct.counter_status_t* %1, i32 0, i32 1, i32 0, i32 0, i32 0
  %.12.0.0.014 = getelementptr %struct.counter_status_t, %struct.counter_status_t* %0, i32 0, i32 1, i32 0, i32 0, i32 0
  %8 = bitcast i1* %.1.0.0.013 to i8*
  %9 = load i8, i8* %8
  %10 = trunc i8 %9 to i1
  store i1 %10, i1* %.12.0.0.014, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load i32, i32* %1, align 4
  store i32 %5, i32* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i8(i8* noalias align 512, i8* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i8* %0, null
  %3 = icmp eq i8* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load i8, i8* %1, align 1
  store i8 %5, i8* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0i16(i16* noalias align 512, i16* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i16* %0, null
  %3 = icmp eq i16* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = load i16, i16* %1, align 2
  store i16 %5, i16* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<6>"(i6* noalias align 512, %"struct.ap_uint<6>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i6* %0, null
  %3 = icmp eq %"struct.ap_uint<6>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<6>", %"struct.ap_uint<6>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i6* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i6
  store i6 %7, i6* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<4>"(%"struct.ap_uint<4>"* noalias, i4* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<4>"* %0, null
  %3 = icmp eq i4* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<4>", %"struct.ap_uint<4>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i4* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i4
  store i4 %7, i4* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* noalias align 512, %"struct.ap_uint<2>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i2* %0, null
  %3 = icmp eq %"struct.ap_uint<2>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<2>", %"struct.ap_uint<2>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i2* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i2
  store i2 %7, i2* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%struct.mode_config_t* noalias, %struct.mode_config_t* noalias readonly align 512, %struct.counter_config_t* noalias, %struct.counter_config_t* noalias readonly align 512, %struct.counter_status_t* noalias, %struct.counter_status_t* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, %"struct.ap_uint<6>"* noalias, i6* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, %"struct.ap_uint<4>"* noalias, i4* noalias readonly align 512, %"struct.ap_uint<2>"* noalias, i2* noalias readonly align 512, %"struct.ap_uint<3>"* noalias, i3* noalias readonly align 512, %"struct.ap_uint<3>"* noalias, i3* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, %"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, %"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.mode_config_t(%struct.mode_config_t* %0, %struct.mode_config_t* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0struct.counter_config_t(%struct.counter_config_t* %2, %struct.counter_config_t* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0struct.counter_status_t(%struct.counter_status_t* %4, %struct.counter_status_t* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %6, i32* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %8, i32* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %10, i32* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %12, i8* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %14, i32* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %16, i32* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %18, i8* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %20, i32* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %22, i32* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %24, i8* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %26, i16* align 512 %27)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %28, i32* align 512 %29)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %30, i32* align 512 %31)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %32, i32* align 512 %33)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %34, i8* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<6>.44"(%"struct.ap_uint<6>"* %36, i6* align 512 %37)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %38, i8* align 512 %39)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %40, i32* align 512 %41)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %42, i16* align 512 %43)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %44, i32* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<4>"(%"struct.ap_uint<4>"* %46, i4* align 512 %47)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.30"(%"struct.ap_uint<2>"* %48, i2* align 512 %49)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %50, i3* align 512 %51)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %52, i3* align 512 %53)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %54, i32* align 512 %55)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %56, i32* align 512 %57)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %58, i8* align 512 %59)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %60, i1* align 512 %61)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %62, i32* align 512 %63)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %64, i32* align 512 %65)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %66, i8* align 512 %67)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %68, i1* align 512 %69)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<1>"* %0, null
  %3 = icmp eq i1* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i1* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.9"(i1* noalias align 512, %"struct.ap_uint<1>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i1* %0, null
  %3 = icmp eq %"struct.ap_uint<1>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i1* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* noalias, i3* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<3>"* %0, null
  %3 = icmp eq i3* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<3>", %"struct.ap_uint<3>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i3* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i3
  store i3 %7, i3* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.22"(i3* noalias align 512, %"struct.ap_uint<3>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i3* %0, null
  %3 = icmp eq %"struct.ap_uint<3>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<3>", %"struct.ap_uint<3>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i3* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i3
  store i3 %7, i3* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.30"(%"struct.ap_uint<2>"* noalias, i2* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<2>"* %0, null
  %3 = icmp eq i2* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<2>", %"struct.ap_uint<2>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i2* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i2
  store i2 %7, i2* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<4>.37"(i4* noalias align 512, %"struct.ap_uint<4>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq i4* %0, null
  %3 = icmp eq %"struct.ap_uint<4>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<4>", %"struct.ap_uint<4>"* %1, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i4* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i4
  store i4 %7, i4* %0, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<6>.44"(%"struct.ap_uint<6>"* noalias, i6* noalias readonly align 512) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<6>"* %0, null
  %3 = icmp eq i6* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.01.0.05 = getelementptr %"struct.ap_uint<6>", %"struct.ap_uint<6>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i6* %1 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i6
  store i6 %7, i6* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_pps_synchronizer_control_hw(%struct.mode_config_t*, %struct.counter_config_t*, %struct.counter_status_t*, i32*, i32*, i32*, i8*, i32*, i32*, i8*, i32*, i32*, i8*, i16*, i32*, i32*, i32*, i8*, i6*, i8*, i32*, i16*, i32*, i4*, i2*, i3*, i3*, i32*, i32*, i8*, i1*, i32*, i32*, i8*, i1*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%struct.mode_config_t* noalias, %struct.mode_config_t* noalias readonly align 512, %struct.counter_config_t* noalias, %struct.counter_config_t* noalias readonly align 512, %struct.counter_status_t* noalias, %struct.counter_status_t* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, %"struct.ap_uint<6>"* noalias, i6* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i16* noalias, i16* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, %"struct.ap_uint<4>"* noalias, i4* noalias readonly align 512, %"struct.ap_uint<2>"* noalias, i2* noalias readonly align 512, %"struct.ap_uint<3>"* noalias, i3* noalias readonly align 512, %"struct.ap_uint<3>"* noalias, i3* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, %"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i32* noalias, i32* noalias readonly align 512, i8* noalias, i8* noalias readonly align 512, %"struct.ap_uint<1>"* noalias, i1* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.counter_status_t(%struct.counter_status_t* %4, %struct.counter_status_t* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %14, i32* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %16, i32* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %18, i8* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %20, i32* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %22, i32* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %24, i8* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %30, i32* align 512 %31)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %32, i32* align 512 %33)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %34, i8* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<6>.44"(%"struct.ap_uint<6>"* %36, i6* align 512 %37)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %38, i8* align 512 %39)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %40, i32* align 512 %41)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %42, i16* align 512 %43)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %44, i32* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<4>"(%"struct.ap_uint<4>"* %46, i4* align 512 %47)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.30"(%"struct.ap_uint<2>"* %48, i2* align 512 %49)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %50, i3* align 512 %51)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %52, i3* align 512 %53)
  ret void
}

define void @pps_synchronizer_control_hw_stub_wrapper(%struct.mode_config_t*, %struct.counter_config_t*, %struct.counter_status_t*, i32*, i32*, i32*, i8*, i32*, i32*, i8*, i32*, i32*, i8*, i16*, i32*, i32*, i32*, i8*, i6*, i8*, i32*, i16*, i32*, i4*, i2*, i3*, i3*, i32*, i32*, i8*, i1*, i32*, i32*, i8*, i1*) #4 {
entry:
  %35 = alloca %"struct.ap_uint<6>"
  %36 = alloca %"struct.ap_uint<4>"
  %37 = alloca %"struct.ap_uint<2>"
  %38 = alloca %"struct.ap_uint<3>"
  %39 = alloca %"struct.ap_uint<3>"
  %40 = alloca %"struct.ap_uint<1>"
  %41 = alloca %"struct.ap_uint<1>"
  call void @copy_out(%struct.mode_config_t* null, %struct.mode_config_t* %0, %struct.counter_config_t* null, %struct.counter_config_t* %1, %struct.counter_status_t* null, %struct.counter_status_t* %2, i32* null, i32* %3, i32* null, i32* %4, i32* null, i32* %5, i8* null, i8* %6, i32* null, i32* %7, i32* null, i32* %8, i8* null, i8* %9, i32* null, i32* %10, i32* null, i32* %11, i8* null, i8* %12, i16* null, i16* %13, i32* null, i32* %14, i32* null, i32* %15, i32* null, i32* %16, i8* null, i8* %17, %"struct.ap_uint<6>"* %35, i6* %18, i8* null, i8* %19, i32* null, i32* %20, i16* null, i16* %21, i32* null, i32* %22, %"struct.ap_uint<4>"* %36, i4* %23, %"struct.ap_uint<2>"* %37, i2* %24, %"struct.ap_uint<3>"* %38, i3* %25, %"struct.ap_uint<3>"* %39, i3* %26, i32* null, i32* %27, i32* null, i32* %28, i8* null, i8* %29, %"struct.ap_uint<1>"* %40, i1* %30, i32* null, i32* %31, i32* null, i32* %32, i8* null, i8* %33, %"struct.ap_uint<1>"* %41, i1* %34)
  call void @pps_synchronizer_control_hw_stub(%struct.mode_config_t* %0, %struct.counter_config_t* %1, %struct.counter_status_t* %2, i32* %3, i32* %4, i32* %5, i8* %6, i32* %7, i32* %8, i8* %9, i32* %10, i32* %11, i8* %12, i16* %13, i32* %14, i32* %15, i32* %16, i8* %17, %"struct.ap_uint<6>"* %35, i8* %19, i32* %20, i16* %21, i32* %22, %"struct.ap_uint<4>"* %36, %"struct.ap_uint<2>"* %37, %"struct.ap_uint<3>"* %38, %"struct.ap_uint<3>"* %39, i32* %27, i32* %28, i8* %29, %"struct.ap_uint<1>"* %40, i32* %31, i32* %32, i8* %33, %"struct.ap_uint<1>"* %41)
  call void @copy_in(%struct.mode_config_t* null, %struct.mode_config_t* %0, %struct.counter_config_t* null, %struct.counter_config_t* %1, %struct.counter_status_t* null, %struct.counter_status_t* %2, i32* null, i32* %3, i32* null, i32* %4, i32* null, i32* %5, i8* null, i8* %6, i32* null, i32* %7, i32* null, i32* %8, i8* null, i8* %9, i32* null, i32* %10, i32* null, i32* %11, i8* null, i8* %12, i16* null, i16* %13, i32* null, i32* %14, i32* null, i32* %15, i32* null, i32* %16, i8* null, i8* %17, %"struct.ap_uint<6>"* %35, i6* %18, i8* null, i8* %19, i32* null, i32* %20, i16* null, i16* %21, i32* null, i32* %22, %"struct.ap_uint<4>"* %36, i4* %23, %"struct.ap_uint<2>"* %37, i2* %24, %"struct.ap_uint<3>"* %38, i3* %25, %"struct.ap_uint<3>"* %39, i3* %26, i32* null, i32* %27, i32* null, i32* %28, i8* null, i8* %29, %"struct.ap_uint<1>"* %40, i1* %30, i32* null, i32* %31, i32* null, i32* %32, i8* null, i8* %33, %"struct.ap_uint<1>"* %41, i1* %34)
  ret void
}

declare void @pps_synchronizer_control_hw_stub(%struct.mode_config_t*, %struct.counter_config_t*, %struct.counter_status_t*, i32*, i32*, i32*, i8*, i32*, i32*, i8*, i32*, i32*, i8*, i16*, i32*, i32*, i32*, i8*, %"struct.ap_uint<6>"*, i8*, i32*, i16*, i32*, %"struct.ap_uint<4>"*, %"struct.ap_uint<2>"*, %"struct.ap_uint<3>"*, %"struct.ap_uint<3>"*, i32*, i32*, i8*, %"struct.ap_uint<1>"*, i32*, i32*, i8*, %"struct.ap_uint<1>"*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
