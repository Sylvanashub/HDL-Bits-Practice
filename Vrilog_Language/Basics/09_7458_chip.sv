module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
//You may choose to use an assign statement to drive each of the output wires, or you may choose to declare (four) wires for use as intermediate signals

    assign p2y = (p2a & p2b) | (p2c & p2d);
    assign p1y = (p1c & p1a & p1b) | (p1f & p1e & p1d);
    
endmodule
