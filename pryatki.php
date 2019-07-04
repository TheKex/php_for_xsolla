<?php
header("Content-type: application/json");
function GetVodu(array $children, int $count): srting {
    for($i = $count - 1, $j = 0; count($children) > 1; $i--, $j++){
        if($j == count($children))
            $j = 0;
        if($i == 0){
            array_splice($children, $j, 1);
            $j--;
            $i = $count;
        }
    }
    return $children[0];
}

if(isset($_POST)){
    $postData = file_get_contents('php://input');
    $obj = json_decode($postData, true);
    $res = GetVodu($obj['children'], $obj['count']);
    echo json_encode('{"name":"'.$res.'"}');
}
?>