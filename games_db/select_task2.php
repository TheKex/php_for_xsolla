<?php
class DB_operations
{
    //Задача 2
    public static function getActualGames($connection): array
    {
            $select = "SELECT NAME, YEAR FROM game WHERE first_play IS NULL;";
            $result = mysqli_query($connection, $select);
            $res;
            while ( $record = mysqli_fetch_assoc($result) ) {
                $res[] = $record;
            }
            return $res;
    }

    //Задача 3
    public static function getTop3GameByGenre($connection, $genre): array
    {
            $select = "SELECT game.NAME
            FROM game_genres JOIN game ON game_genres.game_id = game.id
            JOIN genre ON game_genres.genre_id = genre.id
            WHERE genre.NAME = '$genre'
            ORDER BY  game.grade DESC
            LIMIT 3;";
            $result = mysqli_query($connection, $select);
            $res;
            while ( $record = mysqli_fetch_assoc($result) ) {
                $res[] = $record;
            }
            return $res;
    }

    //Задача 4
    public static function getCountGamesInSeriesByPublisher($connection, $publisher): array
    {
            $select = "SELECT game_series.NAME AS \"SERIES\", COUNT(game.NAME) AS \"GAMES_COUNT\"
            FROM game JOIN game_series ON game.series_id = game_series.id
            JOIN publisher ON game.publisher_id = publisher.id
            WHERE publisher.name = '$publisher'
            GROUP BY game_series.NAME;";
            $result = mysqli_query($connection, $select);
            $res;
            while ( $record = mysqli_fetch_assoc($result) ) {
                $res[] = $record;
            }
            return $res;
    }


}



$connection = mysqli_connect('127.0.0.1', 'root', '', 'games');

if($connection == false){
    echo "Не удалось подключиться к базе данных <br>";
    echo mysqli_connect_error();
    exit();
}


echo "Игры в которые еще не играл: <br>";
$actualGames = DB_operations::getActualGames($connection);
foreach ($actualGames as $key => $value) {
    echo ($value['NAME'].' - '.$value['YEAR'].'<br>');
}
echo "<hr>";


echo "<br> Топ 3 Экшена <br>";
$top3Action = DB_operations::getTop3GameByGenre($connection, 'Action');
foreach ($top3Action as $key => $value) {
    echo($value['NAME'].'<br>');
}
echo "<hr>";

echo "<br> Количество игр в сериях от издателя Ubisoft: <br>";
$gameSeries = DB_operations::getCountGamesInSeriesByPublisher($connection, 'Ubisoft');
foreach ($gameSeries as $key => $value) {
    print_r($value['SERIES'].' : '.$value['GAMES_COUNT'].'<br>');
}
echo "<hr>";

mysqli_close($connection);
?>