close all;
clear

x=[1,-1,-1,1,-1,1,1,1,-1,1];
n1=0:size(x,2)-1;

%from n=-2 start
p=[1,-1,-1];
n2=-2:(-2+size(p,2)-1);

res=conv(x,p,'full');
n3=min(n1) : max(n1)+size(n2,2)-1;
% select the end of pattern
% figure;stem(n3,res)
% select the middle of pattern
% figure;stem(n3-1,res);

% A=imread('./findsmiley.jpg');
A=imread('./findsmiley_teacherGiven.jpg');
A=double(A)/255;
A=im2bw(A,graythresh(A));
A=A-1/2;
A=A*2;
B=not([     0,0,0,0,0,0,0;
    0,1,1,1,1,1,0;
    0,1,0,1,0,1,0;
    0,1,1,0,1,1,0;
    0,1,1,1,1,1,0;
    0,1,0,0,0,1,0;
    0,1,1,1,1,1,0;
    0,0,0,0,0,0,0;
    ]);
% add a NOT to compensate mistake!
% In fact, white--1--255; black --0;
imshow(B);
B=B-1/2;
B=B*225/2;
B=rot90(B,2);

C=conv2(A,B);

[maxval,I]=max(C(:));
[row,col]=find(C==maxval);

row=row-4
col=col-3

test=A(row-3:row+4,col-3:col+3);
figure,imshow(test);
imcrop(A,[row-10,col-10,20,21])


