% FUNCTION_NAME - viewstaggered3d
%
% Used to visualize a 3D set of cells and their centers, i.e. a logically-
% rectangular 3D uniform staggered grid.
%
% Syntax:  viewstaggered3d(xnodes, ynodes, znodes, deltax, deltay, deltaz,
%                          m, n, o, true)
%
% Inputs:
%    xnodes - Collection of x coordinates of the nodes.
%    ynodes - Collection of y coordinates of the nodes.
%    znodes - Collection of z coordinates of the nodes.
%    m - Number of cells on the x direction.
%    n - Number of cells on the y direction.
%    o - Number of cells on the z direction.
%    plotcenters - Should I plot the centers?
%
% Outputs:
%    None.
%
% Example: Let [xa,xb] X [ya,yb] X [za,zb] be your space to discretize, with m,
% n, and o cells per direction:
%   
% deltax = abs(xb - xa)/m;
% deltay = abs(yb - ya)/n;
% deltaz = abs(zb - za)/o;
% 
% xnodes = [xa:deltax:xb];
% ynodes = [ya:deltay:yb];
% znodes = [za:deltaz:zb];
%   
% viewstaggered3d(xnodes, ynodes, znodes, deltax, deltay, deltaz, m, n, o,
% true);
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
% December 2014; Last revision: 19-December-2014.

%------------- BEGIN CODE --------------

function viewstaggered3d(xnodes, ynodes, znodes,...
  deltax, deltay, deltaz, m, n, o,plotcenters)

  if (length(xnodes) <= 0)
    error('Invalid collection of nodes in the x direction');
  elseif (length(ynodes) <= 0)
    error('Invalid collection of nodes in the y direction');
  elseif (length(znodes) <= 0)
    error('Invalid collection of centers in the x direction');
  end
  
  if (m <= 0)
    error('Invalid 4th parameter');
  elseif (n <= 0)
    error('Invalid 5th parameter');
  elseif (o <= 0)
    error('Invalid 6th parameter');
  end

  for i = 1:m
    for j = 1:n
      for k = 1:o
        DrawCell(xnodes(i), ynodes(j), znodes(k), deltax, deltay, deltaz,...
          plotcenters);
      end
    end
  end
  set(gca,'DataAspectRatio',...
    [xnodes(length(xnodes)) ynodes(length(ynodes)) znodes(length(znodes))]);
end

function DrawCell(x,y,z,deltax,deltay,deltaz,plotcenters)

  xp = x + deltax;
  yp = y + deltay;
  zp = z + deltaz;
  v = [x y z; xp y z; xp yp z; x yp z; x y zp; xp y zp; xp yp zp; x yp zp];
  f = [1 2 3 4; 1 4 8 5; 4 3 7 8; 1 2 6 5; 2 3 7 6;];
  patch('Vertices',v,'Faces',f,'FaceAlpha',0.0);
  if (plotcenters)
    hold on;
    scatter3([x + deltax/2],[y + deltay/2],[z + deltaz/2],'.b');
    hold off;
  end
  view(3);
end

%------------- END OF CODE --------------
