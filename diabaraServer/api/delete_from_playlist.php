<?php
include_once './config/database.php';


header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();


$id = '';

$data = json_decode(file_get_contents("php://input"));

$id = $data->id;


$table_name = 'playlist_songs';


$query = "DELETE  FROM " . $table_name . " WHERE id= :id" ;

$stmt = $conn->prepare( $query );
$stmt->bindParam(':id', $id);



if($stmt->execute()){

    http_response_code(200);
    echo json_encode(
        array(
            "message" => "Song removed from playlist",

        ));


} else{

    http_response_code(401);
    echo json_encode(array("message" => "No data found"));

}
