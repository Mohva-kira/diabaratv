<?php
include_once './config/database.php';


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$id = $_GET['id'];

$table_name = 'videos';

$query = "SELECT * FROM " . $table_name . " WHERE id= ". $id ;

$stmt = $conn->prepare( $query );
//$stmt->bindParam(1, $email);


if($stmt->execute()){
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
