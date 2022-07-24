<?php
include_once './config/database.php';

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$data = json_decode(file_get_contents("php://input"));
$target_dir = "../uploads/";
$target_file= "";
$target_image = "";
if(isset($_FILES["File"]["name"] )){
$target_file = $target_dir . basename($_FILES["File"]["name"]);
}

if(isset($_FILES["Image"]["name"])){
    $target_image = $target_dir . basename($_FILES["Image"]["name"]);
}


$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
if(isset($_FILES["File"]) || isset($_FILES["Image"])) {

    // Check if $uploadOk is set to 0 by an error
        if (isset($_FILES["File"])) {
            move_uploaded_file($_FILES["File"]["tmp_name"], $target_file);
            echo "The file ". htmlspecialchars( basename( $_FILES["File"]["name"])). " has been uploaded.";
        }

        if (isset($_FILES["Image"])) {
            move_uploaded_file($_FILES["Image"]["tmp_name"], $target_image);
            echo "The file ". htmlspecialchars( basename( $_FILES["Image"]["name"])). " has been uploaded.";
        }

}else {
    echo "Sorry, there was an error uploading your file.";
  
}
?>