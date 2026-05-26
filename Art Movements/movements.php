<?php
$title = 'Movements';
include('Ext/main.php');
?>
        <form action="mvt.php">

            Enter a movement: 
            <select name="move_name">
                <?php
                    $art_db = @mysqli_connect('localhost', 'root', '', 'art_movements')
                        OR die('MySQL connection error: ' . mysqli_connect_error());
                    
                    mysqli_set_charset($art_db, 'utf8');

                    $movement_name = 'SELECT move_name FROM movement';
                    $mn = mysqli_query($art_db, $movement_name);

                    if ($mn) {
                        while ($row = mysqli_fetch_array($mn)) {
                            echo "<option value='$row[0]'>$row[0]</option>\n";
                        }

                        mysqli_free_result($mn);
                    } else {
                        echo mysqli_error($art_db);
                    }
                ?>
            </select>
            <br>
            <input type="submit">
        </form>
    </main>
</body>
</html>