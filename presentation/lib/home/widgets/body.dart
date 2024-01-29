import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:side_navigation/model/side_navigation_element.dart';
import 'package:side_navigation/model/side_navigation_position.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../theme/cocktail_me_icons.dart';
import '../../utils/extensions.dart';
import '../home_viewmodel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: context.read<HomeViewModel>().pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SideNavigation(
            selectedIndex: 0,
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
                iconData: CocktailMeIcons.sad,
                label: context.localizations.nonalcoholic,
                selectedColor: context.colors.accentColor,
                unselectedColor: context.colors.darkGrey,
              ),
            ],
          ),
        ),
        const Center(
          child: Text('Home'),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SideNavigation(
            selectedIndex: 0,
            sideNavigationPosition: SideNavigationPosition.trailing,
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
                iconData: CocktailMeIcons.sad,
                label: context.localizations.nonalcoholic,
                selectedColor: context.colors.accentColor,
                unselectedColor: context.colors.darkGrey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
