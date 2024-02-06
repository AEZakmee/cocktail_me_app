import 'package:domain/model/cocktail/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/extensions.dart';
import 'home_page_viewmodel.dart';
import 'widgets/filters_row.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.localizations.title,
            style: context.textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            context.localizations.subtitle,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.accentColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const FiltersRow(),
        Selector<HomePageViewModel, List<Cocktail>>(
          selector: (buildContext, viewModel) => viewModel.cocktails,
          builder: (context, cocktails, child) {
            return Column(
              children: [
                ...List.generate(
                  cocktails.length,
                  (index) => Text(cocktails[index].title),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
