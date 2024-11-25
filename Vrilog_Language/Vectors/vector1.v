`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    //Build a combinational circuit that splits an input half-word (16 bits, [15:0] ) into lower [7:0] and upper [15:8] bytes.

    assign out_hi = in[15:8];
    assign out_lo = in[7:0];



endmodule

/*Implicit nets产生原因：
使用assign语句但未声明的变量
连接到模块端口的未声明信号
这些都会自动创建1位宽的线网(wire)

default_nettype none指令：
默认情况下，Verilog允许创建隐式网络
使用此指令后，所有信号必须显式声明
这样可以捕获潜在错误，如把向量误写为单比特信号

错误的例子：
wire [2:0] a, c;    // 声明3位向量
assign a = 3'b101;  // a = 101
assign b = a;       // b未声明，自动变为1位
assign c = b;       // c获得错误值001
使用default_nettype none可以在编译时就发现这类错误，而不是在运行时才发现数据丢失。

也就是说使用了default_nettype none命令，则assign语句不会自动创建1位宽的线网(wire)
*/