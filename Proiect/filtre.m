clear all;
close all;
Fig=figure('Name','Lupu Miruna Proiect GAC',... 
           'Units','normalized',...
           'Position',[0.1 0.1 0.8 0.8],...
           'NumberTitle','off');
x=imread('coperta.jpg');
image(x);
set(gca,'Position',[0 0 1 1]);
axis off;

uicontrol('String','FILTRUL-TRECE-JOS','FontSize',20,...
          'Units','normalized',...
          'Position',[.04 .36 .4 .25],...
          'Fontname','TIMES NEW ROMAN',...
          'Backgroundcolor','#3883BE',...
          'Foregroundcolor','#EAF8FB',...
          'Callback', 'fjos' );

uicontrol('String','FILTRUL-TRECE-SUS','FontSize',20,...
           'Units','normalized',...
           'Position',[0.55 .36 .4 .25],...
           'Fontname','TIMES NEW ROMAN',...
           'Backgroundcolor','#3883BE',...
           'Foregroundcolor','#EAF8FB',...
            'Callback', 'fsus' );

uicontrol('Style','pushbutton',... 
          'Units','normalized',... 
          'Position',[0.01 0.01 0.1 0.05],... 
          'FontName','Times New Roman',...
          'FontSize',15,...
          'FontWeight','bold',...
          'Backgroundcolor','#3883BE',...
          'Foregroundcolor','#EAF8FB',...
          'String','Back',...
          'Callback','coperta');

f= uimenu('Label','Documentatie');
   uimenu(f,'Label','Prima Pagina','Callback','coperta');
   uimenu(f,'Label','Ghid de prezentare','Callback','open(''prezentare.pptx'')');
   uimenu(f,'Label','Ecuatii','Callback','open(''Documentatie.docx'')');
   uimenu(f,'Label','Iesire','Callback','close',...
                    'Separator','on','Accelerator','Q');