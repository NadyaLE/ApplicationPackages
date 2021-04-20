function [result] = countLang (X, currElem, pLag)
    result = 1;
    for i=1:length(X)
        if currElem <> i then
            result = result * (pLag - X(i)) / (X(currElem) - X(i));
        end
    end
endfunction

function [result] = interL (Y, arrLag)
    result = 0;
    for i = 1:length(arrLag)
        result = result + Y(i) * arrLag(i); 
    end
endfunction

X = [3,3.5,4,4.5];
Y = [1.0986123,1.2527630,1.3862944,1.5040774];
Var = 3.2;
arrLag = zeros(1, 4);
pLag = poly(0, 'x');

for i = 1:length(X)
    arrLag(i) = countLang(X, i, pLag);
end

resultInterplnLagrangeFunc = interL (Y, arrLag);
disp(resultInterplnLagrangeFunc);
printf("\n");

arrLag = zeros(1, 4);
for i = 1:length(X)
    arrLag(i) = countLang (X, i, Var);
    if (i == 1) then printf("\n");
    end
end

printf("\n");
resultInterplnLagrange = interL (Y, arrLag);
printf("result = %s, при x = %s", string(resultInterplnLagrange), string(Var));



lagstr ="y=" + pol2str(resultInterplnLagrangeFunc)
f = figure()

printf("\n%s", lagstr)
deff("[y]=f(x)",lagstr);
fplot2d(2.5:0.1:5,f,rect=[2.5, -5, 5, 5],axesflag=5);
plot2d(X, Y,-2)
