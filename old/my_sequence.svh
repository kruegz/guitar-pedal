class my_transaction extends uvm_sequence_item;

    `uvm_object_utils(my_transaction)

    rand logic [INSTR_WIDTH-1:0] instruction;
    rand logic [DATA_WIDTH-1:0] opcode;
    rand int limit;
    rand int coefficient;
    rand int polarity;
    rand bit [DATA_WIDTH-1:0] in [$];

    constraint c_instruction {
        (opcode == LIMITER) -> instruction == {'0, polarity, limit, opcode};
        (opcode == SCALER)  -> instruction == {'0, polarity, coefficient, opcode};
    }

    constraint c_opcode {
        opcode inside {LIMITER, SCALER}; 
    }

    constraint c_in {
        in.size() inside {[10:20]};
        foreach (in[i]) in[i] < MAX_DATA;
    }
    
    constraint c_limit { limit >= 0; limit < MAX_DATA; }
    constraint c_coefficient { coefficient >= 0; coefficient < 3; }
    constraint c_polarity { polarity >= 0; polarity < 2; }

    function new (string name = "");
        super.new(name);
    endfunction

endclass: my_transaction

class my_sequence extends uvm_sequence#(my_transaction);

    `uvm_object_utils(my_sequence)

    function new (string name = "");
        super.new(name);
    endfunction

    task body;
        repeat(8) begin
            req = my_transaction::type_id::create("req");
            start_item(req);

            if (!req.randomize()) begin
                `uvm_error("MY_SEQUENCE", "Randomize failed.");
            end

            // If using ModelSim, which does not support randomize(),
            // we must randomize item using traditional methods, like
            // req.cmd = $urandom;
            // req.addr = $urandom_range(0, 255);
            // req.data = $urandom_range(0, 255);

            finish_item(req);
        end
    endtask: body

endclass: my_sequence
