import 'package:flutter/material.dart';

class TaxonomyListWidget extends StatelessWidget {
  const TaxonomyListWidget({super.key, required this.animalTaxonomyList});

  final List<String> animalTaxonomyList;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
          animalTaxonomyList.length,
          (index) =>
              chipWidget(item: animalTaxonomyList[index], context: context)),
    );
  }

  Widget chipWidget({required String item, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          item,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primaryContainer,
              fontSize: 18),
        ),
      ),
    );
  }
}
