function [Tx] = replace(Tlabelsx,p)
  for k=1:p
    if Tlabelsx(k,1)==0
      Tx(k,:)=[1 0 0 0 0 0 0 0 0 0];
    elseif Tlabelsx(k,1)==1
      Tx(k,:)=[0 1 0 0 0 0 0 0 0 0];
    elseif Tlabelsx(k,1)==2
      Tx(k,:)=[0 0 1 0 0 0 0 0 0 0];
    elseif Tlabelsx(k,1)==3
      Tx(k,:)=[0 0 0 1 0 0 0 0 0 0];
    elseif Tlabelsx(k,1)==4
      Tx(k,:)=[0 0 0 0 1 0 0 0 0 0];
    elseif Tlabelsx(k,1)==5
      Tx(k,:)=[0 0 0 0 0 1 0 0 0 0];
    elseif Tlabelsx(k,1)==6
      Tx(k,:)=[0 0 0 0 0 0 1 0 0 0];
    elseif Tlabelsx(k,1)==7
      Tx(k,:)=[0 0 0 0 0 0 0 1 0 0];
    elseif Tlabelsx(k,1)==8
      Tx(k,:)=[0 0 0 0 0 0 0 0 1 0];
    elseif Tlabelsx(k,1)==9
      Tx(k,:)=[0 0 0 0 0 0 0 0 0 1];
    end
  end
end
