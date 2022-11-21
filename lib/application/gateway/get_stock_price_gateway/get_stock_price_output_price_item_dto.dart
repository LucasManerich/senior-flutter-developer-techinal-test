class GetStockPriceOutputPriceItemDto {
  final DateTime date;
  final double openValue;
  final double closeValue;
  final double highValue;
  final double lowValue;
  final double volume;

  GetStockPriceOutputPriceItemDto({
    required this.date,
    required this.openValue,
    required this.closeValue,
    required this.highValue,
    required this.lowValue,
    required this.volume
  });
}