output = 0;
    buffer = 0;
    error_bit = 2;    % бит в котором должна быть ошибка
    error_time = 3;   % Время в котое произошел сбой 1,2 или 3е считывание
    n = 1;
    inbin = '01011';  % входное значение
    input = bin2dec(inbin);
    if error_bit < 4
        error_number = error_bit;
    elseif mod(error_bit,3) == 0
        error_number = 3;
    else
        error_number = error_bit - (3*fix(error_bit/3));
    end 
    for i = 1:length(inbin)
        buffer = bitset(buffer,n,bitget(input,i));
        if (i == error_bit + error_time - 1 || i == error_bit + error_time) && error_bit > 0
            if bitget(buffer,error_number) == 1
                buffer = bitset(buffer,error_number,0);
            else
                buffer = bitset(buffer,error_number,1);
            end    
        end

        output_temp(i) = buffer;
        output(i) = 0;
        output(i) = bitset(output(i),1,bitget(output_temp(i),2));
        output(i) = bitset(output(i),2,xor(bitget(output_temp(i),1),bitget(output_temp(i),3)));
        if n==3
            n = 1;
        else
            n = n + 1;
        end
    end