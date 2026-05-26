<?php
$title = 'Timeline';
include('Ext/main.php');

        $art_db = @mysqli_connect('localhost', 'root', '', 'art_movements')
            OR die('MySQL connection error: ' . mysqli_connect_error());
        mysqli_set_charset($art_db, 'utf8');

        $timeframe =
            "SELECT move_name, start_year, end_year
            FROM movement
            ORDER BY start_year";
        $tf = mysqli_query($art_db, $timeframe);

        if ($tf) {
            while ($row = mysqli_fetch_array($tf, MYSQLI_ASSOC)) {
                echo "
        <div>{$row['move_name']}: {$row['start_year']}&ndash;{$row['end_year']}</div>";
            }

            mysqli_free_result($tf);
        } else {
            echo mysqli_error($art_db);
        }
?>


    </main>
</body>
</html>