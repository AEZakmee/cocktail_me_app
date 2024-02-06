import 'package:flutter/material.dart';

import '../../../app/di/locator.dart';
import '../../../utils/ui_state_builder.dart';
import '../../../utils/viewmodel_builder.dart';
import 'body.dart';
import 'home_page_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<HomePageViewModel>(
        viewModelBuilder: locator,
        builder: (context, _) => const UIStateBuilder<HomePageViewModel>(
          successState: HomePageBody(),
        ),
      );
}
