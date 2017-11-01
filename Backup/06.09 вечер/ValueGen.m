function [ code ] = ValueGen( step, input, number_code, code_temp )
    step_value = [0 1 0 1];
    code = [0 0 0];
    code(1) = code_temp;
    code(1) = bitset(code(1),number_code,step_value(step));
    a = bitget(code(1),1);
    b = bitget(code(1),2);
    code(2) = bitset(code(2),1,xor(a,b));
    code(2) = bitset(code(2),2,bitget(code(1),2));
    a = bitget(code(1),2);
    b = bitget(code(1),3);
    code(2) = bitset(code(2),3,xor(a,b));
    code(3) = 0;
    code(4) = step_value(step);
    for p=1:3
        a2(p) = bitget(code(2),p);
        b2(p) = bitget(input,p);
        if a2(p) ~= b2(p)
            code(3) = code(3) + 1;
        end
    end


end

