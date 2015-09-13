% FUNCTION_NAME - viewstaggered1d
%
% Used to visualize a 1D set of cells and their centers, i.e. a logically-
% rectangular 1D uniform staggered grid.
%
% Syntax:  viewstaggered1d(xnodes, xcenters, deltax, plotcenters);
%
% Inputs:
%    xnodes - Collection of x coordinates of the nodes.
%    xcenters - Collection of x coordinates of the cell-centers.
%    deltax - Length of a cell.
%    plotcenters - Should I plot the centers?
%
% Outputs:
%    None.
%
% Example: Let [xa, xb] be your space to discretize, with m cells.
%   
% deltax = abs(xb - xa)/m;
% 
% xnodes = [xa:deltax:xb];
% xcenters = [(xa + deltax/2):deltax:(xb - deltax/2)];
%   
% viewstaggered1d(xnodes, xcenters, deltax, true);
%
% Other m-files required: None.
% Subfunctions: None.
% MAT-files required: None.
%
% See also: plot, hold, length, get, scatter, ones
%
% Author: Eduardo Sanchez.
% Computational Science Research Center.
% 5500 Campanile Drive, San Diego State University.
% Email: esanchez at mail dot sdsu dot edu
% Website: http://www-rohan.sdsu.edu/~sanche94/
% December 2014; Last revision: 21-December-2014.

%------------- BEGIN CODE --------------

function viewstaggered1d(xnodes,xcenters,deltax,plotcenters)

  if (length(xnodes) <= 0)
    error('Invalid collection of nodes in the x direction');
  elseif (length(xcenters) <= 0)
    error('Invalid collection of centers in the x direction');
  elseif (deltax <= 0)
    error('Invalid cell width');
  end
  
  % Draw the line for the space:
  DrawLine([0 0], [xnodes(length(xnodes)),0.0])
  hold on;
  for i = 1:length(xnodes) - 1
      DrawBoldfacedLine([xnodes(i) -0.1], [xnodes(i) 0.1]);
  end
  if (plotcenters)
    scatter(xcenters,zeros(length(xcenters),1),'b','fill');
  end
  hold off;
  axis([xnodes(1) xnodes(length(xnodes)) -0.5 0.5]);
  set(gca, 'XTick',xnodes(1):deltax/2:xnodes(length(xnodes)));
  set(gca, 'YTickLabel',[]);
  set(gcf, 'Position', [300 300 1000 100]);
end

function [] = DrawLine(p1, p2)

  theta = atan2( p2(2) - p1(2), p2(1) - p1(1));
  r = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2);

  line = 0:0.01: r;
  x = p1(1) + line*cos(theta);
  y = p1(2) + line*sin(theta);

  plot(x, y,'k')
end

function [] = DrawBoldfacedLine(p1, p2)

  theta = atan2( p2(2) - p1(2), p2(1) - p1(1));
  r = sqrt( (p2(1) - p1(1))^2 + (p2(2) - p1(2))^2);

  line = 0:0.01: r;
  x = p1(1) + line*cos(theta);
  y = p1(2) + line*sin(theta);

  plot(x, y,'k','LineWidth',2 );
end

%------------- END OF CODE --------------
