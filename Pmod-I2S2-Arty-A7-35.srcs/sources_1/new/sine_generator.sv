

module sine_generator #(
		parameter WIDTH = 7,
		parameter FREQ_STEP = 11
	)(
		input wire clk,
		input wire rst_n,

		output reg [WIDTH-1:0] out
	);

//	logic [WIDTH-1:0] out;
	logic [WIDTH-1:0] cnt;

	logic [WIDTH-1:0] sine_table[0:255];

	initial begin
		$readmemh("sine_data.hex", sine_table);
	end

	reg [31:0]	phase;

	always @(posedge clk, negedge rst_n) begin

		if (!rst_n) begin
			out <= 0;
			cnt <= 0;
			phase <= 0;
		end else begin
			cnt <= cnt + 1;
			// out <= sine_table[phase[31:24]];
			out <= sine_table[phase[11:4]];
			phase <= phase + FREQ_STEP;
		end

	end

endmodule : sine_generator