import 'package:senior_flutter_developer_test/presentation/utils/currency_formatter.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/stock_view_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/utils/date_formatter.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StockCandleStickChart extends StatelessWidget {
  const StockCandleStickChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockViewCubit, Stock?>(
      builder: (context, stock) {
        if(stock == null) return Container();
        return InteractiveChart(
          timeLabel: (timestamp, _) {
            final formatter = DateFormat("dd/MM");
            final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
            return formatter.format(dateTime);
          },
          overlayInfo: getOverlayInfo,
          candles: stock.getStockPrice().map((price) {
            return CandleData(
              timestamp: price.getDate().millisecondsSinceEpoch, 
              open: price.getOpenValue(), 
              close: price.getCloseValue(), 
              volume: price.getVolume().toDouble(),
              high: price.getHighValue(),
              low: price.getLowValue()
            );
          }).toList()
        );
      }
    );
  }

  Map<String, String> getOverlayInfo(CandleData candle) {
    return {
      "Data": DateFormatter.formatMonthYearFromTimestamp(candle.timestamp),
      "Abertura": CurrencyFormatter.formatBRL(candle.open!),
      "Alta": CurrencyFormatter.formatBRL(candle.high!),
      "Baixa": CurrencyFormatter.formatBRL(candle.low!),
      "Fechamento": CurrencyFormatter.formatBRL(candle.close!),
      "Volume": candle.volume!.toStringAsFixed(0)
    };
  }
}