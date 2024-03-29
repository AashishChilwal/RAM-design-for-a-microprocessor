module test_mem_read;
  reg  enable,ReadWrite;
  reg [7:0] DataIn;
  reg [9:0] Address;
  wire [7:0] DataOut;

memory ram(enable,ReadWrite,Address,DataIn,DataOut); 

initial
begin

  $readmemh("data_read.txt", ram.Mem);

   enable =0;   ReadWrite=0;    Address=10'd0;
#5 enable =1;   ReadWrite=1;    Address=10'd0;
#5 enable =1;   ReadWrite=1;    Address=10'd1;
#5 enable =1;   ReadWrite=1;    Address=10'd2;
#5 enable =1;   ReadWrite=1;    Address=10'd3;
#5 enable =1;   ReadWrite=1;    Address=10'd4;
#5 enable =1;   ReadWrite=1;    Address=10'd5;
#5 enable =1;   ReadWrite=1;    Address=10'd6;
#5 enable =1;   ReadWrite=1;    Address=10'd7;
#5 enable =1;   ReadWrite=1;    Address=10'd8;
#5 enable =1;   ReadWrite=1;    Address=10'd9;
#5 enable =1;   ReadWrite=1;    Address=10'd10;
#5 enable =1;   ReadWrite=1;    Address=10'd11;

end


initial
begin
  $monitor("At",$time, ", data at address %d is %h", Address, DataOut);
end
endmodule


module test_mem_write;
    reg  enable,R_W;
  reg [7:0] D_In;
  reg [9:0] Address;
  wire [7:0] D_Out;

memory ram(enable,R_W,Address,D_In,D_Out); 

initial
begin
   enable =0;   R_W=0;    Address=10'd0;    D_In =8'hAA;
#5 enable =1;   R_W=0;    Address=10'd0;    D_In =8'hAA;
#5 enable =1;   R_W=0;    Address=10'd1;    D_In =8'h0A;
#5 enable =1;   R_W=0;    Address=10'd2;    D_In =8'h0B;
#5 enable =1;   R_W=0;    Address=10'd3;    D_In =8'h0C;
#5 enable =1;   R_W=0;    Address=10'd4;    D_In =8'h0D;
#5 enable =1;   R_W=0;    Address=10'd5;    D_In =8'h0E;
#5 enable =1;   R_W=0;    Address=10'd6;    D_In =8'h0F;
#5 enable =1;   R_W=0;    Address=10'd7;    D_In =8'hFF;
#5 enable = 1;  R_W = 0;  Address = 10'd8;  D_In = 8'h11;
#5 enable = 1;  R_W = 0;  Address = 10'd9;  D_In = 8'h22;
#5 enable = 1;  R_W = 0;  Address = 10'd10; D_In = 8'h33;
#5 enable = 1;  R_W = 0;  Address = 10'd11; D_In = 8'h44;
#10

  $writememh("data_write.txt", ram.Mem);
end
endmodule


 module memory (Enable,ReadWrite,Address,DataIn,DataOut);
    input  Enable,ReadWrite;
   input [7:0] DataIn;
   input [9:0] Address;
   output reg[7:0] DataOut;

   reg [7:0] Mem [0:1023];                  //8 x 1024 memory

always @*
       if (Enable)
             if (ReadWrite) 
               DataOut = Mem[Address];          //Reading
             else
               Mem[Address] = DataIn;           //Writing
       else DataOut = 8'bz;            //High impedance state
endmodule