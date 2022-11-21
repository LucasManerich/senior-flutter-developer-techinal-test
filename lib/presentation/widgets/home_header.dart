import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_flutter_developer_test/presentation/utils/color_pallete.dart';
import 'package:senior_flutter_developer_test/presentation/widgets/search_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
        child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            color: ColorPallete.primary,
            height: 120,
          ),
          Positioned.fill(
            bottom: -25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SearchBar()
            )
          ),
        ],
      ),
    );
  }
}