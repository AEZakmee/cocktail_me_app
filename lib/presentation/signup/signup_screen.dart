import 'package:flutter/material.dart';

import '../../app/di/locator.dart';
import '../utils/viewmodel_builder.dart';
import 'signup_viewmodel.dart';
import 'widgets/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<SignUpViewModel>(
        viewModelBuilder: locator,
        builder: (context, viewModel) => const Scaffold(
          body: Body(),
        ),
      );
}
