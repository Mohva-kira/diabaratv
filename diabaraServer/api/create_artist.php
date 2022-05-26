<?php
include_once './config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$name = '';
$location = '';
$image = '';
$create_at = '';
$status = '';
$created_user = '';
$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

$name = $data->name;
$location = $data->location;
$image = $data->image;
$create_at = $data->create_at;
$status = $data->status;
$created_user = $data->created_user;



$table_name = 'artist';

$query = "INSERT INTO " . $table_name . "
                SET name = :name,
                    location = :location,
                    image = :image,
                    create_at = :create_at,
                    status = :status,
                    created_user = :created_user";

$stmt = $conn->prepare($query);

$stmt->bindParam(':name', $name);
$stmt->bindParam(':location', $location);
$stmt->bindParam(':image', $image);


$stmt->bindParam(':create_at', $create_at);
$stmt->bindParam(':status', $status);
$stmt->bindParam(':created_user', $created_user);


if($stmt->execute()){

    http_response_code(200);
    echo json_encode(array("message" => "Artist registered successfully."));
}
else{
    http_response_code(400);

    echo json_encode(array("message" => "Unable to register the artist."));
}
?>