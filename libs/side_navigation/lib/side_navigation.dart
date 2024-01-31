library side_navigation;

import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:side_navigation/model/side_navigation_position.dart';

import 'half_sided_hexagon.dart';
import 'model/side_navigation_element.dart';

class SideNavigation extends StatelessWidget {
  const SideNavigation({
    required this.elements,
    required this.selectedIndex,
    this.onTap,
    this.sideNavigationPosition = SideNavigationPosition.leading,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.selectedTextStyle,
    this.unselectedTextStyle,
    super.key,
  });

  final List<SideNavigationElement> elements;
  final int selectedIndex;
  final Function(int)? onTap;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final TextStyle? selectedTextStyle;
  final TextStyle? unselectedTextStyle;
  final SideNavigationPosition sideNavigationPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Indexer(
          children: List.generate(
            elements.length,
            (index) {
              final element = elements[index];
              final isSelected = index == selectedIndex;
              return Indexed(
                index: isSelected ? 5 : elements.length - index,
                child: Padding(
                  padding: EdgeInsets.only(top: (160 * index).toDouble()),
                  child: GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap!(index);
                      }
                    },
                    child: HalfSidedHexagon(
                      inverted: sideNavigationPosition.isInverted(),
                      color: isSelected
                          ? element.selectedColor
                          : element.unselectedColor,
                      icon: Icon(
                        element.iconData,
                        size: 32,
                        color: isSelected
                            ? selectedIconColor
                            : unselectedIconColor,
                      ),
                      text: (element.label != null)
                          ? Text(
                              element.label!,
                              textAlign: TextAlign.center,
                              style: isSelected
                                  ? selectedTextStyle
                                  : unselectedTextStyle,
                            )
                          : null,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
