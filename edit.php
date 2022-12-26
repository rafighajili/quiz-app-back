<?php

require 'connect.php';

$questionId = $_POST['questionId'];
$question = $_POST['question'];
$mark = $_POST['mark'];
$feedback = $_POST['feedback'];
$answers = $_POST['answers'];

// validation
if (!strlen(($question))) {
  http_response_code(401);
} else if (!strlen(($mark))) {
  http_response_code(402);
} else if (!strlen(($feedback))) {
  http_response_code(403);
} else {
  $sqlQuestion = "UPDATE questions SET question = '$question', mark = '$mark', feedback = '$feedback' WHERE id = $questionId";
  $resultQuestion = mysqli_query($conn, $sqlQuestion);

  if ($resultQuestion) {
    $array = json_decode($answers);

    foreach ($array as $value) {
      $answerId = $value->id;
      $answer = $value->answer;
      $isCorrect = $value->isCorrect;

      $sqlAnswer = "UPDATE answers SET answer = '$answer', isCorrect = '$isCorrect' WHERE id = $answerId";
      $resultAnswer = mysqli_query($conn, $sqlAnswer);

      if ($resultAnswer) {
        echo $answer;
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