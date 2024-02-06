import 'package:domain/model/cocktail/cocktail_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../sheets/filter/filter_sheet.dart';
import '../../../../utils/extensions.dart';
import '../home_page_viewmodel.dart';

class FiltersRow extends StatelessWidget {
  const FiltersRow({super.key});

  Future<void> openFilterSheet(BuildContext context) async {
    final viewModel = context.read<HomePageViewModel>();
    await showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: context.screenSize.height * 0.7,
        width: double.infinity,
        child: const SafeArea(
          child: FilterSheet(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          ...List.generate(
            CocktailCategory.values.length,
            (index) {
              final category = CocktailCategory.values[index];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(
                    category.getLocalization(context),
                  ),
                  showCheckmark: false,
                  selected: viewModel.isCategorySelected(category),
                  onSelected: (_) => viewModel.updateCategory(category),
                ),
              );
            },
          ),
          ActionChip(
            avatar: const Icon(Icons.filter_list),
            label: Text(
              context.localizations.filters,
            ),
            color: MaterialStateProperty.resolveWith((_) {
              return context.colors.accentColor;
            }),
            onPressed: () {
              openFilterSheet(context);
            },
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
