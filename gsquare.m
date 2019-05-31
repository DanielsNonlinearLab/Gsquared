% G-square algorithm for force determination in photoelastic disks

function [G2, G2pic] = gsquare(pic, xlim, ylim)

pic = double(pic);
L = size(pic);
if ~exist('xlim', 'var')
    xlim = [2, L(2)-1];
end

if ~exist('ylim', 'var')
    ylim = [2, L(1)-1];
end

G2= 0;
for y = ylim(1):ylim(2)
    for x = xlim(1):xlim(2)
        g1 = pic(y, x-1) - pic(y, x+1);
        g2 = pic(y-1, x) - pic(y+1, x);
        g3 = pic(y-1, x+1) - pic(y+1, x-1);
        g4 = pic(y+1, x+1) - pic(y-1, x-1);
        G2pic(y,x) = (g1*g1/4.0 + g2*g2/4.0 + g3*g3/8.0 + g4*g4/8.0);
        G2 = G2 + (g1*g1/4.0 + g2*g2/4.0 + g3*g3/8.0 + g4*g4/8.0)/4.0;
    end
end
G2 = G2/(diff(xlim)*diff(ylim)) ;
%fprintf('average Grad square= %f\n', G2);

G2pic(1:ylim(1)-1, : ) = NaN;
G2pic(ylim(2)+1:L(1), :) = NaN;
G2pic(:, 1:xlim(1)-1) = NaN;
G2pic(:, xlim(2)+1:L(2)) = NaN;
return;




