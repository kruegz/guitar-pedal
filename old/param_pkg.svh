package param_pkg;

    parameter DATA_WIDTH = 24;  // Data width
    parameter MAX_DATA = (1 << DATA_WIDTH) - 1;  // Maximum data value
    parameter INSTR_WIDTH = 4*DATA_WIDTH;  // Instruction width

    typedef enum logic[DATA_WIDTH-1:0] {LIMITER, SCALER} opcode_t;

endpackage