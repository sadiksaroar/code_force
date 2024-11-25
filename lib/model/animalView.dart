import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';
import 'package:task_2_animals/provider/animalProvider.dart';

class AnimalViewer extends StatelessWidget {
  const AnimalViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3D Animal Viewer'),
      ),
      body: Column(
        children: [
          // 3D Model Viewer with Fade Transition
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: ModelViewer(
                key: ValueKey(AnimalProvider.currentAnimal.modelPath),
                src: AnimalProvider.currentAnimal.modelPath,
                alt: "A 3D model of ${AnimalProvider.currentAnimal.name}",
                autoRotate: true,
                cameraControls: true,
              ),
            ),
          ),
          // Buttons to switch animals
          AnimalSelector(),
        ],
      ),
    );
  }
}

// Widget for Animal Selector Buttons
class AnimalSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final animalProvider = Provider.of<AnimalProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(animalProvider.animals.length, (index) {
          final isSelected = animalProvider.currentIndex == index;

          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue : Colors.grey,
            ),
            onPressed: () {
              animalProvider.changeAnimal(index);
            },
            child: Text(
              animalProvider.animals[index].name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        }),
      ),
    );
  }
}
