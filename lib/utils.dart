String timeAgo(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else {
    return '${difference.inDays} ${difference.inDays > 1 ? "days" : "day"}  agp';
  }
}
