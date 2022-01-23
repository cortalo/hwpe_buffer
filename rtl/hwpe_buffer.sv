module hwpe_buffer #(
    parameter int unsigned  NumWords            = 32'd128,
    parameter int unsigned  DataWidth           = 32'd32,
    localparam int unsigned AddrWidth           = $clog2(NumWords),
    localparam type         addr_t              = logic [AddrWidth-1:0],
    localparam type         data_t              = logic [DataWidth-1:0]
) (
    input   logic       clk_i,
    input   logic       rst_ni,
    input   logic       req_i,
    input   logic       we_i,
    input   addr_t      addr_i,
    input   data_t      wdata_i,
    output  data_t      rdata_o
);

    // buffer array TODO changed to packed array
    data_t  buffer_d [0:NumWords-1];
    data_t  buffer_q [0:NumWords-1];
    // hold the read address when no read access is made
    addr_t  r_addr_d, r_addr_q;
    assign r_addr_d = (req_i && !we_i) ? addr_i : r_addr_q;

    // read data output assignment
    assign rdata_o = (req_i && !we_i) ? buffer_q[addr_i] : buffer_q[r_addr_q];

endmodule : hwpe_buffer
