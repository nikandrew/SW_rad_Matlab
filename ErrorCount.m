function [ output_error ] = ErrorCount( input, error_bit, error_flag  )
    old_number = 0;
    for i = 1:7
        output_error(i) = input(i);
    end
    
    for i = error_bit(1):7
        if error_flag == 1
            if(i == error_bit(1))
                a = bitget(input(error_bit(1)),2);
                b = bitget(input(error_bit(1)),3);
                old_number = bitset(old_number, 1, a);
                old_number = bitset(old_number, 2, b);
                old_value = bitget(input(error_bit(1)),1);
                if(error_bit(2) == 1) 
                    switch old_number
                        case 1
                            old_number = 2;
                        case 2
                            old_number = 1;
                        case 0
                            old_number = 0;
                    end 
                    a = bitget(old_number,1);
                    b = bitget(old_number,2);
                    output_error(i) = bitset(output_error(i), 2, a);
                    output_error(i) = bitset(output_error(i), 3, b);
                elseif(error_bit(2) == 2) 
                    switch old_number
                        case 1
                            old_number = 0;
                        case 2
                            old_number = 0;
                        case 0
                            old_number = 1;
                    end 
                    a = bitget(old_number,1);
                    b = bitget(old_number,2);
                    output_error(i) = bitset(output_error(i), 2, a);
                    output_error(i) = bitset(output_error(i), 3, b);
                    old_value = ~old_value;
                    output_error(i) = bitset(output_error(i), 1, old_value);
                end
            else
               switch old_number
                    case 1
                        old_number = 2;
                    case 2
                        old_number = 0;
                        if(old_value == 0) 
                            old_value = 1;
                        else
                            old_value = 0;
                        end
                    case 0
                        old_number = 1;
               end  
                a = bitget(old_number,1);
                b = bitget(old_number,2);
                output_error(i) = bitset(output_error(i), 2, a);
                output_error(i) = bitset(output_error(i), 3, b);
                output_error(i) = bitset(output_error(i), 1, old_value);
            end
        end
    end
end

