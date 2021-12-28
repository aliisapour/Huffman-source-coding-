close all
clear all
clc

p=100*[1/2,1/3,1/8,1/48,1/96,1/96];
%if two elements of p be equal, we make a little difference between either of them
for i=1:length(p)-1
    for j=1+1:length(p)
        if p(i)==p(j)
            p(i)=p(i)-0.01;
            
        end
    end
    
end
percentages=sort(p,'descend');
p=percentages;

sum_array=[];
len_p=length(p);
lengthp=[length(p)];

i=1;
b(i,:)=p ;
while (length(p)>2)
    sum=p(length(p))+p(length(p)-1);
    sum_array=[sum_array,sum] ;
    p=[p(1:length(p)-2),sum];
    p=sort(p,'descend');
    i=i+1;
    b(i,:)=[p,zeros(1,len_p-length(p))];
    w1=0;
    lengthp=[lengthp,length(p)] ;
end
lengthp
percentages
b

[size_b_y,size_b_x]=size(b);
scale=0;

temp=[b(1,:)]
sum_array=[0,sum_array]

% for example ,But we can change it
%if we want to use (for loop), value of e should be 1
e=1;

 %%%for final_i=1:length(percentages)
code=[];
for j=1:size_b_y
    scale=0;
    for i1=1:size_b_x
        
        if (b(j,i1)==temp(e))
            scale=b(j,i1);
        end
        if (scale==0 & b(j,i1)==sum_array(j))
            scale=b(j,i1);
        end
    end
    scale
    if scale==b(j,lengthp(j))
        code=[code,'1'];
    elseif scale==b(j,lengthp(j)-1)
        code=[code,'0'];
        
    end
end
code


temp_e=temp(e)
code=fliplr(code)

% e=e+1;
% end
