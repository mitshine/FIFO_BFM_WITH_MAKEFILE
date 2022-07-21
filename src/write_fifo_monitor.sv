class write_fifo_monitor extends uvm_monitor;
  
  `uvm_component_utils(write_fifo_monitor);
  
  write_fifo_seq_item pkt;
  
  virtual fifo_if intf;

  uvm_analysis_port #(write_fifo_seq_item)item_collected_port;

  function new(string name="write_fifo_monitor",uvm_component parent);
     super.new(name,parent);
   
     item_collected_port=new("item_collected_port",this);
    
    endfunction
    

  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(virtual fifo_if)::get(this,"","vif",intf);
       
  endfunction
  
   task run_phase(uvm_phase phase);
     pkt=write_fifo_seq_item::type_id::create("pkt");
    @(posedge intf.clk);
     forever begin
       @(posedge intf.clk);
       pkt.wr<=intf.wr;
       pkt.rd<=intf.rd;
       pkt.data_in<=intf.data_in;
       item_collected_port.write(pkt);
       pkt.display("MONITOR_1");

     end
     endtask
  endclass
    
    