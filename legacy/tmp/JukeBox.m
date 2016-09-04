%--------------------------------------------%
%------------MATLAB Musical JukeBox----------%
%--------Mark--Belbin----Athan--Bourganos----%
%--------------------------------------------%
%--------------Enjoy-The-Jukebox-------------%
%--~~~---~~~---~~~---~~~~---~~~---~~~---~~~--%
%____________________________________________%

function a = JukeBox()
    clc
    disp('==========================================')
    disp('SONGS    ---   ---   ---   ---   ---    ID')
    disp(' ')
    disp('The Legend of Zelda: Overworld Theme     1')
    disp('Star Wars: The Imperial March            2')
    disp('Tetris: Tetris Theme A                   3')
    disp('------------------------------------------')
    disp('Exit Jukebox                             9')
    disp('==========================================')
    req = input('Enter song ID: ');
    if req == 1
        zelda_theme();
        disp(' ')
        disp('The song is complete!')
        disp(' ')
        exit = input('Press enter to choose another (or the same one)...');
        clc
        JukeBox();
    elseif req == 2
        imperial_march();
        disp(' ')
        disp('The song is complete!')
        disp(' ')
        exit = input('Press enter to choose another (or the same one)...');
        clc
        JukeBox();
    elseif req == 3
        tetris_theme();
        disp(' ')
        disp('The song is complete!')
        disp(' ')
        exit = input('Press enter to choose another (or the same one)...');
        clc
        JukeBox();
    elseif (req == 9)
        clc
    else
        disp(' ')
        disp('The song ID entered does not exist...')
        disp(' ')
        retry = input('Press enter to retry...');
        clc
        JukeBox();
    end
end

