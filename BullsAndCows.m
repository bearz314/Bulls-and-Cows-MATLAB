clear, clc;

% Welcome message
disp("Welcome!");
disp("Guess the four-digit number.")
disp("  #A: Correct digit at the correct location.")
disp("  #B: Correct digit at the wrong location.")
disp(" ");

% generate four random digits
rand10 = randperm(10)-1;
answer = rand10(1:4);
a = 0; tries = 0;
while a<4
    try
        guess_str = input("Your guess: ",'s');
        assert(strlength(guess_str)==4);

        % convert to vector and make sure is int (otherwise return empty or error)
        guess = dec2base(str2double(guess_str),10,4) - '0';
        assert(~isempty(guess));
    catch
        fprintf("Sorry, you should guess 4 integers!\n");
        continue
    end

    if numel(unique(guess)) < 4
        fprintf("You should enter 4 different digits.\n");
        continue
    end
    
    % check guess
    a = 0; b = 0;
    for i=1:4
        loc = find(guess(i)==answer,1);
        if loc == i
            a = a+1;
        elseif ~isempty(loc)
            b = b+1;
        end
    end
    fprintf('Feedback: %1dA%1dB\n\n',a,b);
    tries = tries + 1;
end
fprintf('Congrats, you won in %d moves!\n',tries);
load handel; sound(y,Fs);