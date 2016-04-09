function out=mixer(x,y)

nx=size(x,2);
ny=size(y,2);

if(ny>nx)
    y = resample(y, nx,ny);
    n=nx;
else
    x = resample(x,ny,nx);
    n=ny;
end

out = x + y ;

slim = [-max(out) max(out)];
% Scale the data so that the limits in
% SLIM are scaled to the range [-1 +1]

dslim=diff(slim);
if dslim==0,
    % Protect against divide-by-zero errors:
    out = zeros(n);
else
	out = (out-slim(1))/dslim*2-1;
end