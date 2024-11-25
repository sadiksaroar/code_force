class Animlas {
  final String name;
  final String modelPath;

  Animlas({
    required this.name,
    required this.modelPath,
  });


class AnimalProvider extends ChangeNotifier {
  List<Animlas> animals = [
    Animlas(name: 'Cat', modelPath: 'asstes/cat.glb'),
    Animlas(name: 'Dog', modelPath: 'asstes/dog.glb'),
    Animlas(name: 'Elephant', modelPath: 'asstes/elephant_in_the_rotunda.glb'),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  Animlas get currentAnimal => animals[_currentIndex];

  void changeAnimal(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

}
