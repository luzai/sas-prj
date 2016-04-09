function out=delay(sound,delay,Fs)

if (delay<0)
    disp('Advance instead');
    %...
end

if size(sound,1) ~=1
    sound = sound';
end
out = [zeros(1,round(Fs*delay)) sound];
    
    
    