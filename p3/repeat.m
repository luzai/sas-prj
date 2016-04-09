function [out]=repeat(Sound,N)

out=[];
if size(Sound,1) ~=1 
    Sound = Sound';
end
if N==0
    disp('Warning: The Output is Empty!');
elseif N<0;
    disp('Error: N<0 is not permitted！');
end
for i=1:N
    out =[out Sound] ;
end