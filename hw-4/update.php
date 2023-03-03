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
        <title>Update</title>
        <meta charset="UTF-8">
        <style>
            
        </style>
    </head>
    <body>
        <h3>Update Successful:</h3>
        <?php
            $code = $_POST["code"];
            $gdp = $_POST["gdp"];
            $inflation = $_POST["inflation"];
            $name = "";

            $config = parse_ini_file("config.ini");
            $server = $config["servername"];
            $username = $config["username"];
            $password = $config["password"];
            $database = "ssovi_DB";


            //connection to database
            $cn = mysqli_connect($server, $username, $password, $database);
            if(!$cn)
            {
                die("Connection failed: " . mysqli_connect_error());
                echo "<h1 > Bye! </h1 >";
            }
            $valid = 0;
            $q = " SELECT * FROM country WHERE country_code = '" .$code. "'";
            $rs = mysqli_query ( $cn , $q );
            if (mysqli_num_rows($rs) > 0)
            {
                while($row = mysqli_fetch_assoc($rs))
                {
                    
                    if ($row["country_code"] == $code)
                    {
                        $name = $row["country_name"];
                        $valid = 1;
                    }
                }
            }
            if($valid == 0)
            {
                // reject any invalid values (does not alert user because it would require me to make
                // all the below html into php echo statements)
                header("Location: country.php");
            }

            // do updating:

            $q = " UPDATE country SET gdp = '" .$gdp. "', inflation ='" .$inflation."'";
            $rs = mysqli_query ( $cn , $q );
            
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