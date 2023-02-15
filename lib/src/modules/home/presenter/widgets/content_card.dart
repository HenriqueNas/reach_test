import 'package:flutter/material.dart';

import '../../domain/entities/char.dart';
import 'char_bottom_sheet.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.char,
    this.height = 250.0,
  });

  final double height;
  final Char char;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          context: context,
          builder: (_) => CharBottomSheet(char: char),
          isScrollControlled: true,
        );
      },
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Image.network(
                char.thumbnail,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      char.name,
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      char.description,
                      style: textTheme.bodySmall,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('More Info', style: textTheme.labelMedium),
                        Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
