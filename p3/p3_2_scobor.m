clear;close all;
%---- Constants begin
noteName = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};
Fs=8000;
%---- Constants end

song = {'A' 'A' 'E' 'E' 'E' 'B' 'C' 'B' 'A' };
dur=[2,1,1,1,1,1,1,1,4]*Fs/2;

songIdx = zeros(1,length(song));
for k1 = 1:length(song)
    idx = strcmp(song(k1), noteName);
    songIdx(k1) = find(idx);
end
frq=440*2.^((songIdx-1)/12);

delayOfZero=0;
songNote=zeros(1,sum(dur)+delayOfZero*numel(dur));
nowBgn=1;
for k1 = 1:length(songIdx)
    %square or sawtooth
    tmpNote=[mixer(NoteCreate(frq(k1),dur(k1),'sin'),NoteCreate(frq(k1),dur(k1),'sin'))...  
        zeros(1,delayOfZero)];
    timescale(tmpNote,4,3);
    sizeTmpNote = numel(tmpNote);
    splitTmpNote = int64([0.2, 0.2+0.05 ,0.2+0.05+0.4 ,1 ]*sizeTmpNote);
    A = fade(tmpNote(1:splitTmpNote(1) ), 0, 0.5);
    D = fade(tmpNote(splitTmpNote(1):splitTmpNote(2)),0.5,0.4);
    S = fade(tmpNote(splitTmpNote(2):splitTmpNote(3)),0.4,0.4);
    R = fade(tmpNote(splitTmpNote(3):splitTmpNote(4)),0.4,0);
    ADSR = [A D S R];
    nowEnd=nowBgn+numel(ADSR)-1;
    songNote(nowBgn:nowEnd) = mixer(songNote(nowBgn:nowEnd), ADSR);
    nowBgn=nowEnd-int64(numel(ADSR)*1/4);
end

plotAudio(songNote,Fs)
%subplot(2,1,1);plotAudio(songNote,Fs)
soundsc(songNote, Fs)
%subplot(2,1,2);plotAudio(songNote,Fs);



