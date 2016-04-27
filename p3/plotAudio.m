function plotAudio(audio,Fs)

% 
sizeAudio = min(25000,numel(audio));

% while (numel(audio)>25000)
%     audio = audio(1:2:numel(audio));
%     Fs=Fs/2;
% end

time=(1:sizeAudio)*1/Fs;
plot(time,audio(1:sizeAudio));