module ram_tb;

reg clk;
reg [7:0] addr;
reg [7:0] data_in;
wire [7:0] data_out;
reg we;
reg oe;

ram uut(
    .clk(clk),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out),
    .we(we),
    .oe(oe)
);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    addr = 0;
    data_in = 0;
    we = 0;
    oe = 0;

    #20;
    we = 1;
    addr = 8'h10;
    data_in = 8'h55;
    #20;
    we = 0;

    #20;
    oe = 1;
    addr = 8'h10;
    #20;
    $display("Data out: %h", data_out);

    #100;
    $finish;
end

endmodule
