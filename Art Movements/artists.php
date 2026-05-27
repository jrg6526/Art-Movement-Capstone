<?php
$title = 'Artists';
include('Ext/main.php');

        echo
"        <ul id='artist-list'>";

        $art_db = mysqli_connect('localhost', 'root', '', 'art_movements')
            OR die('MySQL Connection Error: ' . mysqli_connect_error());
        mysqli_set_charset($art_db, 'utf8');

        $artist_names = 
            "SELECT
                CONCAT(tst.first_name, ' ', tst.last_name)
                    AS artist_name,
                art.title,
                move.move_name
            FROM
                artist AS tst,
                artwork AS art,
                movement AS move
            WHERE tst.artist_id = art.artist_id
                AND art.movement_id = move.movement_id
            GROUP BY tst.last_name
            ORDER BY last_name";
        $an = mysqli_query($art_db, $artist_names);

        if ($an) {
            while ($row = mysqli_fetch_array($an)) {
                echo "
            <a href='mvt.php?move_name={$row['move_name']}#{$row['title']}'>
                <li>{$row['artist_name']}</li>
            </a>\n";
            }
            
            mysqli_free_result($an);
        } else {
            echo mysqli_error($art_db);
        }
?>
        </ul>
    </main>
</body>
</html>