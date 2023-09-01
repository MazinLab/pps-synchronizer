#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_mode_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_mode_reg.dat"
#define AUTOTB_TVOUT_mode_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_mode_reg.dat"
#define AUTOTB_TVIN_counter_config_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_counter_config_reg.dat"
#define AUTOTB_TVOUT_counter_config_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_counter_config_reg.dat"
#define AUTOTB_TVIN_counter_status_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_counter_status_reg.dat"
#define AUTOTB_TVOUT_counter_status_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_counter_status_reg.dat"
#define AUTOTB_TVIN_delay_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_delay_ns_reg.dat"
#define AUTOTB_TVOUT_delay_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_delay_ns_reg.dat"
#define AUTOTB_TVIN_load_secs_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_load_secs_reg.dat"
#define AUTOTB_TVOUT_load_secs_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_load_secs_reg.dat"
#define AUTOTB_TVIN_load_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_load_ns_reg.dat"
#define AUTOTB_TVOUT_load_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_load_ns_reg.dat"
#define AUTOTB_TVIN_load_subns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_load_subns_reg.dat"
#define AUTOTB_TVOUT_load_subns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_load_subns_reg.dat"
#define AUTOTB_TVIN_capture_secs_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_capture_secs_reg.dat"
#define AUTOTB_TVOUT_capture_secs_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_capture_secs_reg.dat"
#define AUTOTB_TVIN_capture_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_capture_ns_reg.dat"
#define AUTOTB_TVOUT_capture_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_capture_ns_reg.dat"
#define AUTOTB_TVIN_capture_subns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_capture_subns_reg.dat"
#define AUTOTB_TVOUT_capture_subns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_capture_subns_reg.dat"
#define AUTOTB_TVIN_current_secs_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_current_secs_reg.dat"
#define AUTOTB_TVOUT_current_secs_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_current_secs_reg.dat"
#define AUTOTB_TVIN_current_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_current_ns_reg.dat"
#define AUTOTB_TVOUT_current_ns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_current_ns_reg.dat"
#define AUTOTB_TVIN_current_subns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_current_subns_reg.dat"
#define AUTOTB_TVOUT_current_subns_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_current_subns_reg.dat"
#define AUTOTB_TVIN_lockout_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_lockout_reg.dat"
#define AUTOTB_TVOUT_lockout_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_lockout_reg.dat"
#define AUTOTB_TVIN_rollover_thresh_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvin_rollover_thresh_reg.dat"
#define AUTOTB_TVOUT_rollover_thresh_reg "../tv/cdatafile/c.pps_synchronizer_control.autotvout_rollover_thresh_reg.dat"
#define AUTOTB_TVIN_load_secs_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_load_secs_ctl.dat"
#define AUTOTB_TVOUT_load_secs_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_load_secs_ctl.dat"
#define AUTOTB_TVIN_load_ns_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_load_ns_ctl.dat"
#define AUTOTB_TVOUT_load_ns_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_load_ns_ctl.dat"
#define AUTOTB_TVIN_load_subns_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_load_subns_ctl.dat"
#define AUTOTB_TVOUT_load_subns_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_load_subns_ctl.dat"
#define AUTOTB_TVIN_ns_per_clk_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_ns_per_clk_ctl.dat"
#define AUTOTB_TVOUT_ns_per_clk_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_ns_per_clk_ctl.dat"
#define AUTOTB_TVIN_subns_per_clk_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_subns_per_clk_ctl.dat"
#define AUTOTB_TVOUT_subns_per_clk_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_subns_per_clk_ctl.dat"
#define AUTOTB_TVIN_delay_ns_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_delay_ns_ctl.dat"
#define AUTOTB_TVOUT_delay_ns_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_delay_ns_ctl.dat"
#define AUTOTB_TVIN_lockout_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_lockout_ctl.dat"
#define AUTOTB_TVOUT_lockout_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_lockout_ctl.dat"
#define AUTOTB_TVIN_rollover_thresh_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_rollover_thresh_ctl.dat"
#define AUTOTB_TVOUT_rollover_thresh_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_rollover_thresh_ctl.dat"
#define AUTOTB_TVIN_mode_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_mode_ctl.dat"
#define AUTOTB_TVOUT_mode_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_mode_ctl.dat"
#define AUTOTB_TVIN_capture_mode_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_capture_mode_ctl.dat"
#define AUTOTB_TVOUT_capture_mode_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_capture_mode_ctl.dat"
#define AUTOTB_TVIN_sanity_mode_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_sanity_mode_ctl.dat"
#define AUTOTB_TVOUT_sanity_mode_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_sanity_mode_ctl.dat"
#define AUTOTB_TVIN_pps_sel_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvin_pps_sel_ctl.dat"
#define AUTOTB_TVOUT_pps_sel_ctl "../tv/cdatafile/c.pps_synchronizer_control.autotvout_pps_sel_ctl.dat"
#define AUTOTB_TVIN_captured_secs_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_captured_secs_in.dat"
#define AUTOTB_TVOUT_captured_secs_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_captured_secs_in.dat"
#define AUTOTB_TVIN_captured_ns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_captured_ns_in.dat"
#define AUTOTB_TVOUT_captured_ns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_captured_ns_in.dat"
#define AUTOTB_TVIN_captured_subns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_captured_subns_in.dat"
#define AUTOTB_TVOUT_captured_subns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_captured_subns_in.dat"
#define AUTOTB_TVIN_running_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_running_in.dat"
#define AUTOTB_TVOUT_running_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_running_in.dat"
#define AUTOTB_TVIN_secs_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_secs_in.dat"
#define AUTOTB_TVOUT_secs_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_secs_in.dat"
#define AUTOTB_TVIN_ns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_ns_in.dat"
#define AUTOTB_TVOUT_ns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_ns_in.dat"
#define AUTOTB_TVIN_subns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_subns_in.dat"
#define AUTOTB_TVOUT_subns_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_subns_in.dat"
#define AUTOTB_TVIN_captured_in "../tv/cdatafile/c.pps_synchronizer_control.autotvin_captured_in.dat"
#define AUTOTB_TVOUT_captured_in "../tv/cdatafile/c.pps_synchronizer_control.autotvout_captured_in.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_mode_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_mode_reg.dat"
#define AUTOTB_TVOUT_PC_counter_config_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_counter_config_reg.dat"
#define AUTOTB_TVOUT_PC_counter_status_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_counter_status_reg.dat"
#define AUTOTB_TVOUT_PC_delay_ns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_delay_ns_reg.dat"
#define AUTOTB_TVOUT_PC_load_secs_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_load_secs_reg.dat"
#define AUTOTB_TVOUT_PC_load_ns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_load_ns_reg.dat"
#define AUTOTB_TVOUT_PC_load_subns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_load_subns_reg.dat"
#define AUTOTB_TVOUT_PC_capture_secs_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_capture_secs_reg.dat"
#define AUTOTB_TVOUT_PC_capture_ns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_capture_ns_reg.dat"
#define AUTOTB_TVOUT_PC_capture_subns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_capture_subns_reg.dat"
#define AUTOTB_TVOUT_PC_current_secs_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_current_secs_reg.dat"
#define AUTOTB_TVOUT_PC_current_ns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_current_ns_reg.dat"
#define AUTOTB_TVOUT_PC_current_subns_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_current_subns_reg.dat"
#define AUTOTB_TVOUT_PC_lockout_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_lockout_reg.dat"
#define AUTOTB_TVOUT_PC_rollover_thresh_reg "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_rollover_thresh_reg.dat"
#define AUTOTB_TVOUT_PC_load_secs_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_load_secs_ctl.dat"
#define AUTOTB_TVOUT_PC_load_ns_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_load_ns_ctl.dat"
#define AUTOTB_TVOUT_PC_load_subns_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_load_subns_ctl.dat"
#define AUTOTB_TVOUT_PC_ns_per_clk_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_ns_per_clk_ctl.dat"
#define AUTOTB_TVOUT_PC_subns_per_clk_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_subns_per_clk_ctl.dat"
#define AUTOTB_TVOUT_PC_delay_ns_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_delay_ns_ctl.dat"
#define AUTOTB_TVOUT_PC_lockout_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_lockout_ctl.dat"
#define AUTOTB_TVOUT_PC_rollover_thresh_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_rollover_thresh_ctl.dat"
#define AUTOTB_TVOUT_PC_mode_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_mode_ctl.dat"
#define AUTOTB_TVOUT_PC_capture_mode_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_capture_mode_ctl.dat"
#define AUTOTB_TVOUT_PC_sanity_mode_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_sanity_mode_ctl.dat"
#define AUTOTB_TVOUT_PC_pps_sel_ctl "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_pps_sel_ctl.dat"
#define AUTOTB_TVOUT_PC_captured_secs_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_captured_secs_in.dat"
#define AUTOTB_TVOUT_PC_captured_ns_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_captured_ns_in.dat"
#define AUTOTB_TVOUT_PC_captured_subns_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_captured_subns_in.dat"
#define AUTOTB_TVOUT_PC_running_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_running_in.dat"
#define AUTOTB_TVOUT_PC_secs_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_secs_in.dat"
#define AUTOTB_TVOUT_PC_ns_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_ns_in.dat"
#define AUTOTB_TVOUT_PC_subns_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_subns_in.dat"
#define AUTOTB_TVOUT_PC_captured_in "../tv/rtldatafile/rtl.pps_synchronizer_control.autotvout_captured_in.dat"


static const bool little_endian()
{
  int a = 1;
  return *(char*)&a == 1;
}

inline static void rev_endian(char* p, size_t nbytes)
{
  std::reverse(p, p+nbytes);
}

template<size_t bit_width>
struct transaction {
  typedef uint64_t depth_t;
  static const size_t wbytes = (bit_width+7)>>3;
  static const size_t dbytes = sizeof(depth_t);
  const depth_t depth;
  const size_t vbytes;
  const size_t tbytes;
  char * const p;
  typedef char (*p_dat)[wbytes];
  p_dat vp;

  transaction(depth_t depth)
    : depth(depth), vbytes(wbytes*depth), tbytes(dbytes+vbytes),
      p(new char[tbytes]) {
    *(depth_t*)p = depth;
    rev_endian(p, dbytes);
    vp = (p_dat) (p+dbytes);
  }

  void reorder() {
    rev_endian(p, dbytes);
    p_dat vp = (p_dat) (p+dbytes);
    for (depth_t i = 0; i < depth; ++i) {
      rev_endian(vp[i], wbytes);
    }
  }

  template<size_t psize>
  void import(char* param, depth_t num, int64_t offset) {
    param -= offset*psize;
    for (depth_t i = 0; i < num; ++i) {
      memcpy(vp[i], param, wbytes);
      param += psize;
      if (little_endian()) {
        rev_endian(vp[i], wbytes);
      }
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[i], wbytes);
      param += psize;
    }
    vp += num;
  }

  template<size_t psize>
  void send(char* param, depth_t num, int64_t skip) {
    for (depth_t i = 0; i < num; ++i) {
      memcpy(param, vp[skip+i], wbytes);
      param += psize;
    }
  }

  ~transaction() { if (p) { delete[] p; } }
};


inline static const std::string begin_str(int num)
{
  return std::string("[[transaction]]           ")
         .append(std::to_string(num))
         .append("\n");
}

inline static const std::string end_str()
{
  return std::string("[[/transaction]]\n");
}

const std::string formatData(unsigned char *pos, size_t wbits)
{
  bool LE = little_endian();
  size_t wbytes = (wbits+7)>>3;
  size_t i = LE ? wbytes-1 : 0;
  auto next = [&] () {
    auto c = pos[i];
    LE ? --i : ++i;
    return c;
  };
  std::ostringstream ss;
  ss << "0x";
  if (int t = (wbits & 0x7)) {
    if (t <= 4) {
      unsigned char mask = (1<<t)-1;
      ss << std::hex << std::setfill('0') << std::setw(1)
         << (int) (next() & mask);
      wbytes -= 1;
    }
  }
  for (size_t i = 0; i < wbytes; ++i) {
    ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
  }
  ss.put('\n');
  return ss.str();
}

static bool RTLOutputCheckAndReplacement(std::string &data)
{
  bool changed = false;
  for (size_t i = 2; i < data.size(); ++i) {
    if (data[i] == 'X' || data[i] == 'x') {
      data[i] = '0';
      changed = true;
    }
  }
  return changed;
}

struct SimException : public std::exception {
  const char *msg;
  const size_t line;
  SimException(const char *msg, const size_t line)
    : msg(msg), line(line)
  {
  }
};

template<size_t bit_width>
class PostCheck
{
  static const char *bad;
  static const char *err;
  std::fstream stream;
  std::string s;

  void send(char *p, ap_uint<bit_width> &data, size_t l, size_t rest)
  {
    if (rest == 0) {
      if (!little_endian()) {
        const size_t wbytes = (bit_width+7)>>3;
        rev_endian(p-wbytes, wbytes);
      }
    } else if (rest < 8) {
      *p = data.range(l+rest-1, l).to_uint();
      send(p+1, data, l+rest, 0);
    } else {
      *p = data.range(l+8-1, l).to_uint();
      send(p+1, data, l+8, rest-8);
    }
  }

  void readline()
  {
    std::getline(stream, s);
    if (stream.eof()) {
      throw SimException(bad, __LINE__);
    }
  }

public:
  char *param;
  size_t psize;
  size_t depth;

  PostCheck(const char *file)
  {
    stream.open(file);
    if (stream.fail()) {
      throw SimException(err, __LINE__);
    } else {
      readline();
      if (s != "[[[runtime]]]") {
        throw SimException(bad, __LINE__);
      }
    }
  }

  ~PostCheck() noexcept(false)
  {
    stream.close();
  }

  void run(size_t AESL_transaction_pc, size_t skip)
  {
    if (stream.peek() == '[') {
      readline();
    }

    for (size_t i = 0; i < skip; ++i) {
      readline();
    }

    bool foundX = false;
    for (size_t i = 0; i < depth; ++i) {
      readline();
      foundX |= RTLOutputCheckAndReplacement(s);
      ap_uint<bit_width> data(s.c_str(), 16);
      send(param+i*psize, data, 0, bit_width);
    }
    if (foundX) {
      std::cerr << "WARNING: [SIM 212-201] RTL produces unknown value "
                << "'x' or 'X' on some port, possible cause: "
                << "There are uninitialized variables in the design.\n";
    }

    if (stream.peek() == '[') {
      readline();
    }
  }
};

template<size_t bit_width>
const char* PostCheck<bit_width>::bad = "Bad TV file";

template<size_t bit_width>
const char* PostCheck<bit_width>::err = "Error on TV file";
      
class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  mode_reg_depth = 0;
  counter_config_reg_depth = 0;
  counter_status_reg_depth = 0;
  delay_ns_reg_depth = 0;
  load_secs_reg_depth = 0;
  load_ns_reg_depth = 0;
  load_subns_reg_depth = 0;
  capture_secs_reg_depth = 0;
  capture_ns_reg_depth = 0;
  capture_subns_reg_depth = 0;
  current_secs_reg_depth = 0;
  current_ns_reg_depth = 0;
  current_subns_reg_depth = 0;
  lockout_reg_depth = 0;
  rollover_thresh_reg_depth = 0;
  load_secs_ctl_depth = 0;
  load_ns_ctl_depth = 0;
  load_subns_ctl_depth = 0;
  ns_per_clk_ctl_depth = 0;
  subns_per_clk_ctl_depth = 0;
  delay_ns_ctl_depth = 0;
  lockout_ctl_depth = 0;
  rollover_thresh_ctl_depth = 0;
  mode_ctl_depth = 0;
  capture_mode_ctl_depth = 0;
  sanity_mode_ctl_depth = 0;
  pps_sel_ctl_depth = 0;
  captured_secs_in_depth = 0;
  captured_ns_in_depth = 0;
  captured_subns_in_depth = 0;
  running_in_depth = 0;
  secs_in_depth = 0;
  ns_in_depth = 0;
  subns_in_depth = 0;
  captured_in_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{mode_reg " << mode_reg_depth << "}\n";
  total_list << "{counter_config_reg " << counter_config_reg_depth << "}\n";
  total_list << "{counter_status_reg " << counter_status_reg_depth << "}\n";
  total_list << "{delay_ns_reg " << delay_ns_reg_depth << "}\n";
  total_list << "{load_secs_reg " << load_secs_reg_depth << "}\n";
  total_list << "{load_ns_reg " << load_ns_reg_depth << "}\n";
  total_list << "{load_subns_reg " << load_subns_reg_depth << "}\n";
  total_list << "{capture_secs_reg " << capture_secs_reg_depth << "}\n";
  total_list << "{capture_ns_reg " << capture_ns_reg_depth << "}\n";
  total_list << "{capture_subns_reg " << capture_subns_reg_depth << "}\n";
  total_list << "{current_secs_reg " << current_secs_reg_depth << "}\n";
  total_list << "{current_ns_reg " << current_ns_reg_depth << "}\n";
  total_list << "{current_subns_reg " << current_subns_reg_depth << "}\n";
  total_list << "{lockout_reg " << lockout_reg_depth << "}\n";
  total_list << "{rollover_thresh_reg " << rollover_thresh_reg_depth << "}\n";
  total_list << "{load_secs_ctl " << load_secs_ctl_depth << "}\n";
  total_list << "{load_ns_ctl " << load_ns_ctl_depth << "}\n";
  total_list << "{load_subns_ctl " << load_subns_ctl_depth << "}\n";
  total_list << "{ns_per_clk_ctl " << ns_per_clk_ctl_depth << "}\n";
  total_list << "{subns_per_clk_ctl " << subns_per_clk_ctl_depth << "}\n";
  total_list << "{delay_ns_ctl " << delay_ns_ctl_depth << "}\n";
  total_list << "{lockout_ctl " << lockout_ctl_depth << "}\n";
  total_list << "{rollover_thresh_ctl " << rollover_thresh_ctl_depth << "}\n";
  total_list << "{mode_ctl " << mode_ctl_depth << "}\n";
  total_list << "{capture_mode_ctl " << capture_mode_ctl_depth << "}\n";
  total_list << "{sanity_mode_ctl " << sanity_mode_ctl_depth << "}\n";
  total_list << "{pps_sel_ctl " << pps_sel_ctl_depth << "}\n";
  total_list << "{captured_secs_in " << captured_secs_in_depth << "}\n";
  total_list << "{captured_ns_in " << captured_ns_in_depth << "}\n";
  total_list << "{captured_subns_in " << captured_subns_in_depth << "}\n";
  total_list << "{running_in " << running_in_depth << "}\n";
  total_list << "{secs_in " << secs_in_depth << "}\n";
  total_list << "{ns_in " << ns_in_depth << "}\n";
  total_list << "{subns_in " << subns_in_depth << "}\n";
  total_list << "{captured_in " << captured_in_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int mode_reg_depth;
    int counter_config_reg_depth;
    int counter_status_reg_depth;
    int delay_ns_reg_depth;
    int load_secs_reg_depth;
    int load_ns_reg_depth;
    int load_subns_reg_depth;
    int capture_secs_reg_depth;
    int capture_ns_reg_depth;
    int capture_subns_reg_depth;
    int current_secs_reg_depth;
    int current_ns_reg_depth;
    int current_subns_reg_depth;
    int lockout_reg_depth;
    int rollover_thresh_reg_depth;
    int load_secs_ctl_depth;
    int load_ns_ctl_depth;
    int load_subns_ctl_depth;
    int ns_per_clk_ctl_depth;
    int subns_per_clk_ctl_depth;
    int delay_ns_ctl_depth;
    int lockout_ctl_depth;
    int rollover_thresh_ctl_depth;
    int mode_ctl_depth;
    int capture_mode_ctl_depth;
    int sanity_mode_ctl_depth;
    int pps_sel_ctl_depth;
    int captured_secs_in_depth;
    int captured_ns_in_depth;
    int captured_subns_in_depth;
    int running_in_depth;
    int secs_in_depth;
    int ns_in_depth;
    int subns_in_depth;
    int captured_in_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};


struct __cosim_s4__ { char data[4]; };
struct __cosim_s2__ { char data[2]; };
extern "C" void pps_synchronizer_control_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_pps_synchronizer_control_hw(volatile void * __xlx_apatb_param_mode_reg, volatile void * __xlx_apatb_param_counter_config_reg, volatile void * __xlx_apatb_param_counter_status_reg, volatile void * __xlx_apatb_param_delay_ns_reg, volatile void * __xlx_apatb_param_load_secs_reg, volatile void * __xlx_apatb_param_load_ns_reg, volatile void * __xlx_apatb_param_load_subns_reg, volatile void * __xlx_apatb_param_capture_secs_reg, volatile void * __xlx_apatb_param_capture_ns_reg, volatile void * __xlx_apatb_param_capture_subns_reg, volatile void * __xlx_apatb_param_current_secs_reg, volatile void * __xlx_apatb_param_current_ns_reg, volatile void * __xlx_apatb_param_current_subns_reg, volatile void * __xlx_apatb_param_lockout_reg, volatile void * __xlx_apatb_param_rollover_thresh_reg, volatile void * __xlx_apatb_param_load_secs_ctl, volatile void * __xlx_apatb_param_load_ns_ctl, volatile void * __xlx_apatb_param_load_subns_ctl, volatile void * __xlx_apatb_param_ns_per_clk_ctl, volatile void * __xlx_apatb_param_subns_per_clk_ctl, volatile void * __xlx_apatb_param_delay_ns_ctl, volatile void * __xlx_apatb_param_lockout_ctl, volatile void * __xlx_apatb_param_rollover_thresh_ctl, volatile void * __xlx_apatb_param_mode_ctl, volatile void * __xlx_apatb_param_capture_mode_ctl, volatile void * __xlx_apatb_param_sanity_mode_ctl, volatile void * __xlx_apatb_param_pps_sel_ctl, volatile void * __xlx_apatb_param_captured_secs_in, volatile void * __xlx_apatb_param_captured_ns_in, volatile void * __xlx_apatb_param_captured_subns_in, volatile void * __xlx_apatb_param_running_in, volatile void * __xlx_apatb_param_secs_in, volatile void * __xlx_apatb_param_ns_in, volatile void * __xlx_apatb_param_subns_in, volatile void * __xlx_apatb_param_captured_in) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
static AESL_FILE_HANDLER aesl_fh;
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_counter_status_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<16> > counter_status_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              counter_status_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "counter_status_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_counter_status_reg)[j*2+0] = counter_status_reg_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_counter_status_reg)[j*2+1] = counter_status_reg_pc_buffer[i].range(15, 8).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_capture_secs_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > capture_secs_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              capture_secs_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "capture_secs_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_capture_secs_reg)[0*4+0] = capture_secs_reg_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_capture_secs_reg)[0*4+1] = capture_secs_reg_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_capture_secs_reg)[0*4+2] = capture_secs_reg_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_capture_secs_reg)[0*4+3] = capture_secs_reg_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_capture_ns_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > capture_ns_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              capture_ns_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "capture_ns_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_capture_ns_reg)[0*4+0] = capture_ns_reg_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_capture_ns_reg)[0*4+1] = capture_ns_reg_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_capture_ns_reg)[0*4+2] = capture_ns_reg_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_capture_ns_reg)[0*4+3] = capture_ns_reg_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_capture_subns_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > capture_subns_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              capture_subns_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "capture_subns_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_capture_subns_reg)[0*1+0] = capture_subns_reg_pc_buffer[0].range(7, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_current_secs_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > current_secs_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              current_secs_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "current_secs_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_current_secs_reg)[0*4+0] = current_secs_reg_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_current_secs_reg)[0*4+1] = current_secs_reg_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_current_secs_reg)[0*4+2] = current_secs_reg_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_current_secs_reg)[0*4+3] = current_secs_reg_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_current_ns_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > current_ns_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              current_ns_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "current_ns_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_current_ns_reg)[0*4+0] = current_ns_reg_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_current_ns_reg)[0*4+1] = current_ns_reg_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_current_ns_reg)[0*4+2] = current_ns_reg_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_current_ns_reg)[0*4+3] = current_ns_reg_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_current_subns_reg);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > current_subns_reg_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              current_subns_reg_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "current_subns_reg" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_current_subns_reg)[0*1+0] = current_subns_reg_pc_buffer[0].range(7, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_load_secs_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > load_secs_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              load_secs_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "load_secs_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_load_secs_ctl)[0*4+0] = load_secs_ctl_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_load_secs_ctl)[0*4+1] = load_secs_ctl_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_load_secs_ctl)[0*4+2] = load_secs_ctl_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_load_secs_ctl)[0*4+3] = load_secs_ctl_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_load_ns_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > load_ns_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              load_ns_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "load_ns_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_load_ns_ctl)[0*4+0] = load_ns_ctl_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_load_ns_ctl)[0*4+1] = load_ns_ctl_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_load_ns_ctl)[0*4+2] = load_ns_ctl_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_load_ns_ctl)[0*4+3] = load_ns_ctl_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_load_subns_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > load_subns_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              load_subns_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "load_subns_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_load_subns_ctl)[0*1+0] = load_subns_ctl_pc_buffer[0].range(7, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_ns_per_clk_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<6> > ns_per_clk_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              ns_per_clk_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "ns_per_clk_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_ns_per_clk_ctl)[0*1+0] = ns_per_clk_ctl_pc_buffer[0].range(5, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_subns_per_clk_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > subns_per_clk_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              subns_per_clk_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "subns_per_clk_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_subns_per_clk_ctl)[0*1+0] = subns_per_clk_ctl_pc_buffer[0].range(7, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_delay_ns_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > delay_ns_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              delay_ns_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "delay_ns_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_delay_ns_ctl)[0*4+0] = delay_ns_ctl_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_delay_ns_ctl)[0*4+1] = delay_ns_ctl_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_delay_ns_ctl)[0*4+2] = delay_ns_ctl_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_delay_ns_ctl)[0*4+3] = delay_ns_ctl_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_lockout_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<16> > lockout_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              lockout_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "lockout_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_lockout_ctl)[0*2+0] = lockout_ctl_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_lockout_ctl)[0*2+1] = lockout_ctl_pc_buffer[0].range(15, 8).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_rollover_thresh_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > rollover_thresh_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              rollover_thresh_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "rollover_thresh_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_rollover_thresh_ctl)[0*4+0] = rollover_thresh_ctl_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_rollover_thresh_ctl)[0*4+1] = rollover_thresh_ctl_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_rollover_thresh_ctl)[0*4+2] = rollover_thresh_ctl_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_rollover_thresh_ctl)[0*4+3] = rollover_thresh_ctl_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_mode_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<4> > mode_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              mode_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "mode_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_mode_ctl)[0*1+0] = mode_ctl_pc_buffer[0].range(3, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_capture_mode_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<2> > capture_mode_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              capture_mode_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "capture_mode_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_capture_mode_ctl)[0*1+0] = capture_mode_ctl_pc_buffer[0].range(1, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_sanity_mode_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<3> > sanity_mode_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              sanity_mode_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "sanity_mode_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_sanity_mode_ctl)[0*1+0] = sanity_mode_ctl_pc_buffer[0].range(2, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pps_sel_ctl);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<3> > pps_sel_ctl_pc_buffer(1);
          int i = 0;
          bool has_unknown_value = false;
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            has_unknown_value |= RTLOutputCheckAndReplacement(AESL_token);
  
            // push token into output port buffer
            if (AESL_token != "") {
              pps_sel_ctl_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (has_unknown_value) {
            cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' or 'X' on port " 
                 << "pps_sel_ctl" << ", possible cause: There are uninitialized variables in the C design."
                 << endl; 
          }
  
          if (i > 0) {((char*)__xlx_apatb_param_pps_sel_ctl)[0*1+0] = pps_sel_ctl_pc_buffer[0].range(2, 0).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_counter_status_reg = 0;
// print counter_status_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_counter_status_reg, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_counter_status_reg = 0*2;
if (__xlx_apatb_param_counter_status_reg) {
for (size_t i = 0; i < 1; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_counter_status_reg + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVIN_counter_status_reg, s);
}
}
}

  tcl_file.set_num(1, &tcl_file.counter_status_reg_depth);
aesl_fh.write(AUTOTB_TVIN_counter_status_reg, end_str());
}

// print mode_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_mode_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mode_reg;
aesl_fh.write(AUTOTB_TVIN_mode_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.mode_reg_depth);
aesl_fh.write(AUTOTB_TVIN_mode_reg, end_str());
}

// print counter_config_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_counter_config_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_counter_config_reg;
aesl_fh.write(AUTOTB_TVIN_counter_config_reg, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.counter_config_reg_depth);
aesl_fh.write(AUTOTB_TVIN_counter_config_reg, end_str());
}

// print delay_ns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_delay_ns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_delay_ns_reg;
aesl_fh.write(AUTOTB_TVIN_delay_ns_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.delay_ns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_delay_ns_reg, end_str());
}

// print load_secs_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_load_secs_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_secs_reg;
aesl_fh.write(AUTOTB_TVIN_load_secs_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.load_secs_reg_depth);
aesl_fh.write(AUTOTB_TVIN_load_secs_reg, end_str());
}

// print load_ns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_load_ns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_ns_reg;
aesl_fh.write(AUTOTB_TVIN_load_ns_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.load_ns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_load_ns_reg, end_str());
}

// print load_subns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_load_subns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_subns_reg;
aesl_fh.write(AUTOTB_TVIN_load_subns_reg, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.load_subns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_load_subns_reg, end_str());
}

// print capture_secs_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_capture_secs_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_secs_reg;
aesl_fh.write(AUTOTB_TVIN_capture_secs_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.capture_secs_reg_depth);
aesl_fh.write(AUTOTB_TVIN_capture_secs_reg, end_str());
}

// print capture_ns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_capture_ns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_ns_reg;
aesl_fh.write(AUTOTB_TVIN_capture_ns_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.capture_ns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_capture_ns_reg, end_str());
}

// print capture_subns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_capture_subns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_subns_reg;
aesl_fh.write(AUTOTB_TVIN_capture_subns_reg, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.capture_subns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_capture_subns_reg, end_str());
}

// print current_secs_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_current_secs_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_current_secs_reg;
aesl_fh.write(AUTOTB_TVIN_current_secs_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.current_secs_reg_depth);
aesl_fh.write(AUTOTB_TVIN_current_secs_reg, end_str());
}

// print current_ns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_current_ns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_current_ns_reg;
aesl_fh.write(AUTOTB_TVIN_current_ns_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.current_ns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_current_ns_reg, end_str());
}

// print current_subns_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_current_subns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_current_subns_reg;
aesl_fh.write(AUTOTB_TVIN_current_subns_reg, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.current_subns_reg_depth);
aesl_fh.write(AUTOTB_TVIN_current_subns_reg, end_str());
}

// print lockout_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_lockout_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_lockout_reg;
aesl_fh.write(AUTOTB_TVIN_lockout_reg, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.lockout_reg_depth);
aesl_fh.write(AUTOTB_TVIN_lockout_reg, end_str());
}

// print rollover_thresh_reg Transactions
{
aesl_fh.write(AUTOTB_TVIN_rollover_thresh_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_rollover_thresh_reg;
aesl_fh.write(AUTOTB_TVIN_rollover_thresh_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.rollover_thresh_reg_depth);
aesl_fh.write(AUTOTB_TVIN_rollover_thresh_reg, end_str());
}

// print load_secs_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_load_secs_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_secs_ctl;
aesl_fh.write(AUTOTB_TVIN_load_secs_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.load_secs_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_load_secs_ctl, end_str());
}

// print load_ns_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_load_ns_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_ns_ctl;
aesl_fh.write(AUTOTB_TVIN_load_ns_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.load_ns_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_load_ns_ctl, end_str());
}

// print load_subns_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_load_subns_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_subns_ctl;
aesl_fh.write(AUTOTB_TVIN_load_subns_ctl, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.load_subns_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_load_subns_ctl, end_str());
}

// print ns_per_clk_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_ns_per_clk_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ns_per_clk_ctl;
aesl_fh.write(AUTOTB_TVIN_ns_per_clk_ctl, formatData(pos, 6));
}
  tcl_file.set_num(1, &tcl_file.ns_per_clk_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_ns_per_clk_ctl, end_str());
}

// print subns_per_clk_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_subns_per_clk_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_subns_per_clk_ctl;
aesl_fh.write(AUTOTB_TVIN_subns_per_clk_ctl, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.subns_per_clk_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_subns_per_clk_ctl, end_str());
}

// print delay_ns_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_delay_ns_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_delay_ns_ctl;
aesl_fh.write(AUTOTB_TVIN_delay_ns_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.delay_ns_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_delay_ns_ctl, end_str());
}

// print lockout_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_lockout_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_lockout_ctl;
aesl_fh.write(AUTOTB_TVIN_lockout_ctl, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.lockout_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_lockout_ctl, end_str());
}

// print rollover_thresh_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_rollover_thresh_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_rollover_thresh_ctl;
aesl_fh.write(AUTOTB_TVIN_rollover_thresh_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.rollover_thresh_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_rollover_thresh_ctl, end_str());
}

// print mode_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_mode_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mode_ctl;
aesl_fh.write(AUTOTB_TVIN_mode_ctl, formatData(pos, 4));
}
  tcl_file.set_num(1, &tcl_file.mode_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_mode_ctl, end_str());
}

// print capture_mode_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_capture_mode_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_mode_ctl;
aesl_fh.write(AUTOTB_TVIN_capture_mode_ctl, formatData(pos, 2));
}
  tcl_file.set_num(1, &tcl_file.capture_mode_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_capture_mode_ctl, end_str());
}

// print sanity_mode_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_sanity_mode_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_sanity_mode_ctl;
aesl_fh.write(AUTOTB_TVIN_sanity_mode_ctl, formatData(pos, 3));
}
  tcl_file.set_num(1, &tcl_file.sanity_mode_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_sanity_mode_ctl, end_str());
}

// print pps_sel_ctl Transactions
{
aesl_fh.write(AUTOTB_TVIN_pps_sel_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_pps_sel_ctl;
aesl_fh.write(AUTOTB_TVIN_pps_sel_ctl, formatData(pos, 3));
}
  tcl_file.set_num(1, &tcl_file.pps_sel_ctl_depth);
aesl_fh.write(AUTOTB_TVIN_pps_sel_ctl, end_str());
}

// print captured_secs_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_captured_secs_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_captured_secs_in;
aesl_fh.write(AUTOTB_TVIN_captured_secs_in, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.captured_secs_in_depth);
aesl_fh.write(AUTOTB_TVIN_captured_secs_in, end_str());
}

// print captured_ns_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_captured_ns_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_captured_ns_in;
aesl_fh.write(AUTOTB_TVIN_captured_ns_in, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.captured_ns_in_depth);
aesl_fh.write(AUTOTB_TVIN_captured_ns_in, end_str());
}

// print captured_subns_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_captured_subns_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_captured_subns_in;
aesl_fh.write(AUTOTB_TVIN_captured_subns_in, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.captured_subns_in_depth);
aesl_fh.write(AUTOTB_TVIN_captured_subns_in, end_str());
}

// print running_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_running_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_running_in;
aesl_fh.write(AUTOTB_TVIN_running_in, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.running_in_depth);
aesl_fh.write(AUTOTB_TVIN_running_in, end_str());
}

// print secs_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_secs_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_secs_in;
aesl_fh.write(AUTOTB_TVIN_secs_in, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.secs_in_depth);
aesl_fh.write(AUTOTB_TVIN_secs_in, end_str());
}

// print ns_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_ns_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ns_in;
aesl_fh.write(AUTOTB_TVIN_ns_in, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.ns_in_depth);
aesl_fh.write(AUTOTB_TVIN_ns_in, end_str());
}

// print subns_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_subns_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_subns_in;
aesl_fh.write(AUTOTB_TVIN_subns_in, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.subns_in_depth);
aesl_fh.write(AUTOTB_TVIN_subns_in, end_str());
}

// print captured_in Transactions
{
aesl_fh.write(AUTOTB_TVIN_captured_in, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_captured_in;
aesl_fh.write(AUTOTB_TVIN_captured_in, formatData(pos, 1));
}
  tcl_file.set_num(1, &tcl_file.captured_in_depth);
aesl_fh.write(AUTOTB_TVIN_captured_in, end_str());
}

CodeState = CALL_C_DUT;
pps_synchronizer_control_hw_stub_wrapper(__xlx_apatb_param_mode_reg, __xlx_apatb_param_counter_config_reg, __xlx_apatb_param_counter_status_reg, __xlx_apatb_param_delay_ns_reg, __xlx_apatb_param_load_secs_reg, __xlx_apatb_param_load_ns_reg, __xlx_apatb_param_load_subns_reg, __xlx_apatb_param_capture_secs_reg, __xlx_apatb_param_capture_ns_reg, __xlx_apatb_param_capture_subns_reg, __xlx_apatb_param_current_secs_reg, __xlx_apatb_param_current_ns_reg, __xlx_apatb_param_current_subns_reg, __xlx_apatb_param_lockout_reg, __xlx_apatb_param_rollover_thresh_reg, __xlx_apatb_param_load_secs_ctl, __xlx_apatb_param_load_ns_ctl, __xlx_apatb_param_load_subns_ctl, __xlx_apatb_param_ns_per_clk_ctl, __xlx_apatb_param_subns_per_clk_ctl, __xlx_apatb_param_delay_ns_ctl, __xlx_apatb_param_lockout_ctl, __xlx_apatb_param_rollover_thresh_ctl, __xlx_apatb_param_mode_ctl, __xlx_apatb_param_capture_mode_ctl, __xlx_apatb_param_sanity_mode_ctl, __xlx_apatb_param_pps_sel_ctl, __xlx_apatb_param_captured_secs_in, __xlx_apatb_param_captured_ns_in, __xlx_apatb_param_captured_subns_in, __xlx_apatb_param_running_in, __xlx_apatb_param_secs_in, __xlx_apatb_param_ns_in, __xlx_apatb_param_subns_in, __xlx_apatb_param_captured_in);
CodeState = DUMP_OUTPUTS;
// print counter_status_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_counter_status_reg, begin_str(AESL_transaction));
{
  __xlx_offset_byte_param_counter_status_reg = 0*2;
if (__xlx_apatb_param_counter_status_reg) {
for (size_t i = 0; i < 1; ++i) {
unsigned char *pos = (unsigned char*)__xlx_apatb_param_counter_status_reg + i * 2;
std::string s = formatData(pos, 16);
aesl_fh.write(AUTOTB_TVOUT_counter_status_reg, s);
}
}
}

  tcl_file.set_num(1, &tcl_file.counter_status_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_counter_status_reg, end_str());
}

// print capture_secs_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_capture_secs_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_secs_reg;
aesl_fh.write(AUTOTB_TVOUT_capture_secs_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.capture_secs_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_capture_secs_reg, end_str());
}

// print capture_ns_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_capture_ns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_ns_reg;
aesl_fh.write(AUTOTB_TVOUT_capture_ns_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.capture_ns_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_capture_ns_reg, end_str());
}

// print capture_subns_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_capture_subns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_subns_reg;
aesl_fh.write(AUTOTB_TVOUT_capture_subns_reg, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.capture_subns_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_capture_subns_reg, end_str());
}

// print current_secs_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_current_secs_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_current_secs_reg;
aesl_fh.write(AUTOTB_TVOUT_current_secs_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.current_secs_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_current_secs_reg, end_str());
}

// print current_ns_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_current_ns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_current_ns_reg;
aesl_fh.write(AUTOTB_TVOUT_current_ns_reg, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.current_ns_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_current_ns_reg, end_str());
}

// print current_subns_reg Transactions
{
aesl_fh.write(AUTOTB_TVOUT_current_subns_reg, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_current_subns_reg;
aesl_fh.write(AUTOTB_TVOUT_current_subns_reg, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.current_subns_reg_depth);
aesl_fh.write(AUTOTB_TVOUT_current_subns_reg, end_str());
}

// print load_secs_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_load_secs_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_secs_ctl;
aesl_fh.write(AUTOTB_TVOUT_load_secs_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.load_secs_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_load_secs_ctl, end_str());
}

// print load_ns_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_load_ns_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_ns_ctl;
aesl_fh.write(AUTOTB_TVOUT_load_ns_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.load_ns_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_load_ns_ctl, end_str());
}

// print load_subns_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_load_subns_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_load_subns_ctl;
aesl_fh.write(AUTOTB_TVOUT_load_subns_ctl, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.load_subns_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_load_subns_ctl, end_str());
}

// print ns_per_clk_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_ns_per_clk_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_ns_per_clk_ctl;
aesl_fh.write(AUTOTB_TVOUT_ns_per_clk_ctl, formatData(pos, 6));
}
  tcl_file.set_num(1, &tcl_file.ns_per_clk_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_ns_per_clk_ctl, end_str());
}

// print subns_per_clk_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_subns_per_clk_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_subns_per_clk_ctl;
aesl_fh.write(AUTOTB_TVOUT_subns_per_clk_ctl, formatData(pos, 8));
}
  tcl_file.set_num(1, &tcl_file.subns_per_clk_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_subns_per_clk_ctl, end_str());
}

// print delay_ns_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_delay_ns_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_delay_ns_ctl;
aesl_fh.write(AUTOTB_TVOUT_delay_ns_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.delay_ns_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_delay_ns_ctl, end_str());
}

// print lockout_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_lockout_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_lockout_ctl;
aesl_fh.write(AUTOTB_TVOUT_lockout_ctl, formatData(pos, 16));
}
  tcl_file.set_num(1, &tcl_file.lockout_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_lockout_ctl, end_str());
}

// print rollover_thresh_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_rollover_thresh_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_rollover_thresh_ctl;
aesl_fh.write(AUTOTB_TVOUT_rollover_thresh_ctl, formatData(pos, 32));
}
  tcl_file.set_num(1, &tcl_file.rollover_thresh_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_rollover_thresh_ctl, end_str());
}

// print mode_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_mode_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_mode_ctl;
aesl_fh.write(AUTOTB_TVOUT_mode_ctl, formatData(pos, 4));
}
  tcl_file.set_num(1, &tcl_file.mode_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_mode_ctl, end_str());
}

// print capture_mode_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_capture_mode_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_capture_mode_ctl;
aesl_fh.write(AUTOTB_TVOUT_capture_mode_ctl, formatData(pos, 2));
}
  tcl_file.set_num(1, &tcl_file.capture_mode_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_capture_mode_ctl, end_str());
}

// print sanity_mode_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_sanity_mode_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_sanity_mode_ctl;
aesl_fh.write(AUTOTB_TVOUT_sanity_mode_ctl, formatData(pos, 3));
}
  tcl_file.set_num(1, &tcl_file.sanity_mode_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_sanity_mode_ctl, end_str());
}

// print pps_sel_ctl Transactions
{
aesl_fh.write(AUTOTB_TVOUT_pps_sel_ctl, begin_str(AESL_transaction));
{
auto *pos = (unsigned char*)__xlx_apatb_param_pps_sel_ctl;
aesl_fh.write(AUTOTB_TVOUT_pps_sel_ctl, formatData(pos, 3));
}
  tcl_file.set_num(1, &tcl_file.pps_sel_ctl_depth);
aesl_fh.write(AUTOTB_TVOUT_pps_sel_ctl, end_str());
}

CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
