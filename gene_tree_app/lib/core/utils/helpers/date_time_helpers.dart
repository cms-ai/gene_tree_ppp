import 'package:intl/intl.dart';

class DateTimeHelper {
  /// Định dạng DateTime thành chuỗi với format cho trước
  static String formatDateTime(DateTime dateTime,
      {String format = 'yyyy-MM-dd HH:mm:ss'}) {
    return DateFormat(format).format(dateTime);
  }

  /// Chuyển đổi chuỗi sang DateTime với format cho trước
  static DateTime? parseDateTime(String dateTimeString,
      {String format = 'yyyy-MM-dd HH:mm:ss'}) {
    try {
      return DateFormat(format).parse(dateTimeString);
    } catch (e) {
      return null; // Trả về null nếu không parse được
    }
  }

  /// Tính khoảng thời gian giữa 2 DateTime (theo giây)
  static Duration calculateDifference(DateTime start, DateTime end) {
    return end.difference(start);
  }

  /// Kiểm tra xem ngày hiện tại có phải hôm nay không
  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  /// Kiểm tra xem ngày có phải là ngày mai không
  static bool isTomorrow(DateTime dateTime) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return dateTime.year == tomorrow.year &&
        dateTime.month == tomorrow.month &&
        dateTime.day == tomorrow.day;
  }

  /// Lấy thời gian đầu ngày (00:00:00) của một ngày
  static DateTime startOfDay(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  /// Lấy thời gian cuối ngày (23:59:59.999) của một ngày
  static DateTime endOfDay(DateTime dateTime) {
    return DateTime(
        dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999);
  }

  /// Chuyển đổi DateTime sang múi giờ khác
  static DateTime toTimeZone(DateTime dateTime, String timeZone) {
    return dateTime.toUtc().add(Duration(hours: _getTimeZoneOffset(timeZone)));
  }

  /// Hàm trợ giúp nội bộ - Tính offset múi giờ
  static int _getTimeZoneOffset(String timeZone) {
    switch (timeZone) {
      case 'UTC':
        return 0;
      case 'GMT+7':
        return 7;
      case 'GMT-5':
        return -5;
      default:
        throw ArgumentError('Unsupported timezone: $timeZone');
    }
  }

  /// Đếm số ngày trong tháng
  static int daysInMonth(DateTime dateTime) {
    final nextMonth = (dateTime.month == 12)
        ? DateTime(dateTime.year + 1, 1)
        : DateTime(dateTime.year, dateTime.month + 1);
    return nextMonth.subtract(const Duration(days: 1)).day;
  }

  /// Tính tuổi từ ngày sinh
  static int calculateAge(DateTime birthDate) {
    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Lấy giờ, phút dạng chuỗi (HH:mm)
  static String getTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  /// Lấy ngày, tháng, năm dạng chuỗi (dd/MM/yyyy)
  static String getDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}
