function [  reg ] = CoderTimerOutBuffer( input, reg_temp_in)
    old_buffer = reg_temp_in;
    old_number = 0;
    for i = 1:7
        a = bitget(input(i),2);
        b = bitget(input(i),3);
        old_number = bitset(old_number, 1, a);
        old_number = bitset(old_number, 2, b);
        old_number = 3 - old_number;
        old_value = bitget(input(i),1);
        old_buffer = bitset(old_buffer,old_number,old_value);
        reg(1,i) = 3 - old_number; 
        reg(2,i) = old_value;
        reg(3,i) = old_buffer;
    end

    
end

