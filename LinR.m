clc
clear
clf

load carsmall

ds = dataset(MPG,Weight);
ds.Year = nominal(Model_Year);

mdl = fitlm(ds,'MPG ~ Year + Weight^2')