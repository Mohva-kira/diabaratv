<?php
include_once './config/database.php';
require "../vendor/autoload.php";
use \Firebase\JWT\JWT;
use Permify\Client;
use Permify\Requests\CreateUser;

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");


$email = '';
$password = '';

$databaseService = new DatabaseService();
$conn = $databaseService->getConnection();
$client =  new Client("c9l8p3j7ued7tovbpef0",
    "HyZw3Q8s9dNXInRfBFEFr8wQCFhEcJcCGRaviDtGWIL2QwZXLvXYy93413e74PWy");


$data = json_decode(file_get_contents("php://input"));

$email = $data->username;
$password = $data->password;

$table_name = 'Users';

$query = "SELECT * FROM " . $table_name . " WHERE email = ? LIMIT 0,1";

$stmt = $conn->prepare( $query );
$stmt->bindParam(1, $email);
$stmt->execute();
$num = $stmt->rowCount();

if($num > 0){
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    $id = $row['id'];
    $firstname = $row['first_name'];
    $lastname = $row['last_name'];
    $role = $row['role'];
    $password2 = $row['password'];

    if(password_verify($password, $password2))
    {
        $secret_key = "YOUR_SECRET_KEY";
        $issuer_claim = "THE_ISSUER"; // this can be the servername
        $audience_claim = "THE_AUDIENCE";
        $issuedat_claim = time(); // issued at
        $notbefore_claim = $issuedat_claim + 10; //not before in seconds
        $expire_claim = $issuedat_claim + 60; // expire time in seconds
        $token = array(
            "iss" => $issuer_claim,
            "aud" => $audience_claim,
            "iat" => $issuedat_claim,
            "nbf" => $notbefore_claim,
            "exp" => $expire_claim,
            "data" => array(
                "id" => $id,
                "firstname" => $firstname,
                "lastname" => $lastname,
                "email" => $email,
                "role" => $role
            ));

        http_response_code(200);

        $jwt = JWT::encode($token, $secret_key, 'HS256' );
//        $client->call(new CreateUser(
//            [
//                "id" => $id, // optional
//                "name" => $firstname, // optional
//                "photo" => "photo url", // optional
//                "role_names" => [$role], // optional
//                "group_ids" => [
//                    "Q7FjSysvBuHz",
//                ], // optional
//
//            ]));
        echo json_encode(
            array(
                "message" => "Successful login.",
                "jwt" => $jwt,
                "email" => $email,
                "role" => $role,
                "expireAt" => $expire_claim
            ));
    }
    else{

        http_response_code(401);
        echo json_encode(array("message" => "Login failed.", "password" => $password));

    }
}
?>