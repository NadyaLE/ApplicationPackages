f = figure ();
as = f.axes_size; 
x1Input0=uicontrol(f,"style","edit","string","2",'position',[5 as(2)-40 30 30]);
x1Text0=uicontrol(f,"style","text","string","X+","position",[35 as(2)-40 30 30]);
y1Input1=uicontrol(f,"style","edit","string","1",'position',[65 as(2)-40 30 30]);
y1Text1=uicontrol(f,"style","text","string","Y+","position",[95 as(2)-40 30 30]);
z1Input2=uicontrol(f,"style","edit","string","3",'position',[125 as(2)-40 30 30]);
z1Text2=uicontrol(f,"style","text","string","Z=","position",[155 as(2)-40 30 30]);
b1Input2=uicontrol(f,"style","edit","string","6",'position',[185 as(2)-40 30 30]);

x2Input0=uicontrol(f,"style","edit","string","8",'position',[5 as(2)-70 30 30]);
x2Text0=uicontrol(f,"style","text","string","X+","position",[35 as(2)-70 30 30]);
y2Input1=uicontrol(f,"style","edit","string","6",'position',[65 as(2)-70 30 30]);
y2Text1=uicontrol(f,"style","text","string","Y+","position",[95 as(2)-70 30 30]);
z2Input2=uicontrol(f,"style","edit","string","7",'position',[125 as(2)-70 30 30]);
z2Text2=uicontrol(f,"style","text","string","Z=","position",[155 as(2)-70 30 30]);
b2Input2=uicontrol(f,"style","edit","string","10",'position',[185 as(2)-70 30 30]);

x3Input0=uicontrol(f,"style","edit","string","5",'position',[5 as(2)-100 30 30]);
x3Text0=uicontrol(f,"style","text","string","X+","position",[35 as(2)-100 30 30]);
y3Input1=uicontrol(f,"style","edit","string","0",'position',[65 as(2)-100 30 30]);
y3Text1=uicontrol(f,"style","text","string","Y+","position",[95 as(2)-100 30 30]);
z3Input2=uicontrol(f,"style","edit","string","8",'position',[125 as(2)-100 30 30]);
z3Text2=uicontrol(f,"style","text","string","Z=","position",[155 as(2)-100 30 30]);
b3Input2=uicontrol(f,"style","edit","string","3",'position',[185 as(2)-100 30 30]);

solveText1=uicontrol(f,"style","text","string","",'position',[276 as(2)-40 70 30]);
solveText2=uicontrol(f,"style","text","string","",'position',[276 as(2)-70 70 30]);
solveText3=uicontrol(f,"style","text","string","",'position',[276 as(2)-100 70 30]);

solveButton=uicontrol(f,"style","pushbutton","string","Solve","Callback","Solve",'position',[215 as(2)-70 60 50]);


function Solve()
    x1=evstr(get(x1Input0,'string'));
    x2=evstr(get(x2Input0,'string'));
    x3=evstr(get(x3Input0,'string'));
    
    y1=evstr(get(y1Input1,'string'));
    y2=evstr(get(y2Input1,'string'));
    y3=evstr(get(y3Input1,'string'));
    
    z1=evstr(get(z1Input2,'string'));
    z2=evstr(get(z2Input2,'string'));
    z3=evstr(get(z3Input2,'string'));
    
    b1=evstr(get(b1Input2,'string'));
    b2=evstr(get(b2Input2,'string'));
    b3=evstr(get(b3Input2,'string'));
    
    
    a=[x1 y1 z1;x2 y2 z2; x3 y3 z3];
    q=[b1;b2;b3]
    b=inv(a);
    c=b*q;
    set(solveText1,'string', string(c(1)));
    set(solveText2,'string', string(c(2)));
    set(solveText3,'string', string(c(3)));
endfunction

