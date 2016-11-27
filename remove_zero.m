%%
%% "in" is the output of the Zig-Zag encoder
%% this function is aim to remove the extra zero
%%
function [data]=remove_zero(in)
w=0;
u=64;
while u~=0
    if in(u)~=0
        w=u;
        break;
    end
    u=u-1;
end;
if w==0
    w=1;
end

for i= 1:w
    data(i)=in(i);
end
