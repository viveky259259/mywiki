import 'package:flutter/material.dart';
import 'package:mywiki/src/common/constant/app_string.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField(this.onSearch, {super.key});

  final Function(String) onSearch;
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: _searchTextController,
            cursorColor: Colors.red,
            decoration: const InputDecoration(
                hintText: AppString.searchHintText,
                hintStyle: TextStyle(color: Colors.black38),
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        GestureDetector(
            onTap: () {
              onSearch(_searchTextController.text);
            },
            child: const Icon(Icons.search))
      ],
    );
  }
}
