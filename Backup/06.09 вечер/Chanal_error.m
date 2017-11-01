function [ output ] = Chanal_error( input, error_bit, error_flag )
    if error_flag == 1
        bit_value = ~ bitget(input(error_bit(1)),error_bit(2));
        output(error_bit(1)) = bitset(input(error_bit(1)),error_bit(2), bit_value);
    end;
end

