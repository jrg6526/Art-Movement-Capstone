<?php
$move_name = $_REQUEST['move_name'];
echo
"<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<meta name='viewport' content='width=device-width, initial-scale=1.0'>
	<link rel='stylesheet' href='art.css'>
    <title>$move_name</title>
</head>
<body>
    <header>
        <h1>$move_name</h1>
    </header>
    <main>
        <pre>
";

            // Connect to database

            $art_db = @mysqli_connect('localhost', 'root', '', 'art_movements')
                OR die('MySQL connection error: ' . mysqli_connect_error());

            mysqli_set_charset($art_db, 'utf8');

            // Fetch essay

            $movement_essay = "SELECT essay FROM movement WHERE move_name = '$move_name'";
            $me = mysqli_query($art_db, $movement_essay);

            if ($me) {
                $row = mysqli_fetch_array($me);
                include($row[0]);

                mysqli_free_result($me);
            } else {
                echo mysqli_error($art_db);
            }

            // Fetch images

            echo '
        </pre>
        <br>
        <div class="gallery">
        ';

            $art_images =
                "SELECT
                    art.image,
                    art.title,
                    CONCAT(tst.first_name, ' ', tst.last_name) AS artist_name
                FROM
                    artwork AS art,
                    artist AS tst,
                    movement AS move
                WHERE art.artist_id = tst.artist_id
                    AND art.movement_id = move.movement_id
                    AND move.move_name = '$move_name'";
            $img = mysqli_query($art_db, $art_images);

            if ($img) {
                while ($row = mysqli_fetch_array($img, MYSQLI_ASSOC)) {
                    echo "
            <figure>
                <img id='{$row['title']}' src='{$row['image']}' width='75%'>
                <figcaption><i>{$row['title']}</i> by {$row['artist_name']}</figcaption>
            </figure>";
                }

                mysqli_free_result($img);
            } else {
                echo mysqli_error($art_db);
            }

echo "
        </div>

        <a class='back' href='movements.php'>&lsqb; Back &rsqb;</a>
    </main>
</body>
</html>";
?>