% Hussain Khajanchi
% Conv_2D Function Tester
% DCNN Accelerator Senior Project

%This scripts test the functionality of a MATLAB-based emulation of the
%SoPU to be implemented on an Xilinx Artix-7 FPGA. 

%ToDo
% - Implement fixed point quantization
% - Perform analysis of quantization error


%Initialize Pixel Window and Kernel Window
kernel_l = 7; 
kernel_h = 7; 

kernel_window = rand(kernel_l,kernel_h);
pixel_window = zeros(kernel_l,kernel_h); %same size as the Kernel

%Temporary buffer array for the line buffer values, emulates how they would
%come in from the Block RAMs to the actual SoPU
line_buf_vals = zeros(1,6); 

for i = 1:kernel_l

    line_buf_vals = rand(1,6); 
    [conv_data_out,pixel_to_line_buf,pixel_window,kernel_window] = conv_2D(line_buf_vals,uart_line_in,false,pixel_window,kernel_window);
    
    disp("Current Iteration " + i)
    
    disp("")
    disp("")
    
    disp("Pixel Window")
    disp(pixel_window)
    
    disp("")
    
    disp("SoPU Output")
    disp(conv_data_out)
    
    disp("")
    
    disp("Pixel Value sent to line buffer")
    disp(pixel_to_line_buf)
    
    disp("")
    disp("")
    
    pause(5)
end
