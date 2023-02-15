import 'package:flutter/material.dart';

import '../../../../core/styles/assets_path.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.suggestions = const [],
  });

  final List<String> suggestions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Image.asset(
        AssetsPath.marvelLogo,
        height: 28,
      ),
      actions: [
        GestureDetector(
          child: const Icon(Icons.search, size: 32),
          onTap: () => showSearch<String>(
            context: context,
            delegate: ContentSearchDelegate(suggestions: suggestions),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ContentSearchDelegate extends SearchDelegate<String> {
  final List<String> suggestions;

  ContentSearchDelegate({required this.suggestions});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      GestureDetector(
        child: const Icon(Icons.cleaning_services_rounded),
        onTap: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final lowerCaseQuery = query.toLowerCase();
    final filteredSuggestions = suggestions
        .where((item) => item.toLowerCase().contains(lowerCaseQuery))
        .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        final suggestion = filteredSuggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
