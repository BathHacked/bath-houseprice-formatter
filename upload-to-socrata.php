<?php

require_once "vendor/autoload.php";

// Your credentials
$root_url = "https://data.bathhacked.org";
$app_token = "YpCcAYH2LzImTrwGFcvGHIRIH";
$database_id = "ifh9-xtsp";
$email = "fletcher.tom@gmail.com";
$password = getenv('SOCRATA_PASS');

if( $password == "" || $email == "" || $app_token == "" ){
    die('No email / apptoken / password in upload-to-socrate.php. Add missing fields, and then re-run upload-to-socrata.php.');
}

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

echo "Uploading to Socrata...\n";
for( $i=0; $i < count($records); $i += 1000){
    $pageOfRecords = array_slice($records, $i, 1000);

    // Send to Socrata.
    $response = $socrata->post('/resource/'.$database_id, $pageOfRecords);
    echo "Uploaded page ".(($i/1000)+1)." / ".ceil(count($records)/1000).". \n";
    var_dump($response);
}

// Output when finished
echo "\n All data imported!";

?>