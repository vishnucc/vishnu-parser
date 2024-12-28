###############################################################################

set sdc_version 2.1

set_units -time ns -capacitance pF -current mA -voltage V -resistance kOhm
###############################################################################
# 
# Units
# capacitive_load_unit           : 1 pF
# current_unit                   : 0.001 A
# resistance_unit                : 1 kOhm
# time_unit                      : 1 ns
# voltage_unit                   : 1 V
###############################################################################
set_operating_conditions -analysis_type on_chip_variation  -library [get_libs \
{tcbn22ullbwp30p140sgssg0p72vm40c_hm_lvf_p_ccs.db:tcbn22ullbwp30p140sgssg0p72vm40c_ccs}]
###############################################################################
# Clock Related Information
###############################################################################
create_clock -name sys_clk -period 0.5 -waveform { 0 0.25 } [get_ports {Clock}]
set_clock_uncertainty  0.1 [get_clocks {sys_clk}]
set_clock_transition -rise -max  0.1 [get_clocks {sys_clk}]
set_clock_transition -fall -max  0.1 [get_clocks {sys_clk}]
set_clock_transition -rise -min  0.1 [get_clocks {sys_clk}]
set_clock_transition -fall -min  0.1 [get_clocks {sys_clk}]
create_clock -name test_clk -period 2 -waveform { 0 1 } [get_ports {Scan_clk}]
set_clock_uncertainty -setup  0.54 [get_clocks {test_clk}]
set_clock_transition -rise -max  0.1 [get_clocks {test_clk}]
set_clock_transition -fall -max  0.1 [get_clocks {test_clk}]
set_clock_transition -rise -min  0.1 [get_clocks {test_clk}]
set_clock_transition -fall -min  0.1 [get_clocks {test_clk}]
set_clock_groups -asynchronous -name G1 -group [get_clocks {sys_clk}] -group \
[get_clocks {test_clk}]
###############################################################################
# Point to Point exceptions
###############################################################################
###############################################################################
# External Delay Information
###############################################################################
set_input_delay  0.25 [get_ports {A}]
set_input_delay  0.25 [get_ports {B}]
set_input_delay  0.25 [get_ports {C}]
set_input_delay  0.25 [get_ports {Scan_en}]
set_input_delay  0.25 [get_ports {cg_en}]
set_input_delay  0.25 [get_ports {gen_clk_mux}]
set_output_delay  0.25 [get_ports {Sum}]
set_output_delay  0.25 [get_ports {Carry}]
set_load	 -pin_load  0.5 [get_ports {Sum}]
set_load -pin_load  0.5 [get_ports {Carry}]
set_input_transition -rise -min  0.1 [get_ports {A}]
set_input_transition -fall -min  0.1 [get_ports {A}]
set_input_transition -rise -max  0.1 [get_ports {A}]
set_input_transition -fall -max  0.1 [get_ports {A}]
set_input_transition -rise -min  0.1 [get_ports {B}]
set_input_transition -fall -min  0.1 [get_ports {B}]
set_input_transition -rise -max  0.1 [get_ports {B}]
set_input_transition -fall -max  0.1 [get_ports {B}]
set_input_transition -rise -min  0.1 [get_ports {C}]
set_input_transition -fall -min  0.1 [get_ports {C}]
set_input_transition -rise -max  0.1 [get_ports {C}]
set_input_transition -fall -max  0.1 [get_ports {C}]
set_input_transition -rise -min  0.1 [get_ports {Clock}]
set_input_transition -fall -min  0.1 [get_ports {Clock}]
set_input_transition -rise -max  0.1 [get_ports {Clock}]
set_input_transition -fall -max  0.1 [get_ports {Clock}]
set_input_transition -rise -min  0.1 [get_ports {Scan_clk}]
set_input_transition -fall -min  0.1 [get_ports {Scan_clk}]
set_input_transition -rise -max  0.1 [get_ports {Scan_clk}]
set_input_transition -fall -max  0.1 [get_ports {Scan_clk}]
set_input_transition -rise -min  0.1 [get_ports {Scan_en}]
set_input_transition -fall -min  0.1 [get_ports {Scan_en}]
set_input_transition -rise -max  0.1 [get_ports {Scan_en}]
set_input_transition -fall -max  0.1 [get_ports {Scan_en}]
set_input_transition -rise -min  0.1 [get_ports {cg_en}]
set_input_transition -fall -min  0.1 [get_ports {cg_en}]
set_input_transition -rise -max  0.1 [get_ports {cg_en}]
set_input_transition -fall -max  0.1 [get_ports {cg_en}]
set_input_transition -rise -min  0.1 [get_ports {gen_clk_mux}]
set_input_transition -fall -min  0.1 [get_ports {gen_clk_mux}]
set_input_transition -rise -max  0.1 [get_ports {gen_clk_mux}]
set_input_transition -fall -max  0.1 [get_ports {gen_clk_mux}]
###############################################################################
# POCV Information
###############################################################################
