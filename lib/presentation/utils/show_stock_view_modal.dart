import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/favorite_stocks_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/pages/stock_view_page.dart';

class ShowStockViewModal {
  final String ticker;
  final FavoriteStocksCubit favoriteStocksCubit;

  ShowStockViewModal({ required this.ticker, required this.favoriteStocksCubit });
  
  void show(BuildContext context) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 0.95,
      context: context,
      isModal: true,
      bottomSheetColor: Colors.white,
      builder: _buildBottomSheet,
      anchors: [0, 0.5, 0.95],
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: SingleChildScrollView(
        controller: scrollController,
        child: StockViewPage(ticker: ticker, favoriteStocksCubit: favoriteStocksCubit),
      ),
    );
  }
}