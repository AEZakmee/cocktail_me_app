import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              child: Text(context.localizations.signIn),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                final buttonClicked = await openSignUpPopup(context);
                print(buttonClicked);
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
            Text(
              context.localizations.forgotPasswordQuestion,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.surfaceColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
}
