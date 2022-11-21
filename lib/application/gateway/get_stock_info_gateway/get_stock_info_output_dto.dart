class GetStockInfoOutputDto {
  final String longName;
  final String shortName;
  final String ticker;
  final int marketCap;

  GetStockInfoOutputDto({
    required this.longName,
    required this.shortName,
    required this.ticker,
    required this.marketCap
  });
}