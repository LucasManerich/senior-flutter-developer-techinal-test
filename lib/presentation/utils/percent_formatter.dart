class PercentFormatter {
  static String formatPercentage(double percent) {
    double percentage = percent * 100;
    String formattedPercent = percentage.toStringAsFixed(percentage.truncateToDouble() == percentage ? 0 : 2);
    return "$formattedPercent%";
  }
}