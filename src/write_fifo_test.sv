class write_fifo_test extends uvm_test;
  
  `uvm_component_utils(write_fifo_test);
  
  write_fifo_env env;
  write_fifo_sequence seqn;
 
  
  function new (string name="write_fifo_test", uvm_component parent);
    super.new (name, parent);
  endfunction
  
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=write_fifo_env::type_id::create("env",this);       
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  task run_phase(uvm_phase phase);
    seqn = write_fifo_sequence::type_id::create("seqn",this);
    phase.raise_objection(this);
    seqn.start(env.ag1.seqr);
    #20;
    phase.drop_objection(this); 
  endtask
  
  
endclass