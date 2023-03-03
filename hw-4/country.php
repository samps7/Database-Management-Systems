<!--
NAME: Samuel Sovi
 * CLASS: CPSC 321 Section 1
 * DATE: 10/25/22
 * HOMEWORK: hw4
 * DESCRIPTION: Implementing Tables and Schemas modification 
 * using a php local host web app thing
-->

<html>
    <head>
        <title>Countries</title>
        <meta charset="UTF-8">
        <style>
            
        </style>
    </head>

    <?php
        //connection to database
        $config = parse_ini_file("config.ini");
        $server = $config["servername"];
        $username = $config["username"];
        $password = $config["password"];
        $database = "ssovi_DB";

        $cn = mysqli_connect($server, $username, $password, $database);
        if(!$cn)
        {
            die("Connection failed: " . mysqli_connect_error());
            echo "<h1 > Bye! </h1 >";
        }
    ?>

    <body>
        <h1>Country Information</h1>
        <hr width="100%"> 
        
        <h3>Add country:</h3>
        <form action = "insert.php" method="POST">
            <table>
                <tr>
                    <td>Country Code:</td>
                    <td><input type="text" name="code"></td>
                </tr>

                <tr>
                    <td>Country Name:</td>
                    <td><input type="text" name="name"></td>
                </tr>

                <tr>
                    <td>Country GDP:</td>
                    <td><input type="text" name="gdp"></td>
                </tr>

                <tr>
                    <td>Country Inflation:</td>
                    <td><input type="text" name="inflation"></td>
                </tr>
            </table>
            <input type="submit" value="Add"/>
        </form>
        
        <br>
        <h3>Display country information:</h3>
        <table>
            <tr>
                <form action = "display.php" method="POST">
                    <td>
                        <select name="code">
                            <?php
                                $q = " SELECT * FROM country";
                                $rs = mysqli_query ( $cn , $q );
                                if (mysqli_num_rows($rs) > 0)
                                {
                                    //adding rows to the select box
                                    while($row = mysqli_fetch_assoc($rs))
                                    {
                                        echo "<option value = " . $row["country_code"] . ">" . $row["country_name"] . " AKA " . $row["country_code"] . "</option>";
                                    }
                                }
                            ?>
                        </select>
                        
                    </td>
                    <td><input type="submit" value="Display"/></td>
                    
                </form>
            </tr>
        </table>
        <br>
        <h3>Update country information:</h3>
        <form action = "update.php" method="POST">
            <table>
                <tr>
                    <td>Country:</td>
                    <td>
                    <select name="code">
                            <?php
                                $q = " SELECT * FROM country";
                                $rs = mysqli_query ( $cn , $q );
                                if (mysqli_num_rows($rs) > 0)
                                {
                                    //adding rows to the select box
                                    while($row = mysqli_fetch_assoc($rs))
                                    {
                                        echo "<option value = " . $row["country_code"] . ">" . $row["country_name"] . " AKA " . $row["country_code"] . "</option>";
                                    }
                                }
                            ?>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Country GDP:</td>
                    <td><input type="text" name="gdp"></td>
                </tr>

                <tr>
                    <td>Country Inflation:</td>
                    <td><input type="text" name="inflation"></td>
                </tr>
            </table>
            <input type="submit" value="Update"/>
        </form>
        <br>
        <h3>Remove country:</h3>
        <table>
            <tr>
                <form action = "remove.php" method="POST">
                    <td>
                        <select name="code">
                            <?php
                                $q = " SELECT * FROM country";
                                $rs = mysqli_query ( $cn , $q );
                                if (mysqli_num_rows($rs) > 0)
                                {
                                    //adding rows to the select box
                                    while($row = mysqli_fetch_assoc($rs))
                                    {
                                        echo "<option value = " . $row["country_code"] . ">" . $row["country_name"] . " AKA " . $row["country_code"] . "</option>";
                                    }
                                }
                            ?>
                        </select> 
                    </td>
                    <td><input type="submit" value="Remove"/></td>
                    
                </form>
            </tr>
        </table>

    </body>
</html>