clear all;

[fname path]=uigetfile('.jpg','open a face as input for training');
fname=strcat(path,fname);
im=imread(fname);
%im=rgb2gray(im);

imshow(im);
title('input face');

c=input('Enter the class');

%Feature Extraction
F=demo(im);

midleye = F(1,:);
midreye = F(2,:);
mouth = F(3,:);
nose = F(4,:);


eyecntr = [(midreye(1)-midleye(1))/2 (midreye(2)-midleye(2))/2];


D1 = sqrt((midleye(1)-eyecntr(1)).^2 + (midleye(2)-eyecntr(2)).^2);

D2 = sqrt((midreye(1)-eyecntr(1)).^2 + (midreye(2)-eyecntr(2)).^2);

D3 = sqrt((midleye(1)-mouth(1)).^2 + (midleye(2)-mouth(2)).^2);

D4 = sqrt((midreye(1)-mouth(1)).^2 + (midreye(2)-mouth(2)).^2);

D5 = sqrt((midleye(1)-nose(1)).^2 + (midleye(2)-nose(2)).^2);

D6 = sqrt((midreye(1)-nose(1)).^2 + (midreye(2)-nose(2)).^2);

D7 = sqrt((mouth(1)-nose(1)).^2 + (mouth(2)-nose(2)).^2);



D3_cntr = [midleye(1)+(mouth(1)-midleye(1))/2 midleye(2)+(mouth(2)-midleye(2))/2];

D4_cntr = [mouth(1)+(midreye(1)-mouth(1))/2 midreye(2)+(mouth(2)-midreye(2))/2];

D5_cntr = [midleye(2)+(nose(1)-midleye(1))/2 midleye(2)+(nose(2)-midleye(2))/2];

D6_cntr = [nose(1)+(midreye(1)-nose(1))/2 midreye(2)+(nose(2)-midreye(2))/2];

if(nose(1)<mouth(1))
    D7_cntr = [nose(1)+(mouth(1)-nose(1))/2 nose(2)+(mouth(2)-nose(2))/2];
else
    D7_cntr = [mouth(1)+(nose(1)-mouth(1))/2 nose(2)+(mouth(2)-nose(2))/2];
end



M1 = sqrt((eyecntr(1)-D5_cntr(1)).^2 + (eyecntr(2)-D5_cntr(2)).^2);

M2 = sqrt((eyecntr(1)-D6_cntr(1)).^2 + (eyecntr(2)-D6_cntr(2)).^2);

M3 = sqrt((D3_cntr(1)-D7_cntr(1)).^2 + (D3_cntr(2)-D7_cntr(2)).^2);

M4 = sqrt((D4_cntr(1)-D7_cntr(1)).^2 + (D4_cntr(2)-D7_cntr(2)).^2);

M5 = sqrt((D3_cntr(1)-D5_cntr(1)).^2 + (D3_cntr(2)-D5_cntr(2)).^2);

M6 = sqrt((D4_cntr(1)-D6_cntr(1)).^2 + (D4_cntr(2)-D6_cntr(2)).^2);


F1 = (D1+D2)/D3;

F2 = (D1+D2)/D4;

F3 = (D1+D2)/D5;

F4 = (D1+D2)/D6;

F5 = (D1+D2)/D7;

F6 = D3/D4;

F7 = D5/D6;

F8 = D1/(M1+M3+M5);

F9 = D2/(M2+M4+M6);

F10 = M1/M2;

F11 = M3/M4;

F12 = M5/M6;

F13 = (M1+M3+M5)/(M2+M4+M6);

F14 = (M1+M2)/(M5+M6);

F15 = (M1+M2)/(M3+M4);



try 
    load db_tst_nw;
    F=[F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 F13 F14 F15 c];
    db=[db;F];
    save db_tst_nw.mat db;
    
catch
    db=[F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 F13 F14 F15 c];
    save db_tst_nw.mat db;
end