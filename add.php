<?php

require 'connect.php';

$typeId = $_POST['typeId'];
$question = $_POST['question'];
$mark = $_POST['mark'];
$feedback = $_POST['feedback'];
$answers = $_POST['answers'];

// validation
if (!strlen(($typeId))) {
  http_response_code(400);
} else if (!strlen(($question))) {
  http_response_code(401);
} else if (!strlen(($mark))) {
  http_response_code(402);
} else if (!strlen(($feedback))) {
  http_response_code(403);
} else {
  $sqlQuestion = "INSERT INTO questions (question, mark, feedback, typeId) VALUES ('$question', '$mark', '$feedback', '$typeId')";
  $resultQuestion = mysqli_query($conn, $sqlQuestion);

  if ($resultQuestion) {
    $questionId = $conn->insert_id;
    $array = json_decode($answers);

    foreach ($array as $value) {
      $answer = $value->answer;
      $isCorrect = $value->isCorrect;

      $sqlAnswer = "INSERT INTO answers (answer, isCorrect, questionId) VALUES ('$answer', '$isCorrect', '$questionId')";
      $resultAnswer = mysqli_query($conn, $sqlAnswer);

      if ($resultAnswer) {
        echo true;
      } else {
        http_response_code(404);
      }
    }
  } else {
    http_response_code(404);
  }
}

$conn->close();

?>