function [ output ] = CoderTimerOutWord( reg )
    for i = 1:7
        output_temp = 0;
        a = bitget(reg(i),1);
        b = bitget(reg(i),2);
        output_temp = bitset(output_temp,1,xor(a,b));
        a = bitget(reg(i),1);
        b = bitget(reg(i),3);
        output_temp = bitset(output_temp,2,xor(a,b));    
        a = bitget(reg(i),2);
        b = bitget(reg(i),3);
        output_temp = bitset(output_temp,3,xor(a,b));
        output(i) = output_temp;    
    end
    
end

