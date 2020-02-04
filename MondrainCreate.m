clc
clear

%% code to make mondrian figures

fignum = 10; % number of figs to generate
Msize = [500,500];  % figure dimensions
psize = [50,40]; % size of patches
marg  = max(psize); % maximum size of patches
pnum  = 2000;  % number of patches in the given area


for i = 1 : fignum
    pcenter = ceil(rand(pnum,2)*Msize(1));
    p = round(rand(1,pnum)*(psize(2)-psize(1)+psize(1))/2);
    color = round(rand(pnum*1.2,3));
    ind = find(sum(color,2)==0);
    color(ind,:) = [];
    a = zeros(Msize(1)+marg,Msize(2)+marg);
    for n = 1:pnum
        c = pcenter(n,:);
        for m = 1:3
            a(c(1)-p(n)+marg/2:c(1)+p(n)+marg/2,c(2)-p(n)+marg/2:c(2)+p(n)+marg/2,m) = color(n,m);
        end
    end
    center0 = size(a)/2;
    center0(3) = [];
    lu = center0-Msize/2;
    rd = center0+Msize/2;
    b = a(lu(1):rd(1),lu(2):rd(2),:);
    imwrite(b,[num2str(i),'.png']); % save figures
end
