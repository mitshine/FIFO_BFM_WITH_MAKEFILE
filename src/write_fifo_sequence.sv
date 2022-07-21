class write_fifo_sequence extends uvm_sequence#(write_fifo_seq_item);
  
  `uvm_object_utils(write_fifo_sequence)
  
    write_fifo_seq_item pkt;
  
  
  function new (string name="write_fifo_sequence");
    super.new (name);
  endfunction
  

  
  task body();
     
    repeat(6) begin
    
             pkt= write_fifo_seq_item::type_id::create("pkt");
      
       
    wait_for_grant();
      // start_item(pkt);
       assert( pkt.randomize() with {wr==1 ; rd==0;});
       //pkt.randomize() with{wr==1;rd==0;};
       send_request(pkt);
 
    wait_for_item_done();
      pkt.display("SEQN");
       //finish_item(pkt);
     end
  
  // *****************************************************    //
       
    repeat(6) begin
     //for(int i;i<9;i=i+1)begin
             pkt= write_fifo_seq_item::type_id::create("pkt");

       
   // wait_for_grant();
       start_item(pkt);
       //assert( pkt.randomize() with {wr==0 ; rd==1;data_in==0;});
      pkt.randomize() with{wr==0;rd==1;data_in==0;};
      // send_request(pkt);
      // wait_for_item_done();
       finish_item(pkt);
      pkt.display("SEQN_READ");
     end
   
  endtask
  
  endclass