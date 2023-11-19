import 'package:flutter/material.dart';

import '../../model/login_button_type.dart';
import '../../theme/cocktail_me_icons.dart';
import '../../utils/extensions.dart';

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
          TextButton.icon(
            onPressed: () => Navigator.pop(context, LoginButtonType.google),
            label: Text(context.localizations.continueWithGoogle),
            icon: const Padding(
              padding: EdgeInsets.only(
                right: 8,
              ),
              child: Icon(
                CocktailMeIcons.google,
                size: 25,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
            onPressed: () => Navigator.pop(context, LoginButtonType.apple),
            label: Text(context.localizations.continueWithApple),
            icon: const Padding(
              padding: EdgeInsets.only(
                right: 6,
              ),
              child: Icon(
                CocktailMeIcons.apple,
                size: 35,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton.icon(
            onPressed: () => Navigator.pop(context, LoginButtonType.anonymous),
            label: Text(context.localizations.continueAsGuest),
            icon: const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 8,
              ),
              child: Icon(
                CocktailMeIcons.incognito,
                size: 30,
              ),
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
