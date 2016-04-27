%--------------------------------------------%
%------------MATLAB Musical JukeBox----------%
%--------Mark--Belbin----Athan--Bourganos----%
%--------------------------------------------%
%--------------Enjoy-The-Jukebox-------------%
%--~~~---~~~---~~~---~~~~---~~~---~~~---~~~--%
%____________________________________________%

function zelda_theme = zelda_theme()
yALL = [];
Fs = 8000;


G88 = 97.9989;
Ab88 = 103.826;
D8 = 146.832;
Gb8 = 184.997;
Ab8 = 207.652;
A8 = 220.000;
Bb8 = 233.082;
B8 = 246.942;
C = 261.626;
Db = 277.183;
D = 293.665;
Eb = 311.127;
E = 329.628;
F = 349.228;
Gb = 369.994;
G = 391.995;
Ab = 415.305;
A = 440.000;
Bb = 466.164;
B = 493.883;
c = 523.251;
db = 554.365;
d = 587.330;
eb = 622.254;
e = 659.255;
f = 698.456;
gb = 739.989;
g = 783.991;
ab = 830.609;
a = 880.000;
bb = 932.328;
b = 987.767;
c8 = 1046.50;
db8 = 1108.73;
d8 = 1174.66;
eb8 = 1244.51;
e8 = 1318.51;





zelda_tones = [Bb Bb Bb Bb Bb Bb Ab Bb Bb Bb Bb Bb Bb Ab Bb Bb Bb Bb Bb Bb F F F F F F F F F F ...
         Bb F Bb Bb c d eb f f f gb ab bb bb bb bb ab gb ab gb f f eb eb f gb f eb db db eb f eb db c c d e g f F F F F F F F F F F ...
         Bb F Bb Bb c d eb f f f gb ab bb db8 c8 a f gb bb a f f gb bb a f d eb gb f db Bb c c d e g f F F F F F F F F F F];
     
zelda_times = [22 4 4 4 4 8 4 20 4 4 4 4 8 4 20 4 4 4 4 6 3 3 6 3 3 6 3 3 6 6 ...
         12 21 3 3 3 3 3 30 6 4 4 4 28 4 4 4 4 4 8 4 24 12 6 3 3 24 6 6 6 3 3 24 6 6 6 3 3 24 12 6 3 3 6 3 3 6 3 3 6 6 ... 
         12 21 3 3 3 3 3 30 6 4 4 4 36 12 12 24 12 36 12 12 24 12 36 12 12 24 12 36 12 12 24 12 6 3 3 24 12 6 3 3 6 3 3 6 3 3 6 6];
     
     
     
     
pause_value = 0.1;
pause_logic = 0;
pause_count = 0;

for (a = 1: 1: ((length(zelda_tones) * 2) - 1))
    if pause_logic == 0
        
    t = 1/Fs:1/Fs:(zelda_times(a - pause_count)/24);
    y = sin(zelda_tones(a - pause_count)*2*pi*t);
    yALL = [yALL, y];
    
    elseif pause_logic == 1
        
    t = 1/Fs:1/Fs:(pause_value/24);
    y = sin(0*2*pi*t);
    yALL = [yALL, y];
    pause_count = pause_count + 1;
    
    end
    
    if pause_logic == 1
        pause_logic = 0;
        
    elseif pause_logic == 0
        pause_logic = 1;
        
    end
    

    
end

sound(yALL, Fs);


end