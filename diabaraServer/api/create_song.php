<?php
include_once './config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$title = '';
$artiste_id = '';
$year = '';
$duration = '';
$url = '';
$image = '';
$created_at = '';
$created_by = 0;
$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

$title = $data->title;
$artiste_id = $data->artiste_id;
$year = $data->year;
$duration = $data->duration;
$url = $data->url;
$image = $data->image;
$created_at = $data->createdAt;
$created_by = $data->createdBy;

$table_name = 'songs';

$query = "INSERT INTO " . $table_name . "
                SET title = :title,
                    artiste_id = :artiste_id,
                    year = :year,
                    duration = :duration,
                    url = :url,
                    image = :image,
                    created_at = :created_at,
                    created_by = :created_by";

$stmt = $conn->prepare($query);

$stmt->bindParam(':title', $title);
$stmt->bindParam(':artiste_id', $artiste_id);
$stmt->bindParam(':year', $year);


$stmt->bindParam(':duration', $duration);
$stmt->bindParam(':url', $url);
$stmt->bindParam(':image', $image);
$stmt->bindParam(':created_at', $created_at);
$stmt->bindParam(':created_by', $created_by);


if($stmt->execute()){

    http_response_code(200);
    echo json_encode(array("message" => "Song registered successfully."));
}
else{
    http_response_code(400);

    echo json_encode(array("message" => "Unable to register the song."));
}
?>