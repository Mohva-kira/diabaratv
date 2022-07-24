<?php
include_once './config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$name = '';
$user_id='';
$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

$playlist_id = $data->id;
$song_id = $data->songId;



$table_name = 'playlist_songs';

$query = "INSERT INTO " . $table_name . "
                SET playlist_id = :playlist_id,
                song_id = :song_id";

$stmt = $conn->prepare($query);

$stmt->bindParam(':playlist_id', $playlist_id);
$stmt->bindParam(':song_id', $song_id);


if($stmt->execute()){

    http_response_code(200);
    echo json_encode(array("message" => "song added to playlist."));
}
else{
    http_response_code(400);

    echo json_encode(array("message" => "Unable to add song to playlist."));
}
?>