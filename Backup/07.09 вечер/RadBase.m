% input = ['00'; '01'; '10'; '00'; '01'];
% input_level = ['0'; '0'; '0'; '1'; '1'];
input = [0 2 4 1 3];
input_data(1,:) = [0 2 4 1 3];
input_data(2,:) = [2 4 1 3 5];
input_data(3,:) = [4 1 3 5 0];
input_data(4,:) = [1 3 5 0 2];
input_data(5,:) = [3 5 0 2 4];
input_data(6,:) = [5 0 2 4 1];
error_bit = [1 1];
error_flag = 1;
number_code = 0;
code_temp = 0;

t = 1;
for r= 1:6
    input = input_data(r,:);
    a = bitget(input(1),2);
    number_code = bitset(number_code, 1, a);
    a = bitget(input(1),3);
    code_value =  bitget(input(1),1);
    number_code = bitset(number_code, 2, a);
    number_code = 3 - number_code;
    for y = 1:3
        if y < number_code
            code_temp = bitset(code_temp,y,code_value);
        else
            code_temp = bitset(code_temp, y, ~code_value);
        end
    end
    for i=1:5
       for j=1:3
            error_bit(1) = i;
            error_bit(2) = j;

            input_coder = CoderTimerRad_code(input, code_temp);
            output = CoderTimerRad(input, code_temp);
            output_error = ChanalError(output, error_bit, error_flag);

            output_dec = DecoderTimerRad(output_error, number_code, code_temp);

            result(1,:,t) = input_coder;
            result(2,:,t) = output_dec;

            result(3,i,t) = j;
            summ = 0;
            for k=1:5
               if result(1,k,t) == result(2,k,t)
                    result(4,k,t) = 0;
               else
                    result(4,k,t) = 55;
                    summ = summ + 1;
               end
            end
            if summ ~= 0
               error_check = 1;
            else
               error_check = 0;
            end
            result_low(1,t) = input(1);
            result_low(2,t) = input(2);
            result_low(3,t) = input(3);
            result_low(4,t) = input(4);
            result_low(5,t) = input(5);
            result_low(6,t) = 55;
            result_low(7,t) = i;
            result_low(8,t) = j;
            result_low(9,t) = 55;
            result_low(10,t) = error_check;
            
            t = t + 1;
       end
    end
end