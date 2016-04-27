clear;
close all;
audio=audioread('./AudioFiles/mixed.wav');
audio =audio';
%% ex1
Fs=8000;
%sound(audio,Fs);
subplot(3,1,1);plotAudio(audio,Fs)
%sound(audio,8000+1000);

%% ex3
audioFlip=fliplr(audio);
%sound(audioFlip,Fs)
subplot(3,1,2);plotAudio(audio,Fs)

audioDown=timescale(audio,2,10);
%sound(timescale(audio,2,3),Fs)
time=(1:size(audio,2)*2/10)*1/Fs;
subplot(3,1,3);plot(time,audioDown)

%% ex4
time = 0:0.01:10; 
for level = [0, 1, 0.25, -2, 100]
	y = cos(time.*pi.*0.25);
    [signalFade,flag]=fade(y,level);
    if flag==1
        figure;plot(time,signalFade);
    end
end	

%% ex5
for N=[3,0,-1]
    audioRepeat=repeat(audio,N);
    if(~isempty(audioRepeat))
        plot(audioRepeat);
    end
end

audioDelay=delay(audio,1,Fs);
time=(1:size(audioDelay,2))*1/Fs;
plot(time,audioDelay)

%%
audio2=audioread('./AudioFiles/castanets44m.wav');
audio2=audio2';
sound(mixer(audio,audio2),Fs)

%%
notecreate = @(frq,dur) sin(2*pi* [1:dur]/8192 * (440*2.^((frq-1)/12)));
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
song = {'A' 'A' 'E' 'E' 'F#' 'F#' 'E' 'E' 'D' 'D' 'C#' 'C#' 'B' 'B' 'A' 'A'};
for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);
end    
dur = 0.3*8192;
songnote = [];
for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1),dur)  zeros(1,75)]'];
end
soundsc(songnote, 8192)
