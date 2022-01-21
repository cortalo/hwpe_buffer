module hwpe_buffer
    #(
    parameter BUFFER_WIDTH=1024
    )(
    input  logic                            clk_i,
    input  logic                            rst_ni,
    input  logic [BUFFER_WIDTH-1:0]         data_in,
    output logic [BUFFER_WIDTH-1:0]         data_out
    );

    logic [BUFFER_WIDTH-1:0]                buffer_d, buffer_q;

    assign buffer_d = data_in;
    assign data_out = buffer_q;

    always_ff @(posedge clk_i, negedge rst_ni) begin
        if (!rst_ni) begin
            buffer_q <= '0;
        end else begin
            buffer_q <= buffer_d;
        end
    end

endmodule : hwpe_buffer
