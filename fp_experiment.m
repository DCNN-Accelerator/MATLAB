%Hussain Khajanchi
%MATLAB Fixed Point Tester - Data Collector

clc
clear

%This module tests the effect of fixed point quantization over multiple
%iterations of SoPU functionality

errors_16b = zeros(1,1000);
errors_8b = zeros(1,1000); 

for i = 1:1000
    
    [curr_error_16b, curr_error_8b] = fixed_point_math(false);
    errors_16b(i) = curr_error_16b; 
    errors_8b(i) = curr_error_8b; 
end

%------ Plot Values ----------
subplot(211)
stem(errors_16b * 1000)
title(" Q0.15 Fixed Point SoPU Error Scaled by 10^3"); 
xlabel("SoPU Iteration"); 
ylabel("Error Magnitude"); 

subplot(212)
stem(errors_8b * 1000)
title(" Q0.7 Fixed Point SoPU Error Scaled by 10^3"); 
xlabel("SoPU Iteration"); 
ylabel("Error Magnitude"); 

avg_error_16b = sum(errors_16b)/1000; 
avg_error_8b = sum(errors_8b)/1000;

%----- Display Average Values --------- 
disp ("Average Q0.15 Error for 1000 Iterations") 
disp (avg_error_16b)

disp ("Average Q0.7 Error for 1000 Iterations") 
disp (avg_error_8b)



