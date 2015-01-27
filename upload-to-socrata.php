<?php

require_once "vendor/autoload.php";

// Your credentials
$root_url = "https://data.bathhacked.org";
$app_token = "YpCcAYH2LzImTrwGFcvGHIRIH";
$database_id = "ifh9-xtsp";
$email = "fletcher.tom@gmail.com";
$password = "";

// Create a new authenticated client - include your own email address (username) and password
$socrata = new \BathHacked\Socrata(
    $root_url,
    $app_token,
    $email,
    $password
);

echo "Reading output.csv... \n";
// Read the CSV into an array.
$records = [];
$file = fopen('output.csv', 'r');
$csvheadings = fgetcsv($file);

while (($line = fgetcsv($file)) !== FALSE) {
    //$line is an array of the csv elements
    //print_r($line);
    $newRow = array_combine($csvheadings, $line);
    array_push( $records, $newRow );
    
}
fclose($file);

echo "Read ".count( $records )." records with ".count( $records[0] )." fields\n";
var_dump( $records[0] );
var_dump( $records[1] );

//$records = array_slice($records, 40000, 10);

echo "Uploading to Socrata...\n";
// Send to Socrata.
$response = $socrata->post('/resource/'.$database_id, $records);
var_dump($response);

// Output when finished
echo "\n All data imported!";

?>