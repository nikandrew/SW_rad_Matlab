function [ output_error ] = ChanalError( input, error_bit, error_flag )
    for i = 1:5
        output_error(i) = input(i);
    end
    if error_flag == 1
        bit_value = ~ bitget(input(error_bit(1)),error_bit(2));
        output_error(error_bit(1)) = bitset(input(error_bit(1)),error_bit(2), bit_value);
    end;
end

