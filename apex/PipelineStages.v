module PipelineStages (
    input clock,
    input reset,
    input [31:0] instruction,
    output reg [31:0] fetch_out,
    output reg [31:0] decode_out,
    output reg [31:0] execute_out,
    output reg [31:0] memory_out,
    output reg [31:0] writeback_out
);
    reg [31:0] fetch_reg, decode_reg, execute_reg, memory_reg;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            fetch_reg <= 0;
            decode_reg <= 0;
            execute_reg <= 0;
            memory_reg <= 0;
        end else begin
            fetch_reg <= instruction;
            decode_reg <= fetch_reg;
            execute_reg <= decode_reg;
            memory_reg <= execute_reg;
            writeback_out <= memory_reg;
        end
    end

    assign fetch_out = fetch_reg;
    assign decode_out = decode_reg;
    assign execute_out = execute_reg;
    assign memory_out = memory_reg;
endmodule
