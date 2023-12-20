module phase_gen (
  input wire clk,
  input wire rst_n,
  input wire signed[15:0] freq_in,
  output reg signed[15:0] phase
);

  // Constants
  parameter real pi = 3.141592653589793;

  // Convert pi to fixed-point format
  localparam signed[15:0] MAX_PHASE = (2**13) * $signed(pi);

  // Registers
  logic signed[15:0] phase_reg;

  // Combinational logic for phase calculation
  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      phase_reg <= 0;
    end else begin
      // Convert frequency input to phase increment
      logic signed[15:0] phase_incr = (freq_in * 2**13) / 22.591e6;

      // Update phase
      phase_reg <= phase_reg + phase_incr;
    end
  end

  // Output logic for phase
  always_ff @(posedge clk) begin
    if (!rst_n) begin
      phase <= 0;
    end else begin
      // Limit phase to the range -pi to pi
      if (phase_reg > MAX_PHASE) begin
        phase <= phase_reg - (2**14);
      end else if (phase_reg < -MAX_PHASE) begin
        phase <= phase_reg + (2**14);
      end else begin
        phase <= phase_reg;
      end
    end
  end

endmodule