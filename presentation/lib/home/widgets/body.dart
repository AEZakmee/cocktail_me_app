import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/main_viewmodel.dart';
import '../../utils/extensions.dart';
import '../../utils/ui_state_builder.dart';
import '../home_viewmodel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return UIStateBuilder(
      viewModel.uiState,
      successState: SafeArea(
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      viewModel.cocktailsLength,
                      (index) => Text(
                        viewModel.cocktails[index].strDrink,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LocaleSwitcher(name: 'English', locale: Locale('en')),
                  LocaleSwitcher(name: 'Български', locale: Locale('bg')),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: viewModel.logOut,
                child: Text(context.localizations.signOut),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocaleSwitcher extends StatelessWidget {
  const LocaleSwitcher({
    required this.name,
    required this.locale,
    super.key,
  });

  final String name;
  final Locale locale;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
          onTap: () => context.read<MainViewModel>().setLocale(locale),
          child: Text(
            name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      );
}
