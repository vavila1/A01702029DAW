<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title>Lab9A01702029</title>
    </head>
    <body>
        <h1>Promedio</h1>
        <div>
        	<?php
        	$numeros=array(2,6,10,3,5);
$sumas=suma($numeros);
echo "El promedio del: ",print_r($numeros)," es: ",$sumas;
function suma($num){
	$sum = 0;
	foreach ($num as $key => $val) {
		$sum = $sum+$val;
	}return $sum/5;
}
        	?>
        </div>
        <h1> Tabla</h1>
        <div>
        <?php
        function tabla(){
	$intNum = 1;
	echo"<table align=center width=80% border=1 cellspacing=0 cellpading=2>";
	echo "<tr>";
	echo "<th>Numero</th>";
	echo "<th>Cuadrado del número</th>";
	echo "<th>Cubo del número</th>";
	echo "</tr>";
	while($intNum<=10){
		$intNum2 = $intNum*$intNum;
		$intNum3=$intNum2*$intNum;
		echo"<tr>";
		echo "<td>" .$intNum, "</td>";
		echo "<td>" .$intNum2, "</td>";
		echo "<td>" .$intNum3,"</td>";
		echo"<tr>";
		$intNum++;

	}echo"</table>";
} tabla();
        ?>
    </div>
    <h1> Listas</h1>
    <div>
    	<?php
        	$numeros=array(2,6,10,3,5);
        	$sumas1=suma2($numeros);
        	function suma2($num){
        		$sum = 0;
        		foreach ($num as $key => $val) {
        			$sum = $sum+$val;
        		}return $sum/5;
        	}
        	echo"<ul>";
        	echo"<li>".$sumas1,"</li>";
        	sort($numeros);
        	echo"<li>".print_r($numeros),"</li>";
        	rsort($numeros);
        	echo"<li>".print_r($numeros),"</li>";
        	echo"</ul>";
        	?>
    </div>
    <h1>Mediana</h1>
    <?php
        	$arreglo=array(2,6,10,3,5,4);
        	sort($arreglo);
        	$cantidad=count($arreglo);
        	echo"El arreglo es: ",print_r($arreglo),"<br>";
        	//Si la cantidad del arreglo es par, se tienen que escoger los 2 numeros que conforman la media y sacar el promedio de esos dos.
        	if($cantidad%2==0){
        		$cantidad2=$cantidad/2;
        		$prom=($arreglo[$cantidad2-1]+$arreglo[$cantidad2])/2;
        		echo"La mediana del arreglo es: ",$prom;
        	}else{
        		$cantidad2=$cantidad/2;
        		echo"La mediana del arreglo es: ",$arreglo[$cantidad2];
        	}
    ?>
    </body>
</html>