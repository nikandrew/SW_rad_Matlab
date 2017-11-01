input = [6 1 0 5 3];
number_step = 4;
number_code = 3;
code_value = 1;
code_temp = [7 7];
code = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
code2 = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
code3 = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
step = [0 0 0 0];
step_value = [0 1 0 1];
step_save = [4 3 2 1];
step_save_old = [55 55 ];
error = 0;
output = [55 55 55 55 55];
output2 = [55 55 55 55 55];
for number_time = 1:5
    if(error == 0) 
        
        step = step_save(1);
        
        g = ValueGen(step, input(number_time), number_code, code_temp(1));
        code(step, number_time) = g(1);
        code2(step, number_time) = g(2);
        code3(step, number_time) = g(3);
        step_save_old(1) = g(4);
        
        step = step_save(2);
        
        g = ValueGen(step, input(number_time), number_code, code_temp(1));
        code(step, number_time) = g(1);
        code2(step, number_time) = g(2);
        code3(step, number_time) = g(3);
        step_save_old(2) = g(4);
        
        if(code3(step_save(1), number_time) == 0) | ( code3(step_save(2), number_time) == 0)
            error = 0;
            output(number_time) = number_code;
            if number_code == 1
                number_code = 3;
            else
                number_code = number_code - 1;
            end 
            if code3(step_save(1), number_time) == 0
                code_temp(1) =  code(step_save(1), number_time);
                switch step_save(1)
                    case 4  
                        output2(number_time) = 1;
                        step_save = [4 3 2 1];
                    case 3
                        output2(number_time) = 0;
                        step_save = [2 1 4 3];
                    case 2
                        output2(number_time) = 1;
                        step_save = [4 3 2 1];
                    case 1
                        output2(number_time) = 0;
                        step_save = [2 1 4 3];
                end
            else
                code_temp(1) =  code(step_save(2), number_time);
                switch step_save(2)
                    case 4
                        output2(number_time) = 1;
                        step_save = [4 3 2 1];
                    case 3
                        output2(number_time) = 0;
                        step_save = [2 1 4 3];
                    case 2
                        output2(number_time) = 1;
                        step_save = [4 3 2 1];
                    case 1
                        output2(number_time) = 0;
                        step_save = [2 1 4 3];
                end
            end
        else
            error = 1;
            number_code_save = number_code;
            code_temp(1) =  code(step_save(1), number_time);
            code_temp(2) =  code(step_save(2), number_time);
            
            step_save = [4 3 2 1];
            if number_code == 1
                number_code = 3;
            else
                number_code = number_code - 1;
            end
        end
    else
        step = step_save(1);
        
        g = ValueGen(step, input(number_time), number_code, code_temp(1));
        code(step, number_time) = g(1);
        code2(step, number_time) = g(2);
        code3(step, number_time) = g(3);
        
        step = step_save(2);
        
        g = ValueGen(step, input(number_time), number_code, code_temp(1));
        code(step, number_time) = g(1);
        code2(step, number_time) = g(2);
        code3(step, number_time) = g(3);
        
        step = step_save(3);
        
        g = ValueGen(step, input(number_time), number_code, code_temp(2));
        code(step, number_time) = g(1);
        code2(step, number_time) = g(2);
        code3(step, number_time) = g(3);
        
        step = step_save(4);
        
        g = ValueGen(step, input(number_time), number_code, code_temp(2));
        code(step, number_time) = g(1);
        code2(step, number_time) = g(2);
        code3(step, number_time) = g(3);
        
        if(code3(step_save(1), number_time) == 0) | ( code3(step_save(2), number_time) == 0 | code3(step_save(3), number_time) == 0) | ( code3(step_save(4), number_time) == 0)
            error = 0;
            output(number_time) = number_code;
            output(number_time - 1) = number_code_save;
            number_code_save = 55;
            if number_code == 1
                number_code = 3;
            else
                number_code = number_code - 1;
            end 
            if code3(step_save(1), number_time) == 0
                code_temp(1) =  code(step_save(1), number_time);
                output2(number_time-1) = 1;
                switch step_save(1)
                    case 4  
                        output2(number_time) = 1; 
                        output2(number_time-1) = 1; 
                        step_save = [4 3 2 1];
                    case 3                        
                        output2(number_time) = 0;
                        output2(number_time-1) = 1;
                        step_save = [2 1 4 3];
                    case 2
                        output2(number_time) = 1;
                        output2(number_time-1) = 0;
                        step_save = [4 3 2 1];
                    case 1
                        output2(number_time) = 0;
                        output2(number_time-1) = 0;
                        step_save = [2 1 4 3];
                end
            elseif code3(step_save(2), number_time) == 0
                code_temp(1) =  code(step_save(2), number_time);
                switch step_save(2)
                    case 4  
                        output2(number_time) = 1;
                        output2(number_time-1) = 1;
                        step_save = [4 3 2 1];
                    case 3
                        output2(number_time) = 0;
                        output2(number_time-1) = 1;
                        step_save = [2 1 4 3];
                    case 2
                        output2(number_time) = 1;
                        output2(number_time-1) = 0;
                        step_save = [4 3 2 1];
                    case 1
                        output2(number_time) = 0;
                        output2(number_time-1) = 0;
                        step_save = [2 1 4 3];
                end
            elseif code3(step_save(3), number_time) == 0
                code_temp(1) =  code(step_save(3), number_time);
                switch step_save(3)
                    case 4  
                        output2(number_time) = 1;
                        output2(number_time-1) = 1;
                        step_save = [4 3 2 1];
                    case 3
                        output2(number_time) = 0;
                        output2(number_time-1) = 1;
                        step_save = [2 1 4 3];
                    case 2
                        output2(number_time) = 1;
                        output2(number_time-1) = 0;
                        step_save = [4 3 2 1];
                    case 1
                        output2(number_time) = 0;
                        output2(number_time-1) = 0;
                        step_save = [2 1 4 3];
                end
            else
                code_temp(1) =  code(step_save(4), number_time);
                switch step_save(4)
                    case 4
                        output2(number_time) = 1;
                        output2(number_time-1) = 1;
                        step_save = [4 3 2 1];
                    case 3
                        output2(number_time) = 0;
                        output2(number_time-1) = 1;
                        step_save = [2 1 4 3];
                    case 2
                        output2(number_time) = 1;
                        output2(number_time-1) = 0;
                        step_save = [4 3 2 1];
                    case 1
                        output2(number_time) = 0;
                        output2(number_time-1) = 0;
                        step_save = [2 1 4 3];
                end
            end
        else
            
        end
        
    end
end

