import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:side_navigation/model/side_navigation_element.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../../theme/cocktail_me_icons.dart';
import '../../../utils/extensions.dart';
import 'home_page_viewmodel.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          ...List.generate(
            viewModel.cocktails.length,
            (index) => Text(viewModel.cocktails[index].title),
          ),
          const HomeSideNavigation()
        ],
      ),
    );
  }
}

class HomeSideNavigation extends StatelessWidget {
  const HomeSideNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();

    return SideNavigation(
      selectedIndex: viewModel.selectedCocktailCategoryIndex,
      onTap: viewModel.changeCocktailCategory,
      selectedIconColor: context.colors.primaryColor,
      unselectedIconColor: context.colors.textColor?.withOpacity(0.5),
      selectedTextStyle: context.textTheme.titleMedium?.copyWith(
        color: context.colors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      unselectedTextStyle: context.textTheme.titleMedium?.copyWith(
        color: context.colors.textColor?.withOpacity(0.5),
      ),
      elements: [
        SideNavigationElement(
          iconData: CocktailMeIcons.logo,
          label: context.localizations.cocktails,
          selectedColor: context.colors.accentColor,
          unselectedColor: context.colors.lightGrey,
        ),
        SideNavigationElement(
          iconData: CocktailMeIcons.shot,
          label: context.localizations.shots,
          selectedColor: context.colors.accentColor,
          unselectedColor: context.colors.grey,
        ),
        SideNavigationElement(
          iconData: CocktailMeIcons.whiskey,
          label: context.localizations.ordinaryDrink,
          selectedColor: context.colors.accentColor,
          unselectedColor: context.colors.darkGrey,
        ),
      ],
    );
  }
}
