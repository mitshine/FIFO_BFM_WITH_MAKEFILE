class write_fifo_seq_item extends uvm_sequence_item;
  
  rand bit [7:0]data_in;
  rand bit wr;
  rand bit rd;
  
   bit empty;
   bit  full;
   bit [3:0]fifo_cnt;
   bit [7:0]data_out;
  
  
  `uvm_object_utils_begin(write_fifo_seq_item);
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(wr,UVM_ALL_ON)
  `uvm_field_int(rd,UVM_ALL_ON)
  `uvm_field_int(empty,UVM_ALL_ON)
  `uvm_field_int(full,UVM_ALL_ON)
  `uvm_field_int(fifo_cnt,UVM_ALL_ON)
  `uvm_field_int(data_out,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new (string name="write_fifo_seq_item");
    super.new (name);
    
  endfunction
  
 // constraint datain{data_in<10;}
 // constraint wr_rd{wr!=rd;}
  
  function void display(string name);
    
    $display("---------------------------------------------");
    $display("%s",name);
    $display("---------------------------------------------");
    $display("wr=%0d,rd=%0d,data_in=%0d",wr,rd,data_in);
    $display("---------------------------------------------");
    $display("wr=%0d,rd=%0d,data_out=%0d",wr,rd,data_out);
    $display("---------------------------------------------");
   /* $display("fifo_cnt=%0d",fifo_cnt);
    $display("---------------------------------------------");
    $display("empty=%0d,full=%0d",empty,full);
    $display("---------------------------------------------");*/


        
  endfunction
  
  
endclass