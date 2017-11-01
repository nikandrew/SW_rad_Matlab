function [  result ] = res_gen( inbit, const_cod )
    %inbit = '01011';
 %const_cod = coder_function(0,3,inbit);
    result((((2^length(inbit))/2)+1),1,1) = 1;
    result((((2^length(inbit))/2)+1),1,3) = 2;
    delta = 0;
    for t = 1:2
       if bitget(result((((2^length(inbit))/2)+1),1,3),t) == bitget(const_cod(1),t)
           delta = delta + 0;
       else
           delta = delta + 1;
       end
    end
    result((((2^length(inbit))/2)+1),1,2) = delta;
    delta = 0;
    for t = 1:2
       if bitget(result(1,1,3),t) == bitget(const_cod(1),t)
           delta = delta + 0;
       else
           delta = delta + 1;
       end
    end
    result(1,1,2) = delta;
    result(1,1,1) = 0;
    for i = 2:length(inbit)
        if i < 4
            number = i;
        elseif mod(i,3) == 0
            number = 3;
        else
            number = i - (3*fix(i/3));
        end 
        all_length = 2^(length(inbit));

        for p = 1:2^i
           if  mod(p,2) == 0  
               result(1+((all_length/2^i)*(p-1)),i,1) = bitset(result(1+((all_length/2^(i-1))*((p/2)-1)),i-1,1),number,1);
               result(1+((all_length/2^i)*(p-1)),i,3) = 0;
               result(1+((all_length/2^i)*(p-1)),i,3) = bitset(result(1+((all_length/2^i)*(p-1)),i,3),1,bitget(result(1+((all_length/2^i)*(p-1)),i,1),2));
               result(1+((all_length/2^i)*(p-1)),i,3) = bitset(result(1+((all_length/2^i)*(p-1)),i,3),2,xor(bitget(result(1+((all_length/2^i)*(p-1)),i,1),1),bitget(result(1+((all_length/2^i)*(p-1)),i,1),3)));
               delta = 0;
               for t = 1:2
                  if bitget(result(1+((all_length/2^i)*(p-1)),i,3),t) == bitget(const_cod(i),t)
                      delta = delta + 0;
                  else
                      delta = delta + 1;
                  end
               end
               result(1+((all_length/2^i)*(p-1)),i,2) = delta;
           else
               result(1+((all_length/2^i)*(p-1)),i,1) = bitset(result((1+((all_length/2^(i-1))*(((p+1)/2)-1))),i-1,1),number,0);
               result(1+((all_length/2^i)*(p-1)),i,3) = 0;
               result(1+((all_length/2^i)*(p-1)),i,3) = bitset(result(1+((all_length/2^i)*(p-1)),i,3),1,bitget(result(1+((all_length/2^i)*(p-1)),i,1),2));
               result(1+((all_length/2^i)*(p-1)),i,3) = bitset(result(1+((all_length/2^i)*(p-1)),i,3),2,xor(bitget(result(1+((all_length/2^i)*(p-1)),i,1),1),bitget(result(1+((all_length/2^i)*(p-1)),i,1),3)));
               delta = 0;
               for t = 1:2
                  if bitget(result(1+((all_length/2^i)*(p-1)),i,3),t) == bitget(const_cod(i),t)
                      delta = delta + 0;
                  else
                      delta = delta + 1;
                  end
               end
               result(1+((all_length/2^i)*(p-1)),i,2) = delta;
           end

        end    
    end 

end

