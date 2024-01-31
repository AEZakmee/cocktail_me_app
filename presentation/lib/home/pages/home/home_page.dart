import 'package:flutter/material.dart';

import '../../../app/di/locator.dart';
import '../../../utils/viewmodel_builder.dart';
import 'body.dart';
import 'home_page_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<HomePageViewModel>(
        viewModelBuilder: locator,
        builder: (context, viewModel) => const HomePageBody(),
      );
}
