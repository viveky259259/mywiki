import 'package:flutter/material.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';

class SearchItemDescription extends StatelessWidget {
  const SearchItemDescription(this.termsModel, {super.key});

  final TermsModel? termsModel;

  @override
  Widget build(BuildContext context) {
    if (termsModel != null ||
        termsModel!.description == null ||
        termsModel!.description!.isEmpty) {
      return const SizedBox();
    }

    return ListView.builder(
      itemBuilder: ((context, index) => Text(termsModel!.description![index])),
      itemCount: termsModel!.description?.length,
    );
  }
}
