import 'package:senior_flutter_developer_test/main/factory/cubit/make_favorite_stocks_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/cubit/favorite_stocks_cubit.dart';
import 'package:senior_flutter_developer_test/presentation/widgets/home_stock_item.dart';
import 'package:senior_flutter_developer_test/presentation/utils/color_pallete.dart';
import 'package:senior_flutter_developer_test/presentation/widgets/home_header.dart';
import 'package:senior_flutter_developer_test/domain/entity/stock/stock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = MakeFavoriteStocksCubit.make();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: _page,
    );
  }

  Widget get _page {
    return Scaffold(
      backgroundColor: ColorPallete.gray50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HomeHeader(),
          Expanded(
            child: _favoriteStocksSection,
          )
        ],
      ),
    );
  }

  Widget get _favoriteStocksSection {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: BlocBuilder<FavoriteStocksCubit, List<Stock>>(
        builder: (context, stockList) {
          if(stockList.isEmpty) {
            return _emptyState;
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: _getFavoritesListView(stockList)
            );
          }
        }
      )
    );
  }

  List<Widget> _getFavoritesListView(List<Stock> stockList) {
    return [
      const Text(
        'Favoritos:',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: ColorPallete.gray600
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (context, index) => HomeStockItem(
              shortName: stockList[index].getShortName(), 
              ticker: stockList[index].getTicker(),
            ), 
            itemCount: stockList.length,
          )
        ),
      )
    ];      
  }

  Widget get _emptyState {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/empty-state.png'),
        const Text(
          'Nenhum ativo favorito :(', 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: ColorPallete.gray700
          )
        ),
        const Text(
          'Utilize a pesquisa para adicionar ações, FIIs, ETFs, etc.', 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ColorPallete.gray500
          )
        )
      ],
    );
  }
}