module MultiCoreProcessor (
    input clock,
    input reset,
    input [31:0] instructions_core0,
    input [31:0] instructions_core1,
    input [31:0] instructions_core2,
    input [31:0] instructions_core3,
    output [31:0] results_core0,
    output [31:0] results_core1,
    output [31:0] results_core2,
    output [31:0] results_core3
);
    wire [31:0] result0, result1, result2, result3;

    SuperscalarProcessor core0 (.clock(clock), .reset(reset), .instruction(instructions_core0), .result(result0));
    SuperscalarProcessor core1 (.clock(clock), .reset(reset), .instruction(instructions_core1), .result(result1));
    SuperscalarProcessor core2 (.clock(clock), .reset(reset), .instruction(instructions_core2), .result(result2));
    SuperscalarProcessor core3 (.clock(clock), .reset(reset), .instruction(instructions_core3), .result(result3));

    assign results_core0 = result0;
    assign results_core1 = result1;
    assign results_core2 = result2;
    assign results_core3 = result3;
endmodule
