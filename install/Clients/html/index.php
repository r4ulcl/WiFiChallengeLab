<?php
echo "<br><br>";
echo "<br><br>";
echo "<br><br>";
if (strpos($_SERVER['REMOTE_ADDR'], '192.168.0.') !== false) { //only MGT	
    echo "FLAG: y67gasdG6hm8hfn7gh";
} elseif  (strpos($_SERVER['REMOTE_ADDR'], '192.168.1.') !== false) { //only OPN
    echo "FLAG: OKRlcefknkCAI0yc547";
} elseif  (strpos($_SERVER['REMOTE_ADDR'], '192.168.8.') !== false) { //only HIDDEN
    echo "FLAG: IkZ4ZeDqgfQ3eUU";
} elseif  (strpos($_SERVER['REMOTE_ADDR'], '192.168.9.') !== false) { //only WPS
        echo "FLAG: pRH6IlFp2OF49x2";
} else {
    echo "Sorry, No FLAG here";

}
echo "<br><br>";
echo "<br><br>";
echo "<br><br>";
?>

Hello