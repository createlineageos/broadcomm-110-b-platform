module BranchPredictor (
    input [31:0] program_counter,
    input branch_taken,
    input [31:0] branch_target,
    output reg prediction,
    output reg [31:0] predicted_address
);
    reg [31:0] branch_history_table [0:15];
    reg [15:0] branch_prediction_bits;

    always @(posedge branch_taken) begin
        branch_history_table[program_counter[3:0]] <= branch_target;
        branch_prediction_bits[program_counter[3:0]] <= 1;
    end

    always @(*) begin
        if (branch_prediction_bits[program_counter[3:0]] == 1) begin
            prediction = 1;
            predicted_address = branch_history_table[program_counter[3:0]];
        end else begin
            prediction = 0;
            predicted_address = program_counter + 4;
        end
    end
