import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_app/src/features/settings/application/settings_service.dart';
import 'package:lm_labs_app/src/features/settings/presentation/settings.i18n.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.i18n),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: themeMode,
          // Call the updateThemeMode method any time the
          // user selects a theme.
          onChanged: (mode) async => ref
              .read(themeModeNotifierProvider.notifier)
              .update(mode ?? ThemeMode.system),
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'.i18n),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'.i18n),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'.i18n),
            ),
          ],
        ),
      ),
    );
  }
}
