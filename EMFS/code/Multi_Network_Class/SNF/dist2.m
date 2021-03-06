function n2 = dist2(x, c)
%DIST2	Calculates squared distance between two sets of points.
%
%	Description
%	D = DIST2(X, C) takes two matrices of vectors and calculates the
%	squared Euclidean distance between them.  Both matrices must be of
%	the same column dimension.  If X has M rows and N columns, and C has
%	L rows and N columns, then the result has M rows and L columns.  The
%	I, Jth entry is the  squared distance from the Ith row of X to the
%	Jth row of C.
%
%	See also
%	GMMACTIV, KMEANS, RBFFWD
%

%	Copyright (c) Christopher M Bishop, Ian T Nabney (1996, 1997)

[ndata, dimx] = size(x);  %ndata=rows of x,dimx=columns of x
[ncentres, dimc] = size(c);
if dimx ~= dimc      %不等于
	error('Data dimension does not match dimension of centres')
end

n2 = (ones(ncentres, 1) * sum((x.^2)', 1))' + ...    %ncentres rows,1 column,值为1的矩阵；x矩阵求平方按列求和
  		ones(ndata, 1) * sum((c.^2)',1) - ...           %ones(n)产生一个n*n的全1矩阵；ones(m,n)产生一个m*n的全1矩阵
  		2.*(x*(c'));
