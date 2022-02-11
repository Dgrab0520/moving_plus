class TimeCalculator {
  String getTime(String createTime) {
    DateTime createAt =
        createTime == "" ? DateTime.now() : DateTime.parse(createTime);
    DateTime now = DateTime.now();
    int timeDifference = now.difference(createAt).inMinutes;
    String time = "";
    if (timeDifference < 60) {
      if (timeDifference == 0) {
        time = "지금";
      } else {
        time = "$timeDifference 분전";
      }
    } else {
      if (timeDifference / 60 < 24) {
        time = "${timeDifference ~/ 60} 시간전";
      } else {
        if (timeDifference / 60 / 24 < 2) {
          time = "어제";
        } else {
          time = "${timeDifference / 60 ~/ 24} 일전";
        }
      }
    }
    return time;
  }
}
