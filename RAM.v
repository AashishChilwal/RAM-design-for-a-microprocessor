module RAM (clk,rst,enable,ldr,str,address,dataIn,dataOut);

input clk;                        //System clock
input rst;                       //Reset signal
input enable;                   //Write enable signal
input ldr;                   //Load data from RAM to register
input str;                  // Store data from register to RAM
input [9:0] address;        // Address lines for accessing RAM
input [7:0] dataIn;         // Data lines to write to RAM
output reg [7:0] dataOut;    // Data lines to read from RAM

// Declare the RAM array with 1024 words of 8 bits each

reg [7:0] ram [0:1023];

// Initializing the RAM array with values
initial begin
  $readmemh("data_read.txt", ram); // Reading from a txt file
end

// Writing data to RAM when enable and str are high
always @(posedge clk) begin
    if (rst) begin
        dataOut <= 0; // Clearing the output on reset
    end else if (enable && str) begin
      ram[address] <= dataIn; // Writing data to the specified address
    end
end

// Reading data from RAM when ldr is high
always @(*) begin
    if (ldr) begin
      dataOut <= ram[address]; // Reading data from the specified address
    end
end

endmodule 