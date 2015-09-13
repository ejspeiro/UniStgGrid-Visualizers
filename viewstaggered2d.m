% FUNCTION_NAME - viewstaggered2d
%
% Used to visualize a 2D set of cells and their centers, i.e. a logically-
% rectangular 2D uniform staggered grid.
%
% Syntax:  viewstaggered2d(xnodes, ynodes, xcenters, ycenters, plotcenters)
%
% Inputs:
%    xnodes - Collection of x coordinates of the nodes.
%    ynodes - Collection of y coordinates of the nodes.
%    xcenters - Collection of x coordinates of the cell-centers.
%    ycenters - Collection of y coordinates of the cell-centers.
%    plotcenters - Should I plot the centers?
%
% Outputs:
%    None.
%
% Example: Let [xa, xb] X [ya, yb] be your space to discretize, with m and n
% cells per direction:
%   
% deltax = abs(xb - xa)/m;
% deltay = abs(yb - ya)/n;
% 
% xnodes = [xa:deltax:xb];
% ynodes = [ya:deltay:yb];
% xcenters = [(xa + deltax/2):deltax:(xb - deltax/2)];
% ycenters = [(ya + deltay/2):deltay:(yb - deltay/2)];
%   
% viewstaggered2d(xnodes, ynodes, xcenters, ycenters,true);
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
% June 2014; Last revision: 19-December-2014.

%------------- BEGIN CODE --------------

function viewstaggered2d(xnodes, ynodes, xcenters, ycenters, plotcenters)

  if (length(xnodes) <= 0)
    error('Invalid collection of nodes in the x direction');
  elseif (length(ynodes) <= 0)
    error('Invalid collection of nodes in the y direction');
  elseif (length(xcenters) <= 0)
    error('Invalid collection of centers in the x direction');
  elseif (length(ycenters) <= 0)
    error('Invalid collection of centers in the y direction');
  end

  % Plot the nodes along the x direction:
  plot([xnodes(1),xnodes(1)],[ynodes(1),ynodes(length(ynodes))],'k',...
    'LineWidth',3);
  hold on;
  for i = 2 : (length(xnodes))
    plot([xnodes(i),xnodes(i)],[ynodes(1),ynodes(length(ynodes))],'k',...
      'LineWidth',2);
  end

  % Plot the nodes along the y direction:
  for i = 1 : (length(ynodes) - 1)
    plot(get(gca,'xlim'), [ynodes(i) ynodes(i)],'k','LineWidth',2);
  end
  plot(get(gca,'xlim'),...
    [ynodes(length(ynodes)) ynodes(length(ynodes))],'k','LineWidth',3);
  
  set(gca,'XTick',linspace(xnodes(1),xnodes(length(xnodes)),...
    length(xnodes) + length(xcenters)));
  set(gca,'YTick',linspace(ynodes(1),ynodes(length(ynodes)),...
    length(ynodes) + length(ycenters)));

  % Plot the centers:
  if (plotcenters)
    for i = 1 : (length(xcenters))
      scatter(xcenters(i).*ones(length(ycenters),1),ycenters,'b','fill');
    end
  end
  hold off;
end

%------------- END OF CODE --------------
