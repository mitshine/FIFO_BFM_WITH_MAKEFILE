class write_fifo_env extends uvm_env;
  
  `uvm_component_utils(write_fifo_env);
  
 write_fifo_agent ag1;
 
  
  
   function new(string name, uvm_component parent);
         super.new(name, parent);
     endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ag1=write_fifo_agent::type_id::create("ag1",this);
  endfunction
  
   function void connect_phase(uvm_phase phase);
     super.connect_phase(phase);
   endfunction  
 
  
endclass