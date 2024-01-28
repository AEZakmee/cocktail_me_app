import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_viewmodel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: context.read<HomeViewModel>().pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Center(
          child: Text('Search'),
        ),
        Center(
          child: Text('Home'),
        ),
        Center(
          child: Text('Favs'),
        ),
      ],
    );
  }
}
