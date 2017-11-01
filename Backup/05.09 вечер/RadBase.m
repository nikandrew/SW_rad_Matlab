input = ['00'; '01'; '10'; '00'; '01'];
input_level = ['0'; '0'; '0'; '1'; '1'];
error_bit = [2 1];
error_flag = 1;
output = CoderTimerRad(input, input_level);
output_error = ChanalError(output, error_bit, error_flag);