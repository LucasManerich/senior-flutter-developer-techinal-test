import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/favorite_stocks_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/utils/upper_case_text_formatter.dart';
import 'package:senior_flutter_developer_test/presentation/utils/show_stock_view_modal.dart';
import 'package:senior_flutter_developer_test/presentation/utils/color_pallete.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final inputController = TextEditingController();

  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 85),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12)
        ),
        boxShadow: [
          BoxShadow(
            color: ColorPallete.gray700.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: inputController,
          inputFormatters: [UpperCaseTextFormatter()],
          textCapitalization: TextCapitalization.characters,
          autocorrect: false,
          autofocus: false,
          style: const TextStyle(
            fontSize: 18,
            color: ColorPallete.gray400
          ),
          decoration: const InputDecoration(
            hintText: "Pesquise por um ativo...",
            prefixIcon: Icon(Icons.search, color: ColorPallete.gray400, size: 35),
            border: InputBorder.none
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) => searchForTicker(value, context),
        ),
      )
    );
  }

  void searchForTicker(String ticker, BuildContext context) {
    inputController.text = '';
    final favoriteStocksCubit = BlocProvider.of<FavoriteStocksCubit>(context);
    final modalViewer = ShowStockViewModal(ticker: ticker, favoriteStocksCubit: favoriteStocksCubit);
    modalViewer.show(context);
  }
}