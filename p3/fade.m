function [ y, flag ] = fade(x, level)
%
% fade(X): this function fades the audio vector X.
%
% fade(X, LEVEL): fades the audio vector X from 100% down to LEVEL.  
%                 fade(X) = fade(X, 0).
%                 LEVEL must be >= 0 and <= 1
%
% Examples:  
% Y = fade(X);
% Y = face(X, LEVEL); 
flag=1;y=0;
% create the ramp vector
if nargin ==1
	level=0;
elseif level>1 || level<0
	disp('Error: level! Error Ignored.');
    flag=0;
	return ;
end
t = linspace(1, level, length(x));
if (size(x,1)~=size(t,1))
    x=x';
end
% multiply the audio vector with the ramp vector to fade
y = t .* x;
