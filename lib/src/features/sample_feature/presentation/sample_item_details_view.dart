import 'package:flutter/material.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_feature.i18n.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Item Details'.i18n),
      ),
      body: Center(
        child: Text('More Information Here'.i18n),
      ),
    );
}
