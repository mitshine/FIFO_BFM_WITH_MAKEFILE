class write_fifo_agent extends uvm_agent;
  
  `uvm_component_utils(write_fifo_agent);
  
  write_fifo_sequencer seqr;
  write_fifo_driver drv;
  write_fifo_monitor mon_1;
  
  
  function new(string name ="write_fifo_agent", uvm_component parent);
         super.new(name, parent);
     endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase (phase);
    seqr =write_fifo_sequencer::type_id::create("seqr",this);
    drv  =write_fifo_driver::type_id::create("drv",this);
    mon_1=write_fifo_monitor::type_id::create("mon_1",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
     super.connect_phase (phase);   
     drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
endclass