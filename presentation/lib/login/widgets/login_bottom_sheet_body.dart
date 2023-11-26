import 'package:flutter/material.dart';

import '../../model/login_button_type.dart';
import '../../theme/cocktail_me_icons.dart';
import '../../utils/extensions.dart';
import '../../widgets/button_icon_wrapper.dart';

class LoginBottomSheetBody extends StatelessWidget {
  const LoginBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 60,
        top: 40,
        left: 40,
        right: 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.localizations.loginPopupTitle,
            style: context.textTheme.displayMedium?.copyWith(
              color: context.colors.textColor,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ButtonIconWrapper(
            icon: const Icon(
              CocktailMeIcons.google,
              size: 23,
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(context, LoginButtonType.google),
              child: Text(context.localizations.continueWithGoogle),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonIconWrapper(
            icon: const Icon(
              CocktailMeIcons.apple,
              size: 32,
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(context, LoginButtonType.apple),
              child: Text(context.localizations.continueWithApple),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonIconWrapper(
            icon: const Icon(
              CocktailMeIcons.incognito,
              size: 32,
            ),
            child: TextButton(
              onPressed: () => Navigator.pop(
                context,
                LoginButtonType.anonymous,
              ),
              child: Text(context.localizations.continueAsGuest),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: context.colors.textColor?.withOpacity(0.3),
                height: 1,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: Text(
                  'Or',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colors.textColor?.withOpacity(0.5),
                  ),
                ),
              ),
              Container(
                color: context.colors.textColor?.withOpacity(0.3),
                height: 1,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, LoginButtonType.register),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.primaryColor,
              foregroundColor: context.colors.surfaceColor,
            ),
            child: Text(context.localizations.createAccount),
          ),
        ],
      ),
    );
  }
}
