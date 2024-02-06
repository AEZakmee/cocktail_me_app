import 'package:flutter/material.dart';

import '../../widgets/app_circle_avatar.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            size: 32,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 12,
              bottom: 8,
            ),
            child: AppCircleAvatar(
              imageUrl: '',
              username: 'Kris',
            ),
          ),
        ],
      );

  @override
  Size get preferredSize => AppBar().preferredSize;
}
