# Verilog RAM Module and Test Benches

This repository contains a Verilog module for a simple RAM (Random Access Memory) and accompanying test benches to demonstrate its functionality. The RAM module is designed to interface with a system clock and provides both read and write capabilities controlled by an enable signal. It features a 1024-word memory with 8-bit width for each word, allowing for a substantial amount of data storage and retrieval.

The test benches included are test_mem_read and test_mem_write, which simulate the reading and writing processes of the RAM module. The test_mem_read bench checks the integrity of data retrieval from the RAM, while the test_mem_write bench verifies the data writing process. Both benches are essential for ensuring the RAM module operates correctly under various conditions and use cases.
