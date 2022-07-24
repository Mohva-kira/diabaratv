<?php
include_once './config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$id= '';
$title = '';
$artiste_id = '';
$url = '';
$image = '';
$created_at = '';
$created_by = '';
$updated_at = '';
$updated_by = '';

$conn = null;

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();

$data = json_decode(file_get_contents("php://input"));

$id = $_GET['id'];
$title = $data? $data->title : '';
$artiste_id = $data? $data->artiste_id : '';
$url = $data? $data->video_url : '';
$image = $data? $data->image : '';
$created_at= $data? $data->created_at : '';
$created_by = $data? $data->created_by : '';
$updated_at = $data? $data->updatedAt : '';
$updated_by = $data? $data->updatedBy : '';

$table_name = 'videos';

$query = "UPDATE " . $table_name . "
                SET title = :title,
                    artiste_id = :artiste_id,
                    video_url = :url,
                    image = :image,
                    created_at = :created_at,
                    created_by = :created_by,
                    updated_at = :updated_at,
                    updated_by = :updated_by
                    WHERE id = :id"
                    ;

$stmt = $conn->prepare($query);
$stmt->bindParam(':id', $id);
$stmt->bindParam(':title', $title);
$stmt->bindParam(':artiste_id', $artiste_id);
$stmt->bindParam(':url', $url);
$stmt->bindParam(':image', $image);
$stmt->bindParam(':created_at', $created_at);
$stmt->bindParam(':created_by', $created_by);
$stmt->bindParam(':updated_at', $updated_at);
$stmt->bindParam(':updated_by', $updated_by);


if($stmt->execute()){

    http_response_code(200);
    echo json_encode(array("message" => "Video updated successfully."));
}
else{
    http_response_code(400);

    echo json_encode(array("message" => "Unable to update the Video."));
}
?>