input = [3 0 6 3];
old_buffer = 1;
old_step = 1; 
old_number = 2;
old_value = 0;
old_input = 3;
old_count = 55;
error = 0;

% ���������� ������� �� ���������� 2 ��� ������ = 0
dop2_0_buffer = 55;
dop2_0_number = 55;
dop2_0_count = 55;
dop2_0_value = 55;

% ���������� ������� �� ���������� 3 ��� ������ = 0
dop3_0_buffer = 55;
dop3_0_number = 55;
dop3_0_count = 55;
dop3_0_value = 55;
dop3_run = 0;
for number_time = 1:3
    if(error == 0) 
        if(old_input == input(number_time))
            % ������� �� ���������� 2
            dop2_0_number = old_number;
            if dop2_0_number == 1
                dop2_0_number = 3;
            else
                dop2_0_number = dop2_0_number - 1;
            end
            dop2_0_count = 3 - dop2_0_number;
            dop2_0_buffer = old_buffer;
            dop2_0_step = old_step(1);
            if(bitget(dop2_0_buffer,dop2_0_number) == 1) % ������������ ���
                dop2_0_buffer = bitset(dop2_0_buffer,dop2_0_number,0);
                dop2_0_value = 0;
                switch dop2_0_step
                        case 4  
                            dop2_0_step = 3;
                        case 3  
                            dop2_0_step = 1;
                        case 2  
                            dop2_0_step = 3;
                        case 1  
                            dop2_0_step = 1;
                end                
            else
                dop2_0_buffer = bitset(dop2_0_buffer,dop2_0_number,1);
                dop2_0_value = 1;
                switch dop2_0_step
                        case 4  
                            dop2_0_step = 4;
                        case 3  
                            dop2_0_step = 2;
                        case 2  
                            dop2_0_step = 4;
                        case 1  
                            dop2_0_step = 2;
                end                
            end    
                
            % ������� �� ���������� 3
            dop3_0_number = 2;
            dop3_0_count = 3 - dop3_0_number;
            dop3_0_buffer = old_buffer;
            dop3_0_value = old_value;
            dop3_0_step = old_step(1);
            if(dop3_0_value == 1) 
                switch dop3_0_step
                    case 4  
                        dop3_0_step = 4;
                    case 3  
                        dop3_0_step = 2;
                    case 2  
                        dop3_0_step = 4;
                    case 1  
                        dop3_0_step = 2;
                end  
            else
                switch dop3_0_step
                    case 4  
                        dop3_0_step = 3;
                    case 3  
                        dop3_0_step = 1;
                    case 2  
                        dop3_0_step = 3;
                    case 1  
                        dop3_0_step = 1;
                end  
            end
            
            error = 3;
        else
            
        end
    elseif(error == 1)

    elseif(error == 2)

    elseif(error == 3)
        % ������� �� ���������� 2
        dop2_3_number = dop2_0_number;
        
        if dop2_3_number == 1
            dop2_3_number = 3;
        else
            dop2_3_number = dop2_3_number - 1;
        end
        
        switch dop2_0_step
            case 4  
                step(1) = 4;
                step(2) = 3;
            case 3  
                step(1) = 2;
                step(2) = 1;
            case 2  
                step(1) = 4;
                step(2) = 3;
            case 1  
                step(1) = 2;
                step(2) = 1;
        end 
        g1 = ValueGen(step(1), input(number_time), dop2_3_number, dop2_0_buffer);        
        g2 = ValueGen(step(2), input(number_time), dop2_3_number, dop2_0_buffer);
        if(g1(3) == 0) 
            dop2_3_buffer = g1(1);
            dop2_3_step = step(1);
            dop2_3_value = g1(4);
            dop2_3_input = input(number_time);
            dop2_3_count = 3 - dop2_3_number;
        elseif(g2(3) == 0)
            dop2_3_buffer = g2(1);            
            dop2_3_step = step(2);
            dop2_3_value = g2(4);
            dop2_3_input = input(number_time);
            dop2_3_count = 3 - dop2_3_number;
        end
        
        % ������� �� ���������� 3
        dop3_3_number = dop3_0_number;
        if dop3_3_number == 1
            dop3_3_number = 3;
        else
            dop3_3_number = dop3_3_number - 1;
        end
        switch dop3_0_step
            case 4  
                step(1) = 4;
                step(2) = 3;
            case 3  
                step(1) = 2;
                step(2) = 1;
            case 2  
                step(1) = 4;
                step(2) = 3;
            case 1  
                step(1) = 2;
                step(2) = 1;
        end 
        g1 = ValueGen(step(1), input(number_time), dop3_3_number, dop3_0_buffer);        
        g2 = ValueGen(step(2), input(number_time), dop3_3_number, dop3_0_buffer);
        if(g1(3) == 0) 
            dop3_3_buffer = g1(1);
            dop3_3_step = step(1);
            dop3_3_value = g1(4);
            dop3_3_input = input(number_time);
            dop3_3_count = 3 - dop3_3_number;
        elseif(g2(3) == 0)
            dop3_3_buffer = g2(1);                
            dop3_3_step = step(2);
            dop3_3_value = g2(4);
            dop3_3_input = input(number_time);
            dop3_3_count = 3 - dop3_3_number;
        end
        error = 4;
    elseif(error == 4) 
        % ������� �� ���������� 2
        old_number = dop2_3_number;
        
        if old_number == 1
            old_number = 3;
        else
            old_number = old_number - 1;
        end
        
        switch dop2_3_step
            case 4  
                step(1) = 4;
                step(2) = 3;
            case 3  
                step(1) = 2;
                step(2) = 1;
            case 2  
                step(1) = 4;
                step(2) = 3;
            case 1  
                step(1) = 2;
                step(2) = 1;
        end 
        g1 = ValueGen(step(1), input(number_time), old_number, dop2_3_buffer);        
        g2 = ValueGen(step(2), input(number_time), old_number, dop2_3_buffer);
        if(g1(3) == 0) 
            old_buffer = g1(1);
            old_step = step(1);
            old_value = g1(4);
            old_input = input(number_time);
            old_count = 3 - old_number;
        elseif(g2(3) == 0)
            old_buffer = g2(1);            
            old_step = step(2);
            old_value = g2(4);
            old_input = input(number_time);
            old_count = 3 - old_number;
        else
            % ������� �� ���������� 3
            dop3_run = 1;
            old_number = dop3_3_number;
            if old_number == 1
                old_number = 3;
            else
                old_number = old_number - 1;
            end
            switch dop3_3_step
                case 4  
                    step(1) = 4;
                    step(2) = 3;
                case 3  
                    step(1) = 2;
                    step(2) = 1;
                case 2  
                    step(1) = 4;
                    step(2) = 3;
                case 1  
                    step(1) = 2;
                    step(2) = 1;
            end 
            g1 = ValueGen(step(1), input(number_time), old_number, dop3_3_buffer);        
            g2 = ValueGen(step(2), input(number_time), old_number, dop3_3_buffer);
            if(g1(3) == 0) 
                old_buffer = g1(1);
                old_step = step(1);
                old_value = g1(4);
                old_input = input(number_time);
                old_count = 3 - old_number;
            elseif(g2(3) == 0)
                old_buffer = g2(1);                
                old_step = step(2);
                old_value = g2(4);
                old_input = input(number_time);
                old_count = 3 - old_number;
            end
        end      
            
        error = 0;
    end
    
end