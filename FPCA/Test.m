clear
clc

xl = randn(500, 10);
xr = randn(500, 10);
xs = xl * xr';
b = reshape(xs, 500 * 500, 1);
b([2, 3, 4])

