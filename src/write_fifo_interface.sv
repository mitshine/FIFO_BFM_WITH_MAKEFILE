interface fifo_if(input clk,rst);
  
  logic [7:0]data_in;
  logic wr;
  logic rd;
  logic empty;
  logic full;
  logic [3:0]fifo_cnt;
  logic [7:0]data_out;

  
 /* clocking driver_cb @(posedge clk);
    default input#1 output #1;
    output data_in;
    output wr;
    output rd;
   	input  empty;
    input  full;
    input  fifo_cnt;
    input  data_out;
  endclocking
  
  clocking monitor_cb @(posedge clk);
    default input#1 output #1;
    input  data_in;
    input  wr;
    input  rd;
   	input  empty;
    input  full;
    input  fifo_cnt;
    input  data_out;
  endclocking
  
  modport DRIVER(clocking driver_cb,input clk,rst);
   modport MONITOR(clocking monitor_cb,input clk,rst);
  */
  
    
  
endinterface