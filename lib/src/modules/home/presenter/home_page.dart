import 'package:flutter/material.dart';

import '../domain/entities/char.dart';
import '../infra/models/char_model.dart';
import 'home_controller.dart';
import 'widgets/content_card.dart';
import 'widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static HomePage Function(BuildContext, dynamic) fromModule() {
    return (_, __) => HomePage();
  }

  static const suggestions = [
    'IronMan',
    'Thor',
    'Hulk',
    'Captain America',
    'Spiderman',
    'Wolverine',
    'Deadpool',
    'Black Widow',
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  List<Char>? chars;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(suggestions: HomePage.suggestions),
      body: FutureBuilder<List<Char>>(
        future: controller.loadChars(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            chars = snapshot.data;

            return ListView.builder(
              itemCount: chars?.length,
              itemBuilder: (context, index) {
                final char = chars?[index] ?? CharModel.empty();

                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: ContentCard(char: char),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
