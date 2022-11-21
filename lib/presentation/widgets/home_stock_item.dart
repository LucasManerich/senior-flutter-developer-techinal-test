import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/favorite_stocks_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/utils/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:senior_flutter_developer_test/presentation/utils/show_stock_view_modal.dart';
import 'package:senior_flutter_developer_test/presentation/utils/stock_logo_image.dart';

class HomeStockItem extends StatelessWidget {
  final String ticker;
  final String shortName;

  const HomeStockItem({
    required this.ticker, 
    required this.shortName,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTapCard(context),
      child: Row(
        children: [
          _stockLogo,
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  ticker,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorPallete.gray500
                  ),
                ),
                Text(
                  shortName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: ColorPallete.gray400
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onTapCard(BuildContext context) {
    final favoriteStocksCubit = BlocProvider.of<FavoriteStocksCubit>(context);
    final modalViewer = ShowStockViewModal(ticker: ticker, favoriteStocksCubit: favoriteStocksCubit);
    modalViewer.show(context);
  }

  Widget get _stockLogo {
    if(StockLogoImage.hasCompanyLogo(ticker)) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.asset(
          StockLogoImage.logoList[ticker]!,
          height: 60,
          width: 60,
        ),
      );
    } else {
      return _defaultCompanyLogo;
    }
  }

  Widget get _defaultCompanyLogo {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorPallete.gray300
      ),
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Text(
          ticker, 
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorPallete.gray500,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}