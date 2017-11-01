input = [6 1 0 4 3];
number_step = 4;
number_code = 3;
number_time = 1;
code_value = 1;
code_temp = 7;
code = [0 0 0; 0 0 0; 0 0 0; 0 0 0];
step = [0 0 0 0];
error = 0;
for number_time = 1:5
    switch number_step
        case 4
            if error == 0
                step(4) = 4;
                step(3) = 3;
            else
                step(4) = 4;
                step(3) = 3;
                step(2) = 2;
                step(1) = 1;
            end
        case 3
            if error == 0
                step(4) = 1;
                step(3) = 2;
            else
                step(4) = 1;
                step(3) = 2;
                step(2) = 3;
                step(1) = 4;
            end
        case 2
            if error == 0
                step(4) = 4;
                step(3) = 3;
            else
                step(4) = 4;
                step(3) = 3;
                step(2) = 2;
                step(1) = 1;
            end
        case 1
            if error == 0
                step(4) = 1;
                step(3) = 2;
            else
                step(4) = 1;
                step(3) = 2;
                step(2) = 3;
                step(1) = 4;
            end
    end
    if(error == 0) 
        code(4,1) = code_temp(1);
        code(4,1) = bitset(code(4,1),number_code,3);
        a = bitget(code(4,1),1);
        b = bitget(code(4,1),2);
        code(4,2) = bitset(code(4,2),1,xor(a,b));
        code(4,2) = bitset(code(4,2),2,bitget(code(4,1),2));
        a = bitget(code(4,1),2);
        b = bitget(code(4,1),3);
        code(4,2) = bitset(code(4,2),3,xor(a,b));
        for i=1:3
            a = bitget(code(4,2),i);
            b = bitget(input(number_time),i);
            if a ~= b
                code(4,3) = code(4,3) + 1;
            end
        end

        code(3,1) = code_temp(1);
        code(3,1) = bitset(code(3,1),number_code,0);
        a = bitget(code(3,1),1);
        b = bitget(code(3,1),2);
        code(3,2) = bitset(code(3,2),1,xor(a,b));
        code(3,2) = bitset(code(3,2),2,bitget(code(3,1),2));
        a = bitget(code(3,1),2);
        b = bitget(code(3,1),3);
        code(3,2) = bitset(code(3,2),3,xor(a,b));
        for i=1:3
            a = bitget(code(3,2),i);
            b = bitget(input(number_time),i);
            if a ~= b
                code(3,3) = code(3,3) + 1;
            end
        end
    else
    end
end

