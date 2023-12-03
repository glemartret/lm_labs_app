import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_app/src/features/sample_feature/domain/sample_item.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_feature.i18n.dart';
import 'package:lm_labs_app/src/routing/routes.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends ConsumerWidget {
  final List<SampleItem> items;

  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(id: 1),
      SampleItem(id: 2),
      SampleItem(id: 3),
    ],
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text('Sample Items'.i18n),
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
              title: Text(
                'Sample Item %d'.fill([
                  item.id,
                ]),
              ),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () async {
                // Navigate to the details page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                await ref.router.push(
                  SampleItemDetailsRoute(
                    item.id,
                  ).location,
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
