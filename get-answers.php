<?php

require 'connect.php';

$sql = "SELECT * FROM answers";
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