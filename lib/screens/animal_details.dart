import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/model/animals_model.dart';
import 'package:monkey_ao/widgets/cached_image_widget.dart';
import 'package:monkey_ao/widgets/favorite_button_widget.dart';
import 'package:monkey_ao/widgets/taxonomy_list_widget.dart';

class AnimalDetails extends ConsumerWidget {
  const AnimalDetails({super.key, required this.animalModel});
  final AnimalsModel animalModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: animalModel.id,
              child: SizedBox(
                  height: size.height * 0.45,
                  width: double.infinity,
                  child: CachedImageWidget(imgUrl: animalModel.pic01Url)),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: Column(
                            children: [
                              Text(
                                animalModel.nameCh,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TaxonomyListWidget(
                                animalTaxonomyList:
                                    animalModel.animalTaxonomyList,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '- 特徵 -',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 25),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                animalModel.feature,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                '- 食物 -',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 25),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                animalModel.diet,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 100,
                          child: const FavoriteButtonWidget(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFA5B68D).withOpacity(0.8),
                    shape: BoxShape.circle),
                child: const BackButton(
                  color: Color(0xFF674636),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
