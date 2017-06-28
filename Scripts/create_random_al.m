
FCMs = 6;
Runs = 20;

for j = 1:Runs
for k = 1:FCMs 
    
    ofilename = ['../Questionnaires/als/al_fcm',num2str(k),'_',num2str(j),'.csv'];
      
		ifilename = ['../Questionnaires/ww_fcm',num2str(k),'.csv'];
      
    WW.(num2str(k)) = csvread(ifilename);
    
    [n, m] = size(WW.(num2str(k)));
			
    AL.(num2str(k))(:,1) = rand(1,n);
	
		if k==1
			AL.(num2str(k))(11,1) = 0;
		else
			AL.(num2str(k))(1,1) = 0;
		end

		csvwrite(ofilename,AL.(num2str(k))(:,1));
end
end  