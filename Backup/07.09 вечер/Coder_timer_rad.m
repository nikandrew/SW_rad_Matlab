input_timer = ['00'; '01'; '10'; '00'; '01'];
input_level = ['0'; '0'; '0'; '1'; '1'];
error_bit = [1 3];
error_flag = 1;
    for i = 1:5 
            input_dec(i,1) = bin2dec(input_timer(i,:));
            input_dec(i,2) = bin2dec(input_level(i,:));
            input_dec_plus(i,1) = bin2dec(input_timer(i,:))+ 1;
            input_dec_plus(i,2) = bin2dec(input_level(i,:));
    end

    reg_temp = 7;

    for i = 1:5
        reg_temp = bitset(reg_temp,4-input_dec_plus(i,1),bitget(input_dec_plus(i,2),1));
        reg(i) = reg_temp;   
    end

    for i = 1:5
        output_temp = 0;
        if(bitget(reg(i),1) == bitget(reg(i),2))
            output_temp = bitset(output_temp,1,0);
        else
           output_temp = bitset(output_temp,1,1);
        end
        if(bitget(reg(i),2) == bitget(reg(i),3))
            output_temp = bitset(output_temp,3,0);
        else
           output_temp = bitset(output_temp,3,1);
        end
        output_temp = bitset(output_temp,2,bitget(reg(i),2));
        output(i) = output_temp;    
    end
    if error_flag == 1
        bit_value = ~ bitget(output(error_bit(1)),error_bit(2));
        output(error_bit(1)) = bitset(output(error_bit(1)),error_bit(2), bit_value);
    end;