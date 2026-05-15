class Game {
  final String title;
  final String genre;
  final String imageUrl;
  final List<String> platforms;
  final String description;
  final LaptopSpecs laptopSpecs;

  Game({
    required this.title,
    required this.genre,
    required this.imageUrl,
    required this.platforms,
    required this.description,
    required this.laptopSpecs,
  });
}

class LaptopSpecs {
  final String cpu;
  final String gpu;
  final String ram;
  final String storage;
  final String os;

  LaptopSpecs({
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.storage,
    required this.os,
  });
}
