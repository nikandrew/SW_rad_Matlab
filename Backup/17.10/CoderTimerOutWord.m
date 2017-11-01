function [ output ] = CoderTimerOutWord( reg )
    for i = 1:5
        output_temp = 0;
        if(bitget(reg(i),1) == bitget(reg(i),2))
            output_temp = bitset(output_temp,1,0);
        else
           output_temp = bitset(output_temp,1,1);
        end
        if(bitget(reg(i),1) == bitget(reg(i),3))
            output_temp = bitset(output_temp,2,0);
        else
           output_temp = bitset(output_temp,2,1);
        end
        if(bitget(reg(i),2) == bitget(reg(i),3))
            output_temp = bitset(output_temp,3,0);
        else
           output_temp = bitset(output_temp,3,1);
        end        
        output(i) = output_temp;    
    end
    
end

