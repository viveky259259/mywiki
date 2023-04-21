import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField(this.onSearch, {super.key});

  final Function(String) onSearch;
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: _searchTextController,
            decoration: InputDecoration(hintText: 'Search here'),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        IconButton(
            onPressed: () {
              onSearch(_searchTextController.text);
            },
            icon: const Icon(Icons.search))
      ],
    );
  }
}
