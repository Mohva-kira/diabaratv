<?php
include_once './config/database.php';


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$table_name = 'artist';

$query = "SELECT * FROM " . $table_name;

$stmt = $conn->prepare( $query );
//$stmt->bindParam(1, $email);
$stmt->execute();
$num = $stmt->rowCount();

if($num > 0){
    $rows = $stmt->fetchAll();

    http_response_code(200);
    echo json_encode(
        array(
            "message" => "Getting data Successful.",
            "data" => $rows,

        ));


} else{

    http_response_code(401);
    echo json_encode(array("message" => "No data found"));

}
