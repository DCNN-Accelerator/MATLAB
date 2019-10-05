%Hussain Khajanchi and Kiera Cullen
%MATLAB Function for High-Level Convolution Functionality
%DCNN Accelerator Senior Project

function [conv_data_out, pixel_to_line_buf,pixel_window,kernel_window] = conv_2D(line_buf_vals, uart_line_in,disp_windows,pixel_window,kernel_window)

%Pixel and Kernel Window Parameters
KERNEL_WIN_H = 7;
KERNEL_WIN_L = 7; 

%Add the new Values
for i = 1:KERNEL_WIN_H-1
    pixel_window(i,1) = line_buf_vals(i);
end

%Add in the new UART val 
pixel_window(KERNEL_WIN_H,1) = uart_line_in;

%Save the window before shifting -- strictly for debugging
pre_shift_pw = pixel_window;

%Compute the dot product between image patch and kernel window
buf = kernel_window .* pixel_window; 
conv_data_out = sum(sum(buf)); 

%Implement Shifting 

for i = (KERNEL_WIN_L-1):-1:1
    pixel_window(:,i+1) = pixel_window(:,i);
end

%Send out last element to UART line
pixel_to_line_buf = pixel_window(7,7); 


if (disp_windows == true)
    
    disp("Pre-shifted Pixel Window \n")
    disp(pre_shift_pw)
    
    disp("Shifted Pixel Window \n")
    disp(pixel_window)
    
    disp("Kernel Window")
    disp(kernel_window)
    
end





 
 
 
 
 

