
//`define DRIV_IF intf.DRIVER.driver_cb

class write_fifo_driver extends uvm_driver#(write_fifo_seq_item);
  `uvm_component_utils(write_fifo_driver)
  
   virtual fifo_if intf;
  
  write_fifo_seq_item pkt;
  
  
  
  function new(string name="write_fifo_driver", uvm_component parent);
         super.new(name, parent);
     endfunction
  
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(virtual fifo_if)::get(this,"","vif",intf);
         
  endfunction
  //*******************************************//
  task reset();
    wait(!intf.rst);
    
    intf.data_in<=0;
    intf.wr<=0;
    intf.rd<=0;
      
    wait(intf.rst);
  endtask
//**********************************************//  
   task run_phase(uvm_phase phase);
   
     reset();

    forever begin
     pkt=write_fifo_seq_item::type_id::create("pkt");
      seq_item_port.get_next_item(pkt);
       drive(pkt);
      seq_item_port.item_done();
      pkt.display("DRIVER");

    end
  endtask 
  
  task drive(write_fifo_seq_item pkt);
    @(posedge intf.clk);
    intf.wr<=pkt.wr;
    intf.rd<=pkt.rd;
    intf.data_in<=pkt.data_in;
   
  endtask
 endclass

  
  