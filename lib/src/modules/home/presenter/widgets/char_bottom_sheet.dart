import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../domain/entities/char.dart';

class CharBottomSheet extends StatelessWidget {
  const CharBottomSheet({
    super.key,
    required this.char,
  });

  final Char char;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Wrap(
      children: [
        Image.network(char.thumbnail),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(char.name, style: textTheme.titleLarge),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(char.description, style: textTheme.bodySmall),
        ),
      ],
    );
  }
}
