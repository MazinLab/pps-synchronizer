#include <fstream>
#include <iostream>

#include <backends/cxxrtl/cxxrtl_vcd.h>

#include "pps_synch.cpp"

using namespace std;

int main() {
        cxxrtl_design::p_pps__synch top;

        cxxrtl::debug_items all_debug_items;
        top.debug_info(all_debug_items);

        cxxrtl::vcd_writer vcd;
        vcd.timescale(10, "ns");
        vcd.add_without_memories(all_debug_items);
        std::ofstream waves("/tmp/pps_synch_tb.vcd");

        top.step();

        top.p_ns__per__clk.set<uint32_t>(20);
        top.p_subns__per__clk.set<uint8_t>(0);
        top.p_delay__ns.set<uint32_t>(60);
        top.p_mode.set<uint32_t>(0);
        top.p_capture__mode.set<uint32_t>(0);
        top.p_load__ns.set<uint32_t>(0x5A);
        top.p_load__secs.set<uint32_t>(0xAA);
        top.p_load__subns.set<uint32_t>(0);
        top.p_delay.set<uint64_t>(0);
        top.p_started.set<bool>(false);
        top.p_pps__internal.set<bool>(false);
        top.p_last__pps.set<bool>(false);
        top.p_last__sysref.set<bool>(false);
        top.p_last__pps__ext.set<bool>(false);
        top.p_captured.set<bool>(false);
        top.p_pps.set<uint32_t>(0);
        top.p_sysref.set<bool>(false);
	top.p_sanity__mode.set<uint32_t>(0);
	top.p_lockout__ns.set<uint32_t>(0);
	top.p_rollover__thresh__ns.set<uint32_t>(0);
	top.p_pps__sel.set<uint32_t>(7);

        vcd.sample(0);

        int time_ns;
        for (int steps = 0; steps < 1000 * 1000 * 1000; ++steps) {
                // Clock is 50 MHz
                time_ns = steps * 20;

                top.p_clk.set<bool>(false);
                top.step();
                vcd.sample(steps * 2 + 0);

                // Test Mode 1
                if (time_ns == 500) {
                        top.p_mode.set<uint32_t>(1);
                }

                if (time_ns == 800) {
                        top.p_capture__mode.set<uint32_t>(1);
                }

                // Test PPS mediated capture mode
                if (time_ns == 1000) {
                        top.p_pps.set<uint32_t>(1);
                }

                if (time_ns == 1100) {
                        assert(("Captured time should now be load_ns + "
                                "delay_ns + 500 - cycle",
                                top.p_captured__ns.get<uint32_t>() ==
                                    60 + 0x5a + 500 - 20));
                }

                // Test Mode 2
                if (time_ns == 1200) {
                        top.p_mode.set<uint32_t>(0);
                        top.p_pps.set<uint32_t>(0);
                        top.p_load__ns.set<uint32_t>(0x00);
                        top.p_capture__mode.set<uint32_t>(0);
                        top.p_delay__ns.set<uint32_t>(0);
                }

                if (time_ns == 1300) {
                        top.p_mode.set<uint32_t>(2);
                        top.p_capture__mode.set<uint32_t>(2);
                }

                if (time_ns == 1600) {
                        top.p_pps.set<uint32_t>(1);
                }

                // Test SYSREF mediated capture mode
                if (time_ns == 500 * 1000 + 40) {
                        assert(("Captured time shound now be 500us - 1620 ns",
                                top.p_captured__ns.get<uint32_t>() ==
                                    500 * 1000 - 1620));
                }

                // Test freeruning rollover
                if (time_ns == 500 * 1000 + 160 + 820) {
                        assert(("Seconds should have just rolled over",
                                top.p_ns.get<uint32_t>() == 0 &&
                                    top.p_secs.get<uint32_t>() == 0xAB));
                }

                // Test Modes 3 and 4
                if (time_ns == 504 * 1000 || time_ns == 999 * 1000) {
                        top.p_mode.set<uint32_t>(0);
                        top.p_pps.set<uint32_t>(0);
                        top.p_load__ns.set<uint32_t>(0x00);
                        top.p_load__secs.set<uint32_t>(0x00);
                        top.p_capture__mode.set<uint32_t>(0);
                        top.p_delay__ns.set<uint32_t>(0);
                }

                if (time_ns == 504 * 1000 + 80) {
                        top.p_mode.set<uint32_t>(3);
                }

                if (time_ns == 999 * 1000 + 80) {
                        top.p_mode.set<uint32_t>(4);
                }

                // We generate two PPS pulses and verify the counters rollover
                // properly:
                //
                // Mode 3 should start on the first and roll over on the second
                // Mode 4 should ignore the first because its before the next
                // SYSREF edge and it should rollover on the second
                if (time_ns == 504 * 1000 + 160 ||
                    time_ns == 504 * 1000 + 360 ||
                    time_ns == 999 * 1000 + 160 ||
                    time_ns == 1500 * 1000 + 160) {
                        top.p_pps.set<uint32_t>(1);
                }

                if (time_ns == 504 * 1000 + 220 ||
                    time_ns == 506 * 1000 + 400 ||
                    time_ns == 999 * 1000 + 200 ||
                    time_ns == 1500 * 1000 + 200) {
                        top.p_pps.set<uint32_t>(0);
                }

                if (time_ns == 504 * 1000 + 160 + 100 ||
                    time_ns == 1500 * 1000 + 100) {
                        assert(("Verify actual counters start",
                                top.p_ns.get<uint32_t>() == 100 - 40 &&
                                    top.p_secs.get<uint32_t>() == 0));
                }

                if (time_ns == 504 * 1000 + 360 + 100 ||
                    time_ns == 1500 * 1000 + 160 + 100) {
                        assert(("PPS should have just triggered a tick",
                                top.p_ns.get<uint32_t>() == 100 - 40 &&
                                    top.p_secs.get<uint32_t>() == 1));
                }

                if (time_ns == 999 * 1000 + 400) {
                        assert(("Verify counters do not tick up in mode 4"
                                " before SYSREF edge",
                                top.p_ns.get<uint32_t>() == 0 &&
                                    top.p_secs.get<uint32_t>() == 0));
                }

                // Test Subns Mode
                if (time_ns == 1600 * 1000 - 80) {
                        top.p_mode.set<uint32_t>(0);
                        top.p_pps.set<uint32_t>(0);
                        top.p_load__ns.set<uint32_t>(0x00);
                        top.p_load__secs.set<uint32_t>(0x00);
                        top.p_load__subns.set<uint8_t>(128);
                        // Simulate 256MHz Clk
                        top.p_ns__per__clk.set<uint32_t>(3);
                        top.p_subns__per__clk.set<uint8_t>(0b11101000);
                        top.p_capture__mode.set<uint32_t>(0);
                        // This should be a delay of 256 cycles
                        top.p_delay__ns.set<uint32_t>(1000);
                }
                if (time_ns == 1600 * 1000 - 40) {
                        top.p_mode.set<uint32_t>(2);
                }

                if (time_ns == 1600 * 1000) {
                        top.p_pps.set<uint32_t>(1);
                }

                if (time_ns == 1600 * 1000 + 40) {
                        top.p_pps.set<uint32_t>(0);
                }

                if (time_ns == 1600 * 1000 + 256 * 20 + 20) {
                        assert(("Verify the internal pps goes high 256"
                                " cycles later (resp posedge)",
                                top.p_pps__internal.get<uint32_t>()));
                }

                if (time_ns == 1600 * 1000 + 256 * 40 + 40) {
                        assert(("We should be at 1000 ns + load_ns +"
                                " load_subns",
                                top.p_ns.get<uint32_t>() == 1000 &&
                                    top.p_subns.get<uint8_t>() == 128));
                }

                if (time_ns == 1700 * 1000 + 256 * 20) {
                        assert(("We should be just about to roll over",
                                top.p_ns.get<uint32_t>() ==
                                        1000 * 1000 * 1000 - 4 &&
                                    top.p_subns.get<uint32_t>() == 24));
                }

                if (time_ns == 1700 * 1000 + 256 * 20 + 20) {
                        assert(("We should have just rolled over",
                                top.p_ns.get<uint32_t>() == 0 &&
                                    top.p_subns.get<uint32_t>() == 0));
                }

                // Test Mode 5
                if (time_ns == 2000 * 1000) {
                        top.p_mode.set<uint32_t>(0);
                        top.p_pps.set<uint32_t>(0);
                        top.p_load__ns.set<uint32_t>(0x00);
                        top.p_load__secs.set<uint32_t>(0x00);
                        top.p_load__subns.set<uint32_t>(0);
                        top.p_capture__mode.set<uint32_t>(0);
                        top.p_delay__ns.set<uint32_t>(0);
                        top.p_ns__per__clk.set<uint32_t>(20);
                        top.p_subns__per__clk.set<uint8_t>(0);
                }

                if (time_ns == 2000 * 1000 + 80) {
                        top.p_mode.set<uint32_t>(5);
                }

                // Make sure it ignores PPS
                if (time_ns == 2000 * 1000 + 120) {
                        top.p_pps.set<uint32_t>(1);
                }

                if (time_ns == 2000 * 1000 + 160) {
                        top.p_pps.set<uint32_t>(0);
                }

                if (time_ns == 2000 * 1000 + 200) {
                        assert(("Verify counters do not tick up in mode 5"
                                "before SYSREF edge",
                                top.p_ns.get<uint32_t>() == 0 &&
                                    top.p_secs.get<uint32_t>() == 0));
                }

                if (time_ns == 2500 * 1000 + 100) {
                        assert(("Verify actual counters start",
                                top.p_ns.get<uint32_t>() == 100 - 40 &&
                                    top.p_secs.get<uint32_t>() == 0));
                }

                // Drives 1MHz Sysref signal
                if (time_ns % (1000 * 1000) < 500 * 1000) {
                        top.p_sysref.set<bool>(false);
                } else {
                        top.p_sysref.set<bool>(true);
                }

                top.p_clk.set<bool>(true);
                top.step();

                // Skip time for freerunning rollover
                if (time_ns == 500 * 1000 + 160 ||
                    time_ns == 2500 * 1000 + 160) {
                        top.p_ns__r.set<uint64_t>(
                            (uint64_t)(1000 * 1000 * 1000) * 256 - 800 * 256);
                }
                if (time_ns == 1700 * 1000) {
                        top.p_ns__r.set((uint64_t)(1000 * 1000 * 1000) * 256 -
                                        256 * 1000);
                }

                vcd.sample(steps * 2 + 1);

                waves << vcd.buffer;
                vcd.buffer.clear();
                if (time_ns == 2800 * 1000)
                        break;
        }
	printf("All Tests Passed!!!\n");
}
