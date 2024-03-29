import 'package:flutter/material.dart';

import '../app/di/locator.dart';
import '../utils/ui_state_builder.dart';
import '../utils/viewmodel_builder.dart';
import '../widgets/main_scaffold.dart';
import 'body.dart';
import 'home_viewmodel.dart';
import 'widgets/app_bar.dart';
import 'widgets/drawer.dart';
import 'widgets/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<HomeViewModel>(
        viewModelBuilder: locator,
        builder: (context, _) => const UIStateBuilder<HomeViewModel>(
          successState: MainScaffold(
            appBar: MainAppBar(),
            body: HomeBody(),
            bottomNavigationBar: MainNavigationBar(),
            drawer: MainDrawer(),
          ),
          errorState: Text('Something went wrong'),
        ),
      );
}
