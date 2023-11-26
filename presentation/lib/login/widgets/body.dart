import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/router.dart';
import '../../model/login_button_type.dart';
import '../../utils/extensions.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/bordered_app_logo.dart';
import '../signin_viewmodel.dart';
import 'login_bottom_sheet_body.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  Future<LoginButtonType?> openSignUpPopup(BuildContext context) async {
    return showModalBottomSheet<LoginButtonType>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => const LoginBottomSheetBody(),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const BorderedAppLogo(
              size: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              context.localizations.title,
              style: context.textTheme.displayLarge?.copyWith(
                color: context.colors.surfaceColor,
              ),
            ),
            Text(
              context.localizations.subtitle,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.accentColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppTextFormField(
              hintText: context.localizations.emailHint,
              icon: Icons.email_outlined,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextFormField(
              hintText: context.localizations.passwordHint,
              icon: Icons.lock_outlined,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: context.read<SignInViewModel>().signIn,
              child: Text(context.localizations.signInButton),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                final buttonType = await openSignUpPopup(context);
                switch (buttonType) {
                  case LoginButtonType.google:
                    log('Google');

                  case LoginButtonType.apple:
                    log('Apple');

                  case LoginButtonType.anonymous:
                    if (context.mounted) {
                      await context.read<SignInViewModel>().signInAnonymously();
                    }
                    if (context.mounted) {
                      await Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.home,
                        (route) => false,
                      );
                    }

                  case LoginButtonType.register:
                    if (context.mounted) {
                      await Navigator.of(context).pushReplacementNamed(
                        Routes.signup,
                      );
                    }

                  case null:
                }
              },
              child: RichText(
                text: TextSpan(
                  text: context.localizations.doNotHaveAccountQuestion,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colors.surfaceColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: context.localizations.signUpNow,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colors.surfaceColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                log('Forgot pass click');
              },
              child: Text(
                context.localizations.forgotPasswordQuestion,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.surfaceColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
}
