`include "config.inc"

module gammaconv(
    input clock,
    
    input [4:0] gamma_config,

    input in_wren,
    input [`RAM_WIDTH-1:0] in_wraddr,
    input [7:0] in_red,
    input [7:0] in_green,
    input [7:0] in_blue,
    input in_starttrigger,

    input [23:0] mapperconf,

    output reg wren,
    output reg [`RAM_WIDTH-1:0] wraddr,
    output reg [23:0] wrdata,
    output reg starttrigger
);

    (* ramstyle = "logic" *) reg [7:0] r_mapper [0:255];
    (* ramstyle = "logic" *) reg [7:0] g_mapper [0:255];
    (* ramstyle = "logic" *) reg [7:0] b_mapper [0:255];
    initial begin
        for (int i = 0 ; i < 256 ; i++) begin
            r_mapper[i] = i[7:0];
            g_mapper[i] = i[7:0];
            b_mapper[i] = i[7:0];
        end
    end

    wire [7:0] red;
    wire [7:0] green;
    wire [7:0] blue;

    gamma r(
        .clock(clock),
        .gamma_config(gamma_config),
        .in(in_red),
        .mapper(r_mapper),
        .out(red)
    );

    gamma g(
        .clock(clock),
        .gamma_config(gamma_config),
        .in(in_green),
        .mapper(g_mapper),
        .out(green)
    );

    gamma b(
        .clock(clock),
        .gamma_config(gamma_config),
        .in(in_blue),
        .mapper(b_mapper),
        .out(blue)
    );

    reg wren_q;
    reg [`RAM_WIDTH-1:0] wraddr_q;
    reg starttrigger_q;

    always @(posedge clock) begin
        { wren, wren_q } <= { wren_q, in_wren };
        { wraddr, wraddr_q } <= { wraddr_q, in_wraddr };
        { starttrigger, starttrigger_q } <= { starttrigger_q, in_starttrigger };
        wrdata <= { red, green, blue };
    end

    always @(posedge clock) begin
        case(mapperconf[23:16])
            `MAPPER_CONF_RED: r_mapper[mapperconf[15:8]] <= mapperconf[7:0];
            `MAPPER_CONF_GREEN: g_mapper[mapperconf[15:8]] <= mapperconf[7:0];
            `MAPPER_CONF_BLUE: b_mapper[mapperconf[15:8]] <= mapperconf[7:0];
        endcase
    end

endmodule