import uvm_pkg::*;
`include "uvm_macros.svh"
`include "write_fifo_interface.sv"
`include "write_fifo_seq_item.sv"
`include "write_fifo_sequence.sv"
`include "write_fifo_sequencer.sv"
`include "write_fifo_driver.sv"
`include "write_fifo_monitor.sv"
`include "write_fifo_agent.sv"
`include "write_fifo_environment.sv"
`include "write_fifo_test.sv"

module top;
  
  bit clk,rst;
  
  
  initial begin
    clk=1;
   forever #5 clk=~clk;
  end
  
  initial
    begin
      rst =0;
      repeat(2) @(posedge clk)
      rst =1;
    end
 
  
fifo_if intf(clk,rst);
  
  fifo dut (.data_in(intf.data_in),.wr(intf.wr),.rd(intf.rd),.empty(intf.empty),.full(intf.full),.fifo_cnt(intf.fifo_cnt),.data_out(intf.data_out),.clk(intf.clk),.rst(intf.rst));
  
  
 initial begin 
   uvm_config_db#(virtual fifo_if)::set(null,"*","vif",intf);
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
  
  initial begin
    
    run_test("write_fifo_test");
    
  end
  
endmodule


