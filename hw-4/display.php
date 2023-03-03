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
        <title>Display</title>
        <meta charset="UTF-8">
        <style>
            
        </style>
    </head>
    <body>
        <?php

            $code = $_POST["code"];
            $name;
            $gdp;
            $inflation;

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

            $q = " SELECT * FROM country WHERE country_code = '" .$code. "'";
            $rs = mysqli_query($cn, $q);
            while($row = mysqli_fetch_assoc($rs))
            {
                $name = $row["country_name"];
                $gdp = $row["gdp"];
                $inflation = $row["inflation"];
            }
        ?>
        
        <ul>
            <li>Country Code: <b> <?php echo $code; ?> </b> </li>
            <li>Country Name: <b> <?php echo $name; ?> </b> </li>
            <li>Country Per Capita GDP: <b>$<?php echo $gdp; ?> </b></li>
            <li>Country Inflation: <b> <?php echo $inflation; ?>%</b></li>
        </ul>
        

        <br>
        <td><button onclick="window.location='country.php';">Go Back</button></td>
    </body>
    
</html>