# Decimal-to-Binary-7-Segments

This VHDL code implements a decoder circuit that receives a 4-bit binary input and generates the corresponding output signals to display the input value on a 7-segment display. The output signals are labeled A, B, C, D, E, F, and G, and correspond to the segments of the display, as shown in the following diagram:

![image](https://user-images.githubusercontent.com/54071118/224525124-c5a9dac7-8563-473a-b609-71e43d1e85f9.png)

The input signals are labeled B3, B2, B1, and B0, and correspond to the most significant bit, the second most significant bit, and so on, up to the least significant bit. The decoder circuit uses logic gates to generate the output signals based on the input values. Specifically, it uses a combination of AND, OR, and NOT gates to generate the output signals.

Note that the code includes an additional output signal labeled Dot, which is not used in the decoder circuit. This signal is typically used to control the decimal point of the 7-segment display, but in this case it is not used, so its value is set to '1' (indicating that the decimal point is off).
