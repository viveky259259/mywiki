import 'package:flutter/material.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';

class SearchItemDescription extends StatelessWidget {
  const SearchItemDescription(this.termsModel, {super.key});

  final TermsModel? termsModel;

  @override
  Widget build(BuildContext context) {
    String? description = getDescription();
    return description == null
        ? const SizedBox()
        : Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: Colors.white54),
          );
  }

  String? getDescription() {
    if (termsModel == null ||
        termsModel!.description == null ||
        termsModel!.description!.isEmpty) {
      return null;
    }

    return termsModel!.description!
        .reduce((value, element) => '$value, $element');
  }
}
