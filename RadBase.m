% input = ['00'; '01'; '10'; '00'; '01'];
% input_level = ['0'; '0'; '0'; '1'; '1'];
null_word = [55 55 55 55 55 55 55];
input_data(1,:) = [0 2 4 1 3 5 0];
input_data(2,:) = [2 4 1 3 5 0 2];
input_data(3,:) = [4 1 3 5 0 2 4];
input_data(4,:) = [1 3 5 0 2 4 1];
input_data(5,:) = [3 5 0 2 4 1 3];
input_data(6,:) = [5 0 2 4 1 3 5];
old_data = [5 0 2 4 1 3 5 0];

error_bit = [1 1];
error_flag = 1;
number_code = 0;
code_temp = 0;
t = 1;
% Ошибки в словах
for r= 1:5
    input = input_data(r,:);
    old_number = 0 ;
    old_step = 0;
    old_buffer = 0;
    old_value = 0;
    old_input = 0;
    %Рачсет начальных значений
    old = old_data(r);
    a = bitget(old,2);
    b = bitget(old,3);
    old_number = bitset(old_number, 1, a);
    old_number = bitset(old_number, 2, b);
    old_number = 3 - old_number;
    old_value = bitget(old,1);
    switch old
        case 0
            old_buffer = 3;
            old_step = 3;
        case 2
            old_buffer = 1;
            old_step = 1;
        case 4
            old_buffer = 0;
            old_step = 1;
        case 1
            old_buffer = 4;
            old_step = 2;
        case 3
            old_buffer = 6;
            old_step = 4;
        case 5
            old_buffer = 7;
            old_step = 4;
    end;
    a = bitget(old_buffer,1);
    b = bitget(old_buffer,2);
    old_input = bitset(old_input,1,xor(a,b));
    a = bitget(old_buffer,1);
    b = bitget(old_buffer,3);
    old_input = bitset(old_input,2,xor(a,b));    
    a = bitget(old_buffer,2);
    b = bitget(old_buffer,3);
    old_input = bitset(old_input,3,xor(a,b));    
      
    
    for i=1:5
       for j=1:3
            error_bit(1) = i;
            error_bit(2) = j;

            input_coder = CoderTimerOutBuffer(input, old_buffer); % формирует выходной буфер
            output = CoderTimerOutWord(input_coder(3,:)); % Делает выходные слова из выходного буфера
            output_error = ChanalError(output, error_bit, error_flag); % Ошибки в выходных словах

            output_result = RadDecoderFull(output_error, old_buffer, old_step, old_number, old_value, old_input);
          
            result_error_word(1,:,t) = output_result(1,:);
            result_error_word(2,:,t) = output_result(2,:);
            result_error_word(3,:,t) = output_result(3,:);
            result_error_word(4,:,t) = output_result(4,:);
            result_error_word(5,:,t) = output_result(5,:);
            result_error_word(6,:,t) = null_word;
            result_error_word(7,:,t) = input_coder(1,:);
            result_error_word(8,:,t) = input_coder(2,:);
            result_error_word(9,:,t) = input_coder(3,:);
            result_error_word(10,i,t) = j;

            t = t + 1;
       end
    end    
end
% Ошибки в буфере
t = 1;
g = 1;
for r= 1:6
    input = input_data(r,:);
    old_number = 0 ;
    old_step = 0;
    old_buffer = 0;
    old_value = 0;
    old_input = 0;
    %Рачсет начальных значений
    old = old_data(r);
    a = bitget(old,2);
    b = bitget(old,3);
    old_number = bitset(old_number, 1, a);
    old_number = bitset(old_number, 2, b);
    old_number = 3 - old_number;
    old_value = bitget(old,1);
    switch old
        case 0
            old_buffer = 3;
            old_step = 3;
        case 2
            old_buffer = 1;
            old_step = 1;
        case 4
            old_buffer = 0;
            old_step = 1;
        case 1
            old_buffer = 4;
            old_step = 2;
        case 3
            old_buffer = 6;
            old_step = 4;
        case 5
            old_buffer = 7;
            old_step = 4;
    end;
    a = bitget(old_buffer,1);
    b = bitget(old_buffer,2);
    old_input = bitset(old_input,1,xor(a,b));
    a = bitget(old_buffer,1);
    b = bitget(old_buffer,3);
    old_input = bitset(old_input,2,xor(a,b));    
    a = bitget(old_buffer,2);
    b = bitget(old_buffer,3);
    old_input = bitset(old_input,3,xor(a,b));    
      
    
    for i=1:4
       for j=1:3
            error_bit(1) = i;
            error_bit(2) = j;

            input_coder = CoderTimerOutBuffer(input, old_buffer); % формирует выходной буфер
            output = ChanalError(input_coder(3,:), error_bit, error_flag); % Ошибки в буфере
            output_error = CoderTimerOutWord(output); % Делает выходные слова из выходного буфера
             
            output_result = RadDecoderFull(output_error, old_buffer, old_step, old_number, old_value, old_input);
     
            result_error_buffer(1,:,t) = output_result(1,:);
            result_error_buffer(2,:,t) = output_result(2,:);
            result_error_buffer(3,:,t) = output_result(3,:);
            result_error_buffer(4,:,t) = output_result(4,:);
            result_error_buffer(5,:,t) = output_result(5,:);
            result_error_buffer(6,:,t) = null_word;
            result_error_buffer(7,:,t) = input_coder(1,:);
            result_error_buffer(8,:,t) = input_coder(2,:);
            result_error_buffer(9,:,t) = output;
            result_error_buffer(10,:,t) = null_word;
            result_error_buffer(10,i,t) = 3-j;
            for f=1:6
               if( result_error_buffer(1,f,t) == result_error_buffer(7,f,t))
                  if (result_error_buffer(2,f,t) == result_error_buffer(8,f,t))
                        result_error_buffer(11,f,t) = 0;
                  else
                      result_error_buffer(11,f,t) = 55;
                      data_out_error(g) = t;
                      g = g + 1;
                  end
               else
                  result_error_buffer(11,f,t) = 55;
                  data_out_error(g) = t;
                  g = g + 1;
               end
            end
           
            t = t + 1;
       end
    end
end

% Ошибки в счетчике
t = 1;
g = 1;
for r= 1:6
    
    input = input_data(r,:);
    old_number = 0 ;
    old_step = 0;
    old_buffer = 0;
    old_value = 0;
    old_input = 0;
    %Рачсет начальных значений
    old = old_data(r);
    a = bitget(old,2);
    b = bitget(old,3);
    old_number = bitset(old_number, 1, a);
    old_number = bitset(old_number, 2, b);
    old_number = 3 - old_number;
    old_value = bitget(old,1);
    switch old
        case 0
            old_buffer = 3;
            old_step = 3;
        case 2
            old_buffer = 1;
            old_step = 1;
        case 4
            old_buffer = 0;
            old_step = 1;
        case 1
            old_buffer = 4;
            old_step = 2;
        case 3
            old_buffer = 6;
            old_step = 4;
        case 5
            old_buffer = 7;
            old_step = 4;
    end;
    a = bitget(old_buffer,1);
    b = bitget(old_buffer,2);
    old_input = bitset(old_input,1,xor(a,b));
    a = bitget(old_buffer,1);
    b = bitget(old_buffer,3);
    old_input = bitset(old_input,2,xor(a,b));    
    a = bitget(old_buffer,2);
    b = bitget(old_buffer,3);
    old_input = bitset(old_input,3,xor(a,b));    
      
    
    for i=1:4
       for j=1:2
            error_bit(1) = i;
            error_bit(2) = j;
            error_count = ErrorCount(input, error_bit, error_flag); % Сбой в счетчике

            input_coder = CoderTimerOutBuffer(error_count, old_buffer); % формирует выходной буфер
            
            output_error = CoderTimerOutWord(input_coder(3,:)); % Делает выходные слова из выходного буфера
             
            output_result_2 = RadDecoderFull(output_error, old_buffer, old_step, old_number, old_value, old_input);
     
            result_error_count(1,:,t) = output_result_2(1,:);
            result_error_count(2,:,t) = output_result_2(2,:);
            result_error_count(3,:,t) = output_result_2(3,:);
            result_error_count(4,:,t) = output_result_2(4,:);
            result_error_count(5,:,t) = output_result_2(5,:);
            result_error_count(6,:,t) = null_word;
            result_error_count(7,:,t) = input_coder(1,:);
            result_error_count(8,:,t) = input_coder(2,:);
            result_error_count(9,:,t) = output;
            result_error_count(10,:,t) = null_word;
            result_error_count(10,i,t) = j;
            result_error_count(12,:,t) = input_data(r,:);
            for f=1:6
               if( result_error_count(1,f,t) == result_error_count(7,f,t))
                  if (result_error_count(2,f,t) == result_error_count(8,f,t))
                        result_error_count(11,f,t) = 0;
                  else
                      result_error_count(11,f,t) = 55;
                      data_out_error(g) = t;
                      g = g + 1;
                  end
               else
                  result_error_count(11,f,t) = 55;
                  data_out_error(g) = t;
                  g = g + 1;
               end
            end
           
            t = t + 1;
       end
    end
end