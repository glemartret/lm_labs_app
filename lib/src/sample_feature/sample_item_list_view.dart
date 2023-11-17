import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lm_labs_app/src/sample_feature/sample_item.dart';
import 'package:lm_labs_app/src/sample_feature/sample_item_details_view.dart';
import 'package:lm_labs_app/src/settings/settings_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  static const routeName = '/';

  final List<SampleItem> items;

  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Sample Items'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),

        // To work with lists that may contain a large number of items,
        // it’s best to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor
        // lazily builds Widgets as they’re scrolled into view.
        body: ListView.builder(
          // Providing a restorationId allows the ListView to restore the
          // scroll position when a user leaves and returns to the app after it
          // has been killed while running in the background.
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: Text('SampleItem ${item.id}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                );
              },
            );
          },
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(IterableProperty<SampleItem>('items', items));
  }
}
