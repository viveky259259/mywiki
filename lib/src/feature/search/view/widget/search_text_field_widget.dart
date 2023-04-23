import 'package:flutter/material.dart';
import 'package:mywiki/src/common/constant/app_string.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(this.onSearch, this.searchController, {super.key});
  final TextEditingController searchController;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
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
              onSearch(searchController.text);
            },
            child: const Icon(Icons.search))
      ],
    );
  }
}
