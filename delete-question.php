<?php

require 'connect.php';

$id = $_GET['id'];

$sql = "DELETE FROM questions WHERE id = '$id'";
$result = mysqli_query($conn, $sql);

if ($result) {
  echo true;
} else {
  http_response_code(403);
}

$conn->close();

?>