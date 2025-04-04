module CacheController (
    input clock,
    input reset,
    input [31:0] address,
    input [31:0] write_data,
    input mem_read,
    input mem_write,
    output reg [31:0] read_data,
    output reg cache_hit
);
    reg [31:0] cache_data [0:63];
    reg [31:0] cache_tags [0:63];
    reg valid [0:63];

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            valid <= 0;
        end else if (mem_read) begin
            if (valid[address[5:0]] && cache_tags[address[5:0]] == address[31:6]) begin
                cache_hit = 1;
                read_data = cache_data[address[5:0]];
            end else begin
                cache_hit = 0;
            end
        end else if (mem_write) begin
            cache_data[address[5:0]] <= write_data;
            cache_tags[address[5:0]] <= address[31:6];
            valid[address[5:0]] <= 1;
        end
    end
endmodule
