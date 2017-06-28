clc;
clear all;

FCMs = 6;

for k = 1:FCMs 
    
    ifilename = ['../Questionnaires/correl_fcm',num2str(k),'.csv'];
    ofilename = ['../Questionnaires/correlresults_fcm',num2str(k),'.csv'];
      
    Correl.(num2str(k)) = csvread(ifilename);

    [n,m] = size(Correl.(num2str(k)));

    Res.(num2str(k)) = zeros(m,1);

    for i = 1:m
      Res.(num2str(k))(i,1) = corr(Correl.(num2str(k))(:,i),Correl.(num2str(1))(:,11));
    end
    csvwrite(ofilename,Res.(num2str(k))(:,1)');
end 


  
Res

return
