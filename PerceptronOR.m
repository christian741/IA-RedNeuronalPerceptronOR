%------------------------------
%           Perceptron OR
%------------------------------
%Entradas
x1 = [0,1,0,1];
x2 = [0,0,1,1];
%umbral
theta = -1;
%Coeficiente de aprendizaje
alpha = 0.02;

%salida deseada
ySalida = [0,1,1,1];


%Pesos
disp("----------Pesos------------");
w0= randi([1 100],1,1)/100;
disp("w0 ="+ w0);
w1= randi([1 100],1,1)/100;
disp("w1 ="+ w1);
w2= randi([1 100],1,1)/100;
disp("w2="+ w2);

%iteraciones
i=1;
%error
error = 1;
disp("________________________________Empieza entrenamiento___________________________________");

%%Se guardan los entrenamientos
arrayEntrenamiento =[];
%%Array de salida con el que compara salidas deseadas
arraySalida =[];
arraySalidas = [];
%%Array de Errores
arrayErrores =[];
%Array de pesos
arrayPesoW0 = [];
arrayPesoW1 = [];
arrayPesoW2 = [];
%array entradas
arrayX1 =[];
arrayX2 =[];
%
arrayIteraciones =[];
iteraciones =0;
while(error~=0)
    
    while(i<=4)
        arrayIteraciones = [arrayIteraciones iteraciones];
        
        NET = (theta*w0)+(x1(i)*w1)+(x2(i)*w2);
        arrayX1 =[arrayX1 x1(i)];
        arrayX2 =[arrayX2 x2(i)];
        
        if(NET>=0)
            y0=1;
        else
            y0=0;
        end
        %comparar error
        error = ySalida(i)-y0;
        %guardar errores
        arrayErrores = [arrayErrores error];
        
        % Mirar entrenamiento
        arrayEntrenamiento = [arrayEntrenamiento y0];
        arraySalidas = [arraySalidas y0];
        %si el error es igual a la salida deseada se pasa a otra iteracion
        if(error==0)
            %%Se guarda en el array que compara
            arraySalida= [arraySalida y0];
            i=i+1;
            
        else
            %si no se buscan los nuevos pesos
            disp(" Nuevos Pesos");
            w0= w0+alpha*error*theta;
            disp("w0 ="+ w0);
            w1= w1+alpha*error*x1(i);
            disp("w1 ="+ w1);
            w2= w2+alpha*error*x2(i);
            disp("w2 ="+ w2);
        end
        %guardar pesos
        arrayPesoW0 = [arrayPesoW0 w0];
        arrayPesoW1 = [arrayPesoW1 w1];
        arrayPesoW2 = [arrayPesoW2 w2];
        
        iteraciones = iteraciones +1;
        
        
    end
end

disp("----------------fin de entrenamiento-----------------------------");
disp("Numero de iteraciones "+ iteraciones);
disp("----------------NAND-----------------------------");
for i=1:1:4
    disp("array entreamiento con entradas  x1 = ("+x1(i)+") x2= ("+x2(i)+") es igual a =  "+arraySalida(i));
    disp("salida deseada "+ySalida(i));
end
%%Diagramas
disp(" Pesos Finales");
disp("w0 ="+ w0);
disp("w1 ="+ w1);
disp("w2 ="+ w2);
%%Error vs Entreamiento
f1 = figure;

%plot(arrayEntrenamiento,arrayErrores);
%plot(arrayIteraciones,arrayErrores);
plot(arrayIteraciones,arrayX1,arrayIteraciones,arrayX2,arrayIteraciones,arrayErrores,'g');
legend('x1','x2','errores')
axis([-1.5 iteraciones -1.5 1.5]);
xlabel('Errores')
ylabel('Entrenamiento')
title('Error vs Entrenamiento')
zoom on;
hold on;

%%Pesos vs entradas

f2 = figure;
%plot(arrayPesoW0,arrayX1,'r',arrayPesoW1,arrayX1,'r',arrayPesoW2,arrayX1,'r',arrayPesoW0,arrayX2,'b',arrayPesoW1,arrayX2,'b',arrayPesoW2,arrayX2,'b');
%plot(arrayPesoW1,arrayX1,'b',arrayPesoW2,arrayX1,'k',arrayPesoW1,arrayX2,'r',arrayPesoW2,arrayX2,'g');
plot(arrayIteraciones,arrayPesoW0,'r',arrayIteraciones,arrayPesoW1,'k',arrayIteraciones,arrayPesoW2,'g',arrayIteraciones,arrayX1,'b',arrayIteraciones,arrayX2,'p--');
%plot(arrayPesoW0,arrayX1,'r',arrayPesoW1,arrayX1,'k',arrayPesoW2,arrayX1,'g');
%axis([-0.5 1.5 -0.5 1.5]);
%subplot(2,1,2);
%plot(arrayPesoW0,arrayX2,'r',arrayPesoW1,arrayX2,'k',arrayPesoW2,arrayX2,'g');
%plot(arrayIteraciones,arrayX1,'o',arrayIteraciones,arrayX2,':');
legend('w0','w1','w2','x1','x2');
axis([-0.5 iteraciones+1 -0.5 1.5]);
xlabel('Pesos');
ylabel('Entradas');
title('Pesos vs Entradas');
zoom on;
hold on;
%
%%Entradas y Salidas
%fig3 = figure;

%plot(arrayX1,arraySalidas,'r',arrayX2,arraySalidas,'k');
%Grafica de entrada vs salidas
%arrayGrafica =[];
%for i=1:4
    %arrayGrafica(i)=-((w1/w2)*x1(i))-(theta*w0/w2);
%end
%plot(x1,arrayGrafica);
%axis([-0.5 1.5 -0.5 1.5]);
% xlabel('Entradas')
% ylabel('Salidas')
% title('Entradas vs Salidas')
% zoom on;