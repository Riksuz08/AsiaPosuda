import 'package:flutter/material.dart';

class ThemeBottomWidget extends StatelessWidget {
  final Function(ThemeMode) onChanged;

  const ThemeBottomWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Theme'),
        ),
        ListTile(
          onTap: () {
            onChanged(ThemeMode.system);
          },
          title: const Text('system'),
        ),
        ListTile(
          onTap: () {
            onChanged(ThemeMode.light);
          },
          title: const Text('light'),
        ),
        SafeArea(
          minimum: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            onTap: () {
              onChanged(ThemeMode.dark);
            },
            title: const Text('dark'),
          ),
        ),

      ],
    );
  }
}
