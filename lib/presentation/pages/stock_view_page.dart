import 'package:senior_flutter_developer_test/presentation/cubit/favorite_stocks_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/utils/currency_formatter.dart';
import 'package:senior_flutter_developer_test/presentation/widgets/stock_price_variation_panel.dart';
import 'package:senior_flutter_developer_test/presentation/widgets/stock_candlestick_chart.dart';
import 'package:senior_flutter_developer_test/main/factory/cubit/make_stock_view_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/stock_view_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/utils/color_pallete.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class StockViewPage extends StatefulWidget {
  final String ticker;
  final FavoriteStocksCubit favoriteStocksCubit;
  
  const StockViewPage({ 
    required this.ticker, 
    required this.favoriteStocksCubit,
    super.key
  });

  @override
  State<StockViewPage> createState() => _StockViewPageState();
}

class _StockViewPageState extends State<StockViewPage> {
  final cubit = MakeStockViewCubit.make();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => cubit),
        BlocProvider.value(value: widget.favoriteStocksCubit),
      ], 
      child: _page,
    );
  }

  @override
  void initState() {
    super.initState();
    cubit.loadStock(widget.ticker);
  }

  Widget get _page {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _stockHeader,
          const Divider(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _stockInfo,
              const StockPriceVariationPanel()
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          const SizedBox(
            height: 500,
            child: StockCandleStickChart(),
          )
        ],
      ),
    );
  }

  Widget get _stockHeader {
    return BlocBuilder<StockViewCubit, Stock?>(
      builder: (context, stock) {
        if(stock == null) return Container(); 
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              stock.getTicker(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ColorPallete.primary
              )
            ),
            IconButton(
              onPressed: () => onTapFavorite(context, stock), 
              icon: Icon(
                context.read<FavoriteStocksCubit>().isFavorite(stock) ? Icons.star : Icons.star_border, 
                size: 36, 
                color: ColorPallete.gray400
              )
            )
          ],
        );
      }
    );
  }

  Widget get _stockInfo {
    return Flexible(
      child: BlocBuilder<StockViewCubit, Stock?>(
        builder: (context, stock) {
          if(stock == null) return Container(); 
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                stock.getShortName(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: ColorPallete.gray600
                ),
              ),
              Text(
                stock.getLongName(),
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorPallete.gray400
                ),
              ),
              const SizedBox(height: 5),
              Text(
                CurrencyFormatter.formatBRL(stock.getLastPrice()),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ColorPallete.gray800
                ),
              ),
            ],
          );
        }
      )
    );
  }

  void onTapFavorite(BuildContext context, Stock stock) {
    Navigator.of(context).pop();
    final favoritesCubit = context.read<FavoriteStocksCubit>();
    if(favoritesCubit.isFavorite(stock)) {
      favoritesCubit.removeFavorite(stock);
    } else {
      favoritesCubit.addFavorite(stock);
    }
  }
}