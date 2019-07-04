<?php
class ResaleCaclulator
{
  public static function calculateLowestLoss(array $prices): int
  {
     $res = 80000;
     echo print_r($prices);
     for ($i=0; $i < count($prices) - 1; $i++) { 
         for ($j = $i + 1; $j < count($prices); $j++) { 
            $tmp = $prices[$i] - $prices[$j];
            if($tmp > 0 and $tmp < $res){                
                $res = $tmp;
            }
         }
     }
     return $res;
  }
}
?>