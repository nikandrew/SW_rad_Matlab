function [  reg ] = CoderTimerOutBuffer( input, reg_temp_in)
   input_dec = [0 0; 0 0; 0 0 ;0 0; 0 0];
    for i = 1:5 
            a = bitget(input(i),1);
            input_dec(i,2) = bitset(input_dec(i,2), 1, a);
            a = bitget(input(i),2);
            input_dec(i,1) = bitset(input_dec(i,1), 1, a);
            a = bitget(input(i),3);
            input_dec(i,1) = bitset(input_dec(i,1), 2, a);
            input_dec_plus(i,1) = input_dec(i,1)+ 1;
            input_dec_plus(i,2) =  input_dec(i,2);
    end

    reg_temp = reg_temp_in;

    for i = 1:5
        reg_temp = bitset(reg_temp,4-input_dec_plus(i,1),bitget(input_dec_plus(i,2),1));
        reg(i) = reg_temp;   
    end

    
end

