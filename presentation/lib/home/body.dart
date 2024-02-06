import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';
import 'pages/home/home_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: context.read<HomeViewModel>().pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Center(
          child: Text('Search'),
        ),
        HomePage(),
        Center(
          child: Text('Favorites'),
        ),
      ],
    );
  }
}
