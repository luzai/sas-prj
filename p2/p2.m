
close all;
clear

x=[1,-1,-1,1,-1,1,1,1,-1,1];
n1=0:size(x,2)-1;

%from n=-2 start 
p=[1,-1,-1];
n2=-2:(-2+size(p,2)-1);

res=conv(x,p,'full');
n3=min(n1) : max(n1)+size(n2,2)-1;
%select the end of pattern
%figure;stem(n3,res)
%select the middle of pattern
%figure;stem(n3-1,res);

A=imread('./findsmiley.jpg');
%A=imread('./findsmiley_t.jpg');
A=double(A);
A=A-255/2;

B=not([     0,0,0,0,0,0,0;
       0,1,1,1,1,1,0;
       0,1,0,1,0,1,0;
       0,1,1,0,1,1,0;
       0,1,1,1,1,1,0;
       0,1,0,0,0,1,0;
       0,1,1,1,1,1,0;
       0,0,0,0,0,0,0;
]);% white --1; black --0;
%imshow(B);
B=B-1/2;
B=B';
C=conv2(A,B);

[maxval,I]=max(C(:));
[row,col]=find(C==maxval);

row=row-3
col=col-4





