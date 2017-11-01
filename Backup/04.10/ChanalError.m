function [ output_error ] = ChanalError( input, error_bit, error_flag )
    for i = 1:7
        output_error(i) = input(i);
    end
    if error_flag == 1
        if error_bit(2) == 1
            bit_value = ~ bitget(input(error_bit(1)),1);
            output_error(error_bit(1)) = bitset(input(error_bit(1)),1, bit_value);
        elseif error_bit(2) == 2
            bit_value = ~ bitget(input(error_bit(1)),2);
            output_error(error_bit(1)) = bitset(input(error_bit(1)),2, bit_value);
        elseif error_bit(2) == 3
            bit_value = ~ bitget(input(error_bit(1)),3);
            output_error(error_bit(1)) = bitset(input(error_bit(1)),3, bit_value);
        elseif error_bit(2) == 4
            bit_value = ~ bitget(input(error_bit(1)),1);
            output_error(error_bit(1)) = bitset(input(error_bit(1)),1, bit_value);
            bit_value = ~ bitget(input(error_bit(1)),2);
            output_error(error_bit(1)) = bitset(input(error_bit(1)),2, bit_value);
            bit_value = ~ bitget(input(error_bit(1)),3);
            output_error(error_bit(1)) = bitset(input(error_bit(1)),3, bit_value);
        end;
    end;
end

