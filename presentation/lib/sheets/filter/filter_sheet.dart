import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:domain/model/cocktail/cocktail_strength.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/di/locator.dart';
import '../../utils/extensions.dart';
import '../../utils/ui_state_builder.dart';
import '../../utils/viewmodel_builder.dart';
import 'filter_sheet_viewmodel.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<FilterSheetViewModel>(
        viewModelBuilder: locator,
        builder: (context, _) => const UIStateBuilder<FilterSheetViewModel>(
          successState: FilterSheetBody(),
        ),
      );
}

class FilterSheetBody extends StatelessWidget {
  const FilterSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FilterSheetViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                context.localizations.type,
                style: context.textTheme.titleLarge,
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                ...List.generate(
                  CocktailCategory.values.length,
                  (index) {
                    final category = CocktailCategory.values[index];
                    return FilterChip(
                      label: Text(
                        category.getLocalization(context),
                      ),
                      showCheckmark: false,
                      selected: viewModel.isCategorySelected(category),
                      onSelected: (_) => viewModel.updateCategory(category),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                context.localizations.strength,
                style: context.textTheme.titleLarge,
              ),
            ),
            Wrap(
              spacing: 8,
              children: [
                ...List.generate(
                  CocktailStrength.values.length,
                  (index) {
                    final strength = CocktailStrength.values[index];
                    return FilterChip(
                      label: Text(
                        strength.getLocalization(context),
                      ),
                      showCheckmark: false,
                      selected: viewModel.isStrengthSelected(strength),
                      onSelected: (_) => viewModel.updateStrength(strength),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  context.localizations.ingredients,
                  style: context.textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            if (viewModel.selectedIngredients.isEmpty)
              Text(
                context.localizations.noIngredients,
                style: context.textTheme.titleSmall,
              ),
            if (viewModel.selectedIngredients.isNotEmpty)
              ExpandableText(
                viewModel.selectedIngredients.map((e) => e.title).join(', '),
                expandText: context.localizations.seeAll,
                collapseText: context.localizations.collapse,
                maxLines: 3,
                linkColor: context.colors.accentColor,
                style: context.textTheme.titleSmall,
                linkStyle: context.textTheme.bodyLarge,
                animationDuration: const Duration(milliseconds: 300),
                animation: true,
              ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: viewModel.resetFilters,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      context.localizations.resetFilters,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
