USE bd-CTC;

CREATE TABLE usoMaquinaReal
(  
idUso INT PRIMARY KEY AUTO_INCREMENT, 
processos INT, 
usoCPU DOUBLE, 
usoMemoria DOUBLE, 
upTime DATETIME, 
identificador INT
);