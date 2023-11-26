import 'package:flutter/material.dart';

import '../app/di/locator.dart';
import '../utils/viewmodel_builder.dart';
import '../widgets/app_scaffold.dart';
import 'signin_viewmodel.dart';
import 'widgets/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<SignInViewModel>(
        viewModelBuilder: locator,
        builder: (context, viewModel) => const AppScaffold(
          body: Body(),
        ),
      );
}
