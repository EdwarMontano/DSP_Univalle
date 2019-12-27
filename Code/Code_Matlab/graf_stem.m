function [ ] = graf_plotm (N, X, TITULO,LABEL_X,LABEL_Y, ANCHO_LINEA, TIPO_MARCA, ESTILO_LINEA )
    plot(N,X,'LineWidth',ANCHO_LINEA,'Marker', TIPO_MARCA, 'LineStyle', ESTILO_LINEA); grid on; title(TITULO);xlabel(LABEL_X);ylabel(LABEL_Y); 
    axis tight;
    %Trazar ejes coordenados
    InfoEjes = axis;
    %Trazar Eje Horizontal
    if (InfoEjes(3)<0) 
        line([InfoEjes(1)  InfoEjes(2)], [0 0], 'LineWidth',2, 'Color',[0 0 0]);
    end
    %Trazar Eje Vertical
    line([0 0],[InfoEjes(3)  InfoEjes(4)], 'LineWidth',2, 'Color',[0 0 0]);
end