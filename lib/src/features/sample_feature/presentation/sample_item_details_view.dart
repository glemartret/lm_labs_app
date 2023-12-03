import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lm_labs_app/src/features/sample_feature/presentation/sample_feature.i18n.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  final int id;

  const SampleItemDetailsView({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Item Details %d'.fill([
              id,
            ]),
          ),
        ),
        body: Center(
          child: Text('More Information Here'.i18n),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('id', id));
  }
}
