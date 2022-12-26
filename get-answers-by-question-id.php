<?php

require 'connect.php';

$id = $_GET['id'];

$sql = "SELECT * FROM answers WHERE questionId = $id";
$result = mysqli_query($conn, $sql);

if ($result) {
  $array = mysqli_fetch_all($result, MYSQLI_ASSOC);
  if (count($array)) {
    echo json_encode($array);
  } else {
    http_response_code(400);
  }
} else {
  http_response_code(403);
}

$conn->close();

?>