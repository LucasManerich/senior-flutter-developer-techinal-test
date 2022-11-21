import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatBRL(double value) {
    final currencyFormatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return currencyFormatter.format(value);
  }
}