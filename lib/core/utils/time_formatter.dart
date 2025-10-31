class TimeFormatter {
  static String formatElapsedTime(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    return '$hours Giờ $minutes Phút $seconds Giây';
  }

  static String formatJobList(List<String> jobs) {
    if (jobs.length <= 2) {
      return jobs.join(', ');
    } else {
      final remaining = jobs.length - 2;
      return '${jobs.take(2).join(', ')}, +$remaining';
    }
  }

  static String timeRemainingText(int timestamp) {
    final now = DateTime.now();
    final target = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final diff = target.difference(now);

    if (diff.isNegative) {
      return 'Đã hết hạn';
    }

    final hours = diff.inHours;
    if (hours >= 24) {
      final days = diff.inDays;
      return 'Còn $days ngày';
    } else {
      return 'Còn $hours giờ';
    }
  }
}
