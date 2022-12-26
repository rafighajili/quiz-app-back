<?php

require 'connect.php';

$sql = "SELECT questions.id, questions.question, questions.mark, questions.feedback, types.id as typeId, types.name AS type FROM questions LEFT JOIN types ON types.id = questions.typeId";
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