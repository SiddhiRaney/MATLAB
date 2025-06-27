%% 5. Mini Project: Simple Calculator
disp('--- Simple Calculator ---');
num1 = input('Enter first number: ');
num2 = input('Enter second number: ');
operator = input('Enter operator (+, -, *, /): ', 's');

switch operator
    case '+'
        result = num1 + num2;
    case '-'
        result = num1 - num2;
    case '*'
        result = num1 * num2;
    case '/'
        if num2 ~= 0
            result = num1 / num2;
        else
            result = 'Error: Division by zero';
        end
    otherwise
        result = 'Invalid operator';
end

disp(['Result: ', num2str(result)]);
