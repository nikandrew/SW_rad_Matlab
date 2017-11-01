clear;
inbit = '01011';
output_coder(1,:) = coder_function(0,3,inbit);  % верная

d = 2;
n_error = 10;
for n = 1:length(inbit)
    for m = 1:3
        output_coder(d,:) = coder_function(n,m,inbit);
        d = d + 1;
    end
end
for f = 1:length(inbit)
    output_coder2(f,:) = dec2bin(output_coder(6,f));
end
result = res_gen(inbit,output_coder(n_error,:));

all_length = 2^(length(inbit));
for p = 1:all_length
   temp = result(p,length(inbit),2);
   t_p = p;
   y = length(inbit);
   for i = 2: length(inbit)
          if mod(ceil(t_p/(all_length/(2^y))),2) == 0
              t_p = t_p - (all_length/(2^y));
              temp = temp + result(t_p,y-1,2);
          else
              t_p = t_p - 0;
              temp = temp + result(t_p,y-1,2);
          end 
          y = y - 1;      
   end
   finish(p) = temp;
end
temp = 15;
for p = 1:(2^length(inbit))
    if finish(p) < temp
        temp = finish(p);
        value = p;
    end
end

   
   t_p = value;
   y = length(inbit);
   out(length(inbit),1) = result(t_p,y,1);
   for i = 2: length(inbit)
          if mod(ceil(t_p/(all_length/(2^y))),2) == 0
              t_p = t_p - (all_length/(2^y));
              out(y-1,1) = result(t_p,y-1,1);
          else
              t_p = t_p - 0;
              out(y-1,1) = result(t_p,y-1,1);
          end 
          y = y - 1;      
   end
   %finish(p) = temp;
   
m = 1;
for n = 1:length(inbit)
    out(n,2) = bitget(out(n,1),m);
    if m == 3
        m = 1;
    else
        m = m + 1;
    end
end
