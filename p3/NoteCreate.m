function [out]=NoteCreate(frq,dur,type)
if strcmp(type,'sin')
    out =  sin(2*pi* [1:dur]/8000 * frq );
elseif strcmp(type, 'square')
    out =  (2*pi* [1:dur]/8000 * frq );
elseif strcmp(type,'sawtooth')
    out =sawtooth(2*pi* [1:dur]/8000 * frq );
end