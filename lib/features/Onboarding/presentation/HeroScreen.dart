import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme_data.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.primary, colorScheme.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                Icon(
                  Icons.receipt_long,
                  size: 80,
                  color: colorScheme.onPrimary,
                ),
                const SizedBox(height: 24),
                Text(
                  'Receiptify',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sourceCodePro(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Track travel expenses, simplified.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: colorScheme.onPrimary.withOpacity(0.85),
                  ),
                ),
                const Spacer(flex: 2),

                ElevatedButton(
                  onPressed: () => GoRouter.of(context).replace('/register'),
                  child: const Text("Create an Account"),
                ),

                const SizedBox(height: 12.0),

                OutlinedButton(
                  style: MyThemes.onPrimaryOutlinedButton.copyWith(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                  onPressed: () => GoRouter.of(context).push('/login'),
                  child: const Text("Login"),
                ),
                const SizedBox(height: 24.0), // Added spacing
                // New link to the onboarding screen
                TextButton(
                  onPressed:
                      () => GoRouter.of(context).pushReplacement('/home'),
                  child: Text(
                    'Enter as guest',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      decoration: TextDecoration.underline,
                      decorationColor: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
