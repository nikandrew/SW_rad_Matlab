function [ valid_value ] = RadDecoderTimerValueCount( input, number_code_in, code_temp_in )
   % input = [6 3 2 6 3];
    number_code = number_code_in;
    code_temp = [7 7];
    code_temp(1) = code_temp_in;
    code = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
    code2 = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
    code3 = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
    step = 0;
    step_save = [4 3 2 1];
    step_save_old = [55 55 55 55];
    valid_value_old = [55 55 ];
    error = 0;
    valid_value = [55 55 55 55 55];
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
                    valid_value(number_time) = step_save_old(1);
                    switch step_save(1)
                        case 4  
                            step_save = [4 3 2 1];
                        case 3
                            step_save = [2 1 4 3];
                        case 2
                            step_save = [4 3 2 1];
                        case 1
                            step_save = [2 1 4 3];
                    end
                else
                    code_temp(1) =  code(step_save(2), number_time);
                    valid_value(number_time) = step_save_old(2);
                    switch step_save(2)
                        case 4
                            step_save = [4 3 2 1];
                        case 3
                            step_save = [2 1 4 3];
                        case 2
                            step_save = [4 3 2 1];
                        case 1
                            step_save = [2 1 4 3];
                    end
                end
            else
                error = 1;
                number_code_save = number_code;
                code_temp(1) =  code(step_save(1), number_time);
                code_temp(2) =  code(step_save(2), number_time);
                valid_value_old(1) = step_save_old(1);
                valid_value_old(2) = step_save_old(2);
                step_save = [4 3 2 1];
                if number_code == 1
                    number_code = 3;
                else
                    number_code = number_code - 1;
                end
            end
        elseif error == 1
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
            
            step = step_save(3);

            g = ValueGen(step, input(number_time), number_code, code_temp(2));
            code(step, number_time) = g(1);
            code2(step, number_time) = g(2);
            code3(step, number_time) = g(3);
            step_save_old(3) = g(4);

            step = step_save(4);

            g = ValueGen(step, input(number_time), number_code, code_temp(2));
            code(step, number_time) = g(1);
            code2(step, number_time) = g(2);
            code3(step, number_time) = g(3);
            step_save_old(4) = g(4);

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
                    valid_value(number_time) = step_save_old(1);
                    valid_value(number_time-1) = valid_value_old(1);
                    switch step_save(1)
                        case 4  
                            step_save = [4 3 2 1];
                        case 3                        
                            step_save = [2 1 4 3];
                        case 2
                            step_save = [4 3 2 1];
                        case 1
                            step_save = [2 1 4 3];
                    end
                elseif code3(step_save(2), number_time) == 0
                    code_temp(1) =  code(step_save(2), number_time);
                    valid_value(number_time) = step_save_old(2);
                    valid_value(number_time-1) = valid_value_old(1);
                    switch step_save(2)
                        case 4  
                            step_save = [4 3 2 1];
                        case 3
                            step_save = [2 1 4 3];
                        case 2
                            step_save = [4 3 2 1];
                        case 1
                            step_save = [2 1 4 3];
                    end
                elseif code3(step_save(3), number_time) == 0
                    code_temp(1) =  code(step_save(3), number_time);
                    valid_value(number_time) = step_save_old(3);
                    valid_value(number_time-1) = valid_value_old(2);
                    switch step_save(3)
                        case 4  
                            step_save = [4 3 2 1];
                        case 3
                            step_save = [2 1 4 3];
                        case 2
                            step_save = [4 3 2 1];
                        case 1
                            step_save = [2 1 4 3];
                    end
                else
                    code_temp(1) =  code(step_save(4), number_time);
                    valid_value(number_time) = step_save_old(4);
                    valid_value(number_time-1) = valid_value_old(2);
                    switch step_save(4)
                        case 4
                            step_save = [4 3 2 1];
                        case 3
                            step_save = [2 1 4 3];
                        case 2
                            step_save = [4 3 2 1];
                        case 1
                            step_save = [2 1 4 3];
                    end
                end
            else    %Если ошибка во втором подряд такте
                switch input(number_time -1) 
                    case 0
                        temp_code = 0;
                    case 1
                        temp_code = 1;                
                    case 2
                        temp_code = 7;
                    case 3
                        temp_code = 6;
                    case 4
                        temp_code = 4;
                    case 5
                        temp_code = 5;
                    case 6
                        temp_code = 3;
                    case 7
                        temp_code = 2;
                end

            end
        end
    end



end

