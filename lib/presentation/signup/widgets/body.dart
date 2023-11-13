import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/router.dart';
import '../../utils/extensions.dart';
import '../../widgets/app_text_form_field.dart';
import '../signup_viewmodel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
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
              hintText: context.localizations.usernameHint,
              icon: Icons.person_outline,
            ),
            const SizedBox(
              height: 20,
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
              onPressed: context.read<SignUpViewModel>().signUp,
              child: Text(context.localizations.signUpNow),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(Routes.initial);
              },
              child: RichText(
                text: TextSpan(
                  text: context.localizations.alreadyHaveAccountQuestion,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colors.surfaceColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: context.localizations.signInLabel,
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
          ],
        ),
      );
}
