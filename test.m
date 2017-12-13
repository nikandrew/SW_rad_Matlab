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
r = 1
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