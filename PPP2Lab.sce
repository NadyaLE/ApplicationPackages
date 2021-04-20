f=figure();
as=f.axes_size;
a1=uicontrol(f, "style", "text", "string", "   A=", "position", [160 as(2)-50 40 40], "fontsize",12,"foregroundColor",[1 1 1],"backgroundColor",[0 0 1]);
a=uicontrol(f, "style", "edit", "string", "2.2", "position", [200 as(2)-50 40 40], "fontsize",12);
b1=uicontrol(f, "style", "text", "string", "   B=", "position", [240 as(2)-50 40 40], "fontsize",12,"foregroundColor",[1 1 1],"backgroundColor",[0 0 1]);
exwarning=uicontrol(f, "style", "text", "string", "   A<B", "position", [320 as(2)-50 50 40], "fontsize",12,"foregroundColor",[1 1 1],"backgroundColor",[0 0 0]);b=uicontrol(f, "style", "edit", "string", "3.2", "position", [280 as(2)-50 40 40], "fontsize",12);
button=uicontrol(f, "style", "pushbutton", "string", "Draw",'callback','Draw', "position", [370 as(2)-50 70 40], "fontsize",14,"foregroundColor",[0 0 0],"backgroundColor",[1 1 0]);

function Draw()
    deff('[y]=l(x)','y=cos(x)-x+4');
    deff('[y]=z(x)','y=-(sin(x)+1)');
    deff('[y]=t(x)','y=-cos(x)');
    inputA = evstr(get(a,'string'));
    inputB = evstr(get(b,'string'));
    x=[inputA:0.1:inputB];
    r=[inputA,-5,inputB,5];
    fplot2d(x,l,rect=r,axesflag=5, style=2);
    fplot2d(x,z,rect=r,axesflag=5, style=5);
    fplot2d(x,t,rect=r,axesflag=5, style=13);
    legend('cos(x)-x+4','-(sin(x)+1)','-cos(x)',2);
    k=0;
    dif=abs(inputB-inputA);
    fd=mopen("C:\Users\student\Desktop\res.txt","w");
    mfprintf(fd,"k    ak       bk      abs      f(ak)    f(bk)    f''(bk)\n");
        while dif>=0.00001,           
        fa=cos(inputA)-inputA+4;
        fb=cos(inputB)-inputB+4;
        fderivativeb=-(sin(inputB)+1);
        mfprintf(fd,"%i %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f\n",k,inputA,inputB,dif,fa,fb,fderivativeb);
        inputA=inputA-((1/(-(sin(inputA)+1)))*(cos(inputA)-inputA+4));
        inputB=inputB-(((inputB-inputA)/((cos(inputB)-inputB+4)-(cos(inputA)-inputA+4)))*(cos(inputB)-inputB+4));
        dif=abs(inputB-inputA);
        k=k+1;  
    end
    mfprintf(fd,"%i %8.5f %8.5f %8.5f %8.5f %8.5f %8.5f\n",k,inputA,inputB,dif,fa,fb,fderivativeb);
    mclose(fd);
endfunction


