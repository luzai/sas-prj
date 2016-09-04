%--------------------------------------------%
%------------MATLAB Musical JukeBox----------%
%--------Mark--Belbin----Athan--Bourganos----%
%--------------------------------------------%
%--------------Enjoy-The-Jukebox-------------%
%--~~~---~~~---~~~---~~~~---~~~---~~~---~~~--%
%____________________________________________%

function imperial_march = imperial_march()
yALL = [];
Fs = 16000;


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



starwars_tones = [G G G Eb Bb G Eb Bb G d d d eb Bb Gb Eb Bb G g G G g gb f e eb e Ab db c B Bb A Bb Eb Gb Eb Gb Bb G Bb d g G G g gb f e eb e Ab db c B Bb A Bb Eb Gb Eb Bb G Eb Bb G... 
                  G G G Eb Bb G Eb Bb G d d d eb Bb Gb Eb Bb G g G G g gb f e eb e Ab db c B Bb A Bb Eb Gb Eb Bb G Eb Bb G D8 D Eb C D8 Bb A Gb D8 d db A c Bb Gb Eb D8 D Eb C D8 Bb A Gb D8 g d Bb Ab Eb B8 Ab8 G88 D Eb C G88 Bb A Gb G88 d db A c Bb Gb Eb Ab88 Eb E Db Ab88 B Bb G Ab88 ab eb B A E C Ab8 ...
                  A A A F c A F c A    e e e f c Ab F c A    a A A a ab g gb f gb Bb eb d db c B c F Ab F c A F c A a A A a ab g gb f gb Bb eb d db c B c F Ab F c A F c A];
              
starwars_times = [12 12 12 9 3 12 9 3 24 12 12 12 9 3 12 9 3 24 12 9 3 12 9 3 3 3 12 6 12 9 3 3 3 12 6 12 9 3 12 9 3 24 12 9 3 12 9 3 3 3 12 6 12 9 3 3 3 12 6 12 9 3 12 9 3 24 ...
                  12 12 12 9 3 12 9 3 24 12 12 12 9 3 12 9 3 24 12 9 3 12 9 3 3 3 12 6 12 9 3 3 3 12 6 12 9 3 12 9 3 24 6 6 6 6    6 6 6 6    6 6 6 6    6 6 6 6    6 6 6 6   6 6 6 6    6 6 6 6    6 6 6 6   6 6 6 6   6 6 6 6   6 6 6 6   6 6 6 6   6 6 6 6   6 6 6 6   6 6 6 6   6 6 6 6 ...
                  12 12 12 9 3 12 9 3 24 12 12 12 9 3 12 9 3 24 12 9 3 12 9 3 3 3 12 6 12 9 3 3 3 12 6 12 9 3 12 9 3 24 12 9 3 12 9 3 3 3 12 6 12 9 3 3 3 12 6 12 9 3 12 9 3 24];
%235 notes %24 time

pause = 1;
pause_count = 0;

pause_value = 0.1;
pause_logic = 0;
pause_count = 0;

for (a = 1: 1: ((length(starwars_tones) * 2) - 1))
    if pause_logic == 0
        
    t = 1/Fs:1/Fs:(starwars_times(a - pause_count)/24);
    y = sin(starwars_tones(a - pause_count)*2*pi*t);
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
