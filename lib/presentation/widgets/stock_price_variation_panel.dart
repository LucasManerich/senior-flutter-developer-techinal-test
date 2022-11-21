import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:senior_flutter_developer_test/domain/enum/price_variation_type.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/stock_view_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/utils/color_pallete.dart';
import 'package:senior_flutter_developer_test/presentation/utils/percent_formatter.dart';

class StockPriceVariationPanel extends StatelessWidget {
  const StockPriceVariationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StockViewCubit, Stock?>(
      builder: (context, stock) {
        if(stock == null) return Container(); 
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              getIconFromStockVariation(stock), 
              size: 30, 
              color: getColorFromStockVariation(stock)
            ),
            Text(
              getVariationPercentageString(stock), 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: getColorFromStockVariation(stock)
              )
            )
          ],
        );
      }
    );
  }

  String getVariationPercentageString(Stock stock) {
    return PercentFormatter.formatPercentage(stock.getPriceVariation().getVariationPercentage());
  }

  IconData getIconFromStockVariation(Stock stock) {
    if(stock.getPriceVariation().getPriceVariationType() == PriceVariationType.positive) {
      return Icons.keyboard_arrow_up;
    } else {
      return Icons.keyboard_arrow_down;
    }
  }

  Color getColorFromStockVariation(Stock stock) {
    if(stock.getPriceVariation().getPriceVariationType() == PriceVariationType.positive) {
      return ColorPallete.positiveColor;
    } else {
      return ColorPallete.negativeColor;
    }
  }
}