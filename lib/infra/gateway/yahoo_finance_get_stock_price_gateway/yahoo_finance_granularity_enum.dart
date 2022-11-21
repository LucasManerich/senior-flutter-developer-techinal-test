import 'package:senior_flutter_developer_test/domain/enum/granularity.dart';

class YahooFinanceGranularityEnum {
  static String formatForQueryString(Granularity granularity) {
    switch(granularity) {
      case Granularity.hour:
        return '1h';
      case Granularity.day:
        return '1d';
      case Granularity.week:
        return '1wk';
      case Granularity.month:
        return '1mo';
    }
  } 
}