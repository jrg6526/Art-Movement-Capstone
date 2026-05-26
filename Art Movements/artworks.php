<?php
$title = 'Artworks';
include('Ext/main.php');
        echo "<div class='gallery'>";

        // Connect to database

        $art_db = @mysqli_connect('localhost', 'root', '', 'art_movements')
        OR die('MySQL connection error: ' . mysqli_connect_error());

        mysqli_set_charset($art_db, 'utf8');

        // Fetch images

        $art_images =
            "SELECT
                art.image,
                art.title,
                CONCAT(tst.first_name, ' ', tst.last_name) AS artist_name
            FROM
                artwork AS art,
                artist AS tst
            WHERE art.artist_id = tst.artist_id
            ORDER BY art.title";
        $img = mysqli_query($art_db, $art_images);

        if ($img) {
            while ($row = mysqli_fetch_array($img)) {
                echo "
            <figure>
                <img src='{$row['image']}' width='75%'>
                <figcaption><i>{$row['title']}</i> by {$row['artist_name']}</figcaption>
            </figure>";
            }

            mysqli_free_result($img);
        } else {
            echo mysqli_error($art_db);
        }

?>

        </div>
    </main>
</body>
</html>