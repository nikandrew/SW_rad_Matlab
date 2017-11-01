    input = [6 3 0 6 3 ];
    number_code_in = 3;
    code_temp_in = 7;
    number_code = number_code_in;
    code_temp = [7 7];
    code_temp(1) = code_temp_in;
    code = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
    code2 = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
    code3 = [55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55; 55 55 55 55 55];
    step = [0 0 0 0];
    step_save = [4 3 2 1];
    step_save_old = [55 55 ];
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
            

            step = step_save(2);

            g = ValueGen(step, input(number_time), number_code, code_temp(1));
            code(step, number_time) = g(1);
            code2(step, number_time) = g(2);
            code3(step, number_time) = g(3);
            
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
                    valid_value(number_time) = code(step_save(1),number_time);
                    step_save_true(number_time) = step_save(1);
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
                    valid_value(number_time) = code(step_save(2),number_time);
                    step_save_true(number_time) = step_save(2);
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
                valid_value_old(1) = code(step_save(1), number_time);
                valid_value_old(2) = code(step_save(2), number_time);
                step_save_old = step_save;
                save_time_test = number_time;
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
                    valid_value(number_time) = code(step_save(1),number_time);
                    valid_value(number_time-1) = valid_value_old(1);
                    step_save_true(number_time) = step_save(1);
                    switch step_save(1)
                        case 4  
                            output2(number_time) = 1; 
                            output2(number_time-1) = 1; 
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(1);                            
                        case 3                        
                            output2(number_time) = 0;
                            output2(number_time-1) = 1;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 2
                            output2(number_time) = 1;
                            output2(number_time-1) = 0;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(2);  
                        case 1
                            output2(number_time) = 0;
                            output2(number_time-1) = 0;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(2);  
                    end
                elseif code3(step_save(2), number_time) == 0
                    code_temp(1) =  code(step_save(2), number_time);
                    valid_value(number_time) = code(step_save(2),number_time);
                    valid_value(number_time-1) = valid_value_old(1);
                    step_save_true(number_time) = step_save(2);
                    switch step_save(2)
                        case 4  
                            output2(number_time) = 1;
                            output2(number_time-1) = 1;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 3
                            output2(number_time) = 0;
                            output2(number_time-1) = 1;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 2
                            output2(number_time) = 1;
                            output2(number_time-1) = 0;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(2);  
                        case 1
                            output2(number_time) = 0;
                            output2(number_time-1) = 0;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(2);  
                    end
                elseif code3(step_save(3), number_time) == 0
                    code_temp(1) =  code(step_save(3), number_time);
                    valid_value(number_time) = code(step_save(3),number_time);
                    valid_value(number_time-1) = valid_value_old(2);
                    step_save_true(number_time) = step_save(3);
                    switch step_save(3)
                        case 4  
                            output2(number_time) = 1;
                            output2(number_time-1) = 1;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 3
                            output2(number_time) = 0;
                            output2(number_time-1) = 1;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 2
                            output2(number_time) = 1;
                            output2(number_time-1) = 0;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(2);  
                        case 1
                            output2(number_time) = 0;
                            output2(number_time-1) = 0;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(2);  
                    end
                else
                    code_temp(1) =  code(step_save(4), number_time);
                    valid_value(number_time) = code(step_save(4),number_time);
                    valid_value(number_time-1) = valid_value_old(2);
                    step_save_true(number_time) = step_save(4);
                    switch step_save(4)
                        case 4
                            output2(number_time) = 1;
                            output2(number_time-1) = 1;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 3
                            output2(number_time) = 0;
                            output2(number_time-1) = 1;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(1);  
                        case 2
                            output2(number_time) = 1;
                            output2(number_time-1) = 0;
                            step_save = [4 3 2 1];
                            step_save_true(number_time-1) = step_save_old(2);  
                        case 1
                            output2(number_time) = 0;
                            output2(number_time-1) = 0;
                            step_save = [2 1 4 3];
                            step_save_true(number_time-1) = step_save_old(2);  
                    end
                end
            else    %Если ошибка во втором подряд такте
                switch input(number_time -1) 
                    case 0
                        if step_save_true(number_time - 2) == 3
                            step_save_true(number_time - 1) = 7;
                            step_save = [2 1 4 3];
                            number_code_error = 1;
                        elseif step_save_true(number_time - 2) == 4
                            step_save_true(number_time - 1) = 0;
                            step_save = [4 3 2 1];
                            number_code_error = 0;
                        elseif step_save_true(number_time - 2) == 0
                            step_save_true(number_time - 1) = 0;
                            step_save = [2 1 4 3];
                            number_code_error = 2;
                        elseif step_save_true(number_time - 2) == 7
                            step_save_true(number_time - 1) = 7;
                            step_save = [4 3 2 1];
                            number_code_error = 3;
                        end
                        temp_code = 0;
                    case 1
                        temp_code = 55;                
                    case 2
                        temp_code = 55;
                    case 3
                        if step_save_true(number_time - 2) == 1
                            step_save_true(number_time - 1) = 1;
                            step_save = [2 1 4 3];
                            number_code_error = 2;
                        elseif step_save_true(number_time - 2) == 6
                            step_save_true(number_time - 1) = 6;  
                            step_save = [4 3 2 1];
                            number_code_error = 3;
                        end
                        temp_code = 6;
                    case 4
                        temp_code = 55;
                    case 5
                        if step_save_true(number_time - 2) == 3
                            step_save_true(number_time - 1) = 2;
                            step_save = [2 1 4 3];
                            number_code_error = 4;
                        elseif step_save_true(number_time - 2) == 4
                            step_save_true(number_time - 1) = 5;  
                            step_save = [4 3 2 1];
                            number_code_error = 5;
                        end
                        temp_code = 5;
                    case 6
                        temp_code = 55;
                    case 7
                        temp_code = 55;
                end
                number_code_math = 0;
                a = bitget(number_code_error,2);
                number_code_math = bitset(number_code_math, 1, a);
                a = bitget(number_code_error,3);
                number_code_math = bitset(number_code_math, 2, a);
                
                %начало расчет в новый такт
                step = step_save(1);

                g = ValueGen(step, input(number_time), number_code_math, number_code_math);
                code(step, number_time) = g(1);
                code2(step, number_time) = g(2);
                code3(step, number_time) = g(3);


                step = step_save(2);

                g = ValueGen(step, input(number_time), number_code_math, number_code_math);
                code(step, number_time) = g(1);
                code2(step, number_time) = g(2);
                code3(step, number_time) = g(3);

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
                        valid_value(number_time) = code(step_save(1),number_time);
                        step_save_true(number_time) = step_save(1);
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
                        valid_value(number_time) = code(step_save(2),number_time);
                        step_save_true(number_time) = step_save(2);
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
                    valid_value_old(1) = code(step_save(1), number_time);
                    valid_value_old(2) = code(step_save(2), number_time);
                    step_save_old = step_save;
                    save_time_test = number_time;
                    step_save = [4 3 2 1];
                    if number_code == 1
                        number_code = 3;
                    else
                        number_code = number_code - 1;
                    end
                end
            end

        end
    end




