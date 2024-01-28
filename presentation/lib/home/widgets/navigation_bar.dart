import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:provider/provider.dart';

import '../../utils/extensions.dart';
import '../home_viewmodel.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.floating,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32),
      snakeViewColor: context.colors.primaryColor,
      selectedItemColor: context.colors.surfaceColor,
      unselectedItemColor: context.colors.surfaceColor!.withOpacity(0.5),
      backgroundColor: context.colors.surfaceColor!.withOpacity(0.3),
      currentIndex: context.watch<HomeViewModel>().pageIndex,
      onTap: (index) => context.read<HomeViewModel>().changePage(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            size: 32,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 32,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            size: 32,
          ),
        ),
      ],
    );
  }
}
