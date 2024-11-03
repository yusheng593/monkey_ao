import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monkey_ao/model/animals_model.dart';
import 'package:monkey_ao/screens/animal_details.dart';
import 'package:monkey_ao/service/init_getit.dart';
import 'package:monkey_ao/service/navigation_service.dart';
import 'package:monkey_ao/widgets/cached_image_widget.dart';

class AnimalWidget extends ConsumerWidget {
  const AnimalWidget({super.key, required this.animalModel});
  final AnimalsModel animalModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            getIt<NavigationService>()
                .navigate(AnimalDetails(animalModel: animalModel));
          },
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Hero(
                  tag: animalModel.id,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedImageWidget(imgUrl: animalModel.pic01Url))),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainer
                          .withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      animalModel.nameCh,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
