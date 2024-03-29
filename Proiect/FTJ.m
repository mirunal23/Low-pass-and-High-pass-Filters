function FTJ(R, C, min, max,tip,A)

Fig=figure('Name','Lupu Miruna Proiect GAC',... 
           'Units','normalized',...
           'Position',[0.1 0.1 0.8 0.8],...
           'NumberTitle','off',...
           'Color','#E2F1E4');

%------Chenar unde introducem datele de intare----
uibuttongroup('Visible','on',...
              'BackgroundColor','#A9CBB8',...
              'Title','Datele de intrare','Fontangle','italic',...
              'FontSize',10,...
              'Fontname', 'Times new roman',...
              'TitlePosition','centertop',...
              'Tag','radiobutton',...
              'Position',[0.009 0.68 0.22 0.3]);
%-----------Date de intrare---------------
uicontrol('Style','text',... 
          'Units','normalized',...
          'Position',[0.03 0.87 0.13 .03],...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontSize',13,...
          'String','Rezistența [Ω]: ');

uicontrol('Style','Edit',...
          'Units','Normalized',...
          'Position',[0.12 0.87 0.09 .03],...
          'BackgroundColor','#A9CBB8',...
          'FontSize',13,...
          'ForegroundColor','w',...
          'String',R,...
          'Callback','R=str2num(get(gco,''String''));close;FTJ(R, C, min, max,tip,A)');
%-------------------------------------

uicontrol('Style','text',... 
          'Units','normalized',...
          'Position',[0.03 0.82 0.13 .03],...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontSize',13,...
          'String','Capacitate [F]: ');

uicontrol('Style','Edit',...
          'Units','Normalized',...
          'Position',[0.12 0.82 0.09 .03],...
          'BackgroundColor','#A9CBB8',...
          'FontSize',13,...
          'ForegroundColor','w',...
          'String',C,...
          'Callback','C = str2num(get(gco,''String''));close;FTJ(R, C, min, max,tip,A)');


%--------Chenar cu rezultatul calculelor--------------
uibuttongroup('Visible','on',...
              'BackgroundColor','#A9CBB8',...
              'Title','Calcule','Fontangle','italic',...
              'FontSize',10,...
              'Fontname', 'Times new roman',...
              'TitlePosition','centertop',...
              'Tag','radiobutton',...
              'Position',[0.23 0.68 0.22 0.3]);

%----------Buton back------------
uicontrol('Style','pushbutton',... 
          'Units','normalized',... 
          'Position',[0.01 0.01 0.1 0.05],... 
          'FontName','Times New Roman',...
          'FontSize',15,...
          'FontWeight','bold',...
          'foregroundcolor','black',... 
          'String','Back',...
          'Callback','filtre');


%------Buton de exit--------

uicontrol('Style', 'pushbutton', ...
          'Units', 'normalized',...
          'Position', [0.88 0.01 0.1 0.05],...
          'Fontname', 'Times New Roman',...
          'FontWeight','bold',...
          'FontSize',10,...
          'FontAngle', 'italic',...
          'Backgroundcolor','#A50505',...
          'Foregroundcolor','#EAF8FB',...
          'string' ,'EXIT',...
          'Callback', 'close');


%----Calcule-------------------

w0=1/(R*C);
f0=1/(2*pi*R*C);

uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.3 0.87 0.09 .03],...
          'FontSize',13,...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontWeight','b',...
          'String',['w0 = ',num2str(fix(w0)),' [rad/s] ']); 

uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.29 0.82 0.09 .03],...
          'FontSize',13,...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontWeight','b',...
          'String',[' f0 = ',num2str(fix(f0)),' [Hz] ']);

%------Buton PopUp---------------------

uicontrol('Style','PopupMenu',...
          'String','RC in frecventa| RC in timp','FontSize',12,...
          'Units','normalized',...
          'Position',[.009 .55 .1 .1],...
          'Fontname','TIMES NEW ROMAN',...
          'BackgroundColor','#D9E6DA',...
          'Foregroundcolor','#4B3B3B',...
          'Value',tip, ...
          'Callback','tip=get(gco,''value'');close;FTJ(R, C, min, max,tip,A)');
 %----Formulele in j pentru FTJ----
switch (tip)
   case 1
w = logspace(min,max,100);           %Valoare omega
f = w./(2*pi);                       %Valoarea frecventei
sus = w0;
jos = w0 + 1j*w;
H = abs(sus./jos);                   %Functia de transfer
gain = 20*log10(H);                  %Calculul cresterii
phase = 180/pi*(angle(sus./jos));    %Calculul fazei semnalului in grade

%------Circuit: Filtru-trece-jos-------
ho = axes( 'Units','Normalized', ...
           'Position',[0.01 0.1 0.4 0.4]);
uistack(ho,'bottom');
V=imread('ftj.jpg');
hp = imagesc(V);
colormap gray

set(ho,'handlevisibility','off', ...
       'visible','off');
set(hp,'alphadata',1);

%------------------------------------------
uicontrol('Style','text',... 
          'Units','normalized',...
          'Position',[0.03 0.77 0.13 .03],...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontSize',13,...
          'String','Min: ');

uicontrol('Style','Edit',...
          'Units','Normalized',...
          'Position',[0.12 0.77 0.09 .03],...
          'BackgroundColor','#A9CBB8',...
          'FontSize',13,...
          'ForegroundColor','w',...
          'String',min,...
          'Callback','Min=str2num(get(gco,''String''));close;FTJ(R, C, min, max,tip,A)');

%-------------------------------------
uicontrol('Style','text',... 
          'Units','normalized',...
          'Position',[0.03 0.72 0.13 .03],...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontSize',13,...
          'String','Max: ');

uicontrol('Style','Edit',...
          'Units','Normalized',...
          'Position',[0.12 0.72 0.09 .03],...
          'BackgroundColor','#A9CBB8',...
          'FontSize',13,...
          'ForegroundColor','w',...
          'String',max,...
          'Callback','Max = str2num(get(gco,''String''));close;FTJ(R, C, min, max,tip, A)');

%------Caracteristica de frecventa la scara dublu logaritmica-----

subplot('Position',[0.49 0.42 0.5 0.23]);
semilogx(f, gain,'r--','LineWidth',1.5);
grid on;
title('Caracteristica de frecventa la scara dublu logaritmica','fontname','Times New Roman');
xlabel('Frecventa [Hz]','fontweight', 'bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',10);
ylabel('Castigul [dB] ','fontweight', 'bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',12);

%-------Caracteristica de faza la scara semilogaritmica-------
subplot('Position',[0.49 0.1 0.5 0.23]);
semilogx(f,phase, 'c','LineWidth',1.5);
grid on;
title('Caracteristica de faza la scara semilogaritmica','fontname','Times New Roman');
xlabel('Frecventa [Hz]','fontweight', 'bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',10);
ylabel('Faza\phi [°C]','fontweight', 'bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',12);

%-------Caracteristica de transfer-------
subplot('Position', [0.49 0.74 0.5 0.23]);
semilogx(f,H,'m','LineWidth',1.5);
grid on;
title('Caracteristica de transfer','fontname','Times New Roman');
xlabel('Frecventa [ Hz ]','fontweight','bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',10);
ylabel('Functia de transfer [V] ','fontweight','bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',12); 

case 2

tau=R*C;                 %Valoare lui τ
t = 0: tau/10 : 5*tau;   %Durata de timp 
V= A*(1-exp(-t/tau));    %Tensiunea de iesire
I= (A./R)*exp(-t/tau);   %Curentul care trece prin circuit

%---Ambele filtre---------------
ho = axes( 'Units','Normalized', ...
           'Position',[0.01 0.21 0.43 0.32]);
uistack(ho,'bottom');
g=imread('filtree.jpg');
hp = imagesc(g);
colormap gray

set(ho,'handlevisibility','off', ...
       'visible','off');
set(hp,'alphadata',1);

%--------------------------------------------
uicontrol('Style','text',... 
          'Units','normalized',...
          'Position',[0.53 0.87 0.6 .03],...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'Fontangle','italic',...
          'Fontweight','bold',...
          'BackgroundColor','#E2F1E4',...
          'Foregroundcolor','#4B3B3B',...
          'FontSize',13,...
          'String','Comportarea in timp a unui circuit RC ( atat pentru FTJ, cat si pentru FTS): ');


uicontrol('Style','text',... 
          'Units','normalized',...
          'Position',[0.03 0.77 0.13 .03],...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontSize',13,...
          'String','Amplitude [V]: ');

uicontrol('Style','Edit',...
          'Units','Normalized',...
          'Position',[0.12 0.77 0.09 .03],...
          'BackgroundColor','#A9CBB8',...
          'FontSize',13,...
          'ForegroundColor','w',...
          'String',A,...
          'Callback','A=str2num(get(gco,''String''));close;FTJ(R, C, min, max,tip,A)');

uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.3 0.87 0.1 .03],...
          'FontSize',13,...
          'HorizontalAlignment', 'left',...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontWeight','b',...
          'String',['Vout=',num2str(V),'[V]']); 

uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.28 0.82 0.1 .03],...
          'FontSize',13,...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontWeight','b',...
          'String',['I =',num2str(I),'[A]']);

uicontrol('Style','Text',...
          'Units','Normalized',...
          'Position',[0.29 0.77 0.09 .03],...
          'FontSize',13,...
          'Fontname', 'Times new roman',...
          'BackgroundColor','#A9CBB8',...
          'Foregroundcolor','#4B3B3B',...
          'FontWeight','b',...
          'String',['τ =',num2str(tau),' [s] ']);

subplot('Position',[0.49 0.22 0.5 0.23]); 
plot(t,V,'r','LineWidth',1.5);
grid on;
title('Circuitul RC in timp in functie de tensiune', 'fontname','Times New Roman');
xlabel('Time [s]','fontweight','bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',10);
ylabel('Volts [V]','fontweight','bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',12);

subplot('Position', [0.49 0.55 0.5 0.23]);
plot(t,I,'LineWidth',1.5);
grid on;
title('Circuitul RC in timp in functie de curent', 'fontname','Times New Roman');
xlabel('Time [s]','fontweight','bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',10);
ylabel('Curent [A]','fontweight','bold', 'fontname', 'Times New Roman','color','#6A6A6A','fontsize',12);
end
%--------------------------------------
f= uimenu('Label','Documentatie');
   uimenu(f,'Label','Prima Pagina','Callback','coperta');
   uimenu(f,'Label','Ghid de prezentare','Callback','open(''prezentare.pptx'')');
   uimenu(f,'Label','Ecuatii','Callback','open(''Documentatie.docx'')');
   uimenu(f,'Label','Iesire','Callback','close',...
                    'Separator','on','Accelerator','Q');
end