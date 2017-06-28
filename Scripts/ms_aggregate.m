clc;
clear;
disp('        **************************************************************')
disp('        *               Microservices Migration Study                *')
disp('        **************************************************************')
disp('        **************************************************************')
disp(' ')
%disp('Press any key to continue...')
%pause;

% Get Weights matrix WW[nxm] from a csv file
% Weight values should be withffin range [-1 1]

inf1 = '../Questionnaires/ww_fcm6_efi.csv';
inf2 = '../Questionnaires/ww_fcm6_Giovanni.csv';
inf3 = '../Questionnaires/ww_fcm6_Luca.csv';
inf4 = '../Questionnaires/ww_fcm6_Marco.csv';
inf5 = '../Questionnaires/ww_fcm6_Martin.csv';

out = '../Questionnaires/ww_fcm6.csv';

ww1 = csvread(inf1);
ww2 = csvread(inf2);
ww3 = csvread(inf3);
ww4 = csvread(inf4);
ww5 = csvread(inf5);

[n, m] = size(ww1);
wwFinal = zeros(n,m);

for i=1:n
  for j=1:m
    nSum = 0;
    nCounter = 0;
    if (ww1(i,j)~=-1)
      nSum = nSum+ww1(i,j);
      nCounter = nCounter + 1;
    end
    if (ww2(i,j)~=-1)
      nSum = nSum+ww2(i,j);
      nCounter = nCounter + 1;
    end
    if (ww3(i,j)~=-1)
      nSum = nSum+ww3(i,j);
      nCounter = nCounter + 1;
    end
    if (ww4(i,j)~=-1)
      nSum = nSum+ww4(i,j);
      nCounter = nCounter + 1;
    end
    if (ww5(i,j)~=-1)
      nSum = nSum+ww5(i,j);
      nCounter = nCounter + 1;
    end
    nAverage = nSum/nCounter;
    
    wwFinal(i,j) = nAverage;
    
   end
end

csvwrite(out,wwFinal);
      
