import 'package:flutter/material.dart';
import 'package:sample_bloc_mobile/src/core/extension/extension.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(context.translate('favorites')),
        ),
      );
}
