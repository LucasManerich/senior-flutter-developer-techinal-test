import 'package:senior_flutter_developer_test/domain/enum/range.dart';

class YahooFinanceRangeEnum {
  static String formatForQueryString(Range range) {
    switch(range) {
      case Range.oneDay:
        return '1d';
      case Range.oneWeek:
        return '1wk';
      case Range.oneMonth:
        return '1mo';
      case Range.oneYear:
        return '1y';
    }
  } 
}