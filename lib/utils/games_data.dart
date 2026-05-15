import '../model/game.dart';

class GamesData {
  static List<Game> allGames = [
    Game(
      title: 'Cyberpunk 2077',
      genre: 'RPG',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9f/Cyberpunk_2077_box_art.jpg',
      platforms: ['PC', 'PlayStation', 'Xbox'],
      description: 'An open-world action RPG set in the megalopolis of Night City.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i7-12700K / AMD Ryzen 7 5800X',
        gpu: 'NVIDIA RTX 3080 / AMD RX 6800 XT',
        ram: '16 GB DDR4',
        storage: '70 GB SSD',
        os: 'Windows 10/11 64-bit',
      ),
    ),
    Game(
      title: 'Elden Ring',
      genre: 'Action RPG',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/b/b9/Elden_Ring_Box_art.jpg',
      platforms: ['PC', 'PlayStation', 'Xbox'],
      description: 'A challenging open-world action RPG from FromSoftware.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i7-8700K / AMD Ryzen 5 3600X',
        gpu: 'NVIDIA GTX 1070 8GB / AMD RX Vega 56 8GB',
        ram: '12 GB DDR4',
        storage: '60 GB SSD',
        os: 'Windows 10/11 64-bit',
      ),
    ),
    Game(
      title: 'God of War',
      genre: 'Action Adventure',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a7/God_of_War_4_cover.jpg',
      platforms: ['PC', 'PlayStation'],
      description: 'Kratos and his son Atreus journey through Norse mythology.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i5-6600K / AMD Ryzen 5 2600X',
        gpu: 'NVIDIA GTX 1060 6GB / AMD RX 5600 XT',
        ram: '8 GB DDR4',
        storage: '70 GB SSD',
        os: 'Windows 10 64-bit',
      ),
    ),
    Game(
      title: 'Forza Horizon 5',
      genre: 'Racing',
      imageUrl: 'https://store-images.s-microsoft.com/image/apps.49800.13718773309227929.bebdcc0e-1ed5-4778-8732-f4ef65a2f445.9ac09d39-064d-466c-81ca-2f1b6f0b95c5',
      platforms: ['PC', 'Xbox'],
      description: 'The ultimate open-world racing experience set in Mexico.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i5-8400 / AMD Ryzen 5 1500X',
        gpu: 'NVIDIA GTX 1070 / AMD RX 590',
        ram: '16 GB DDR4',
        storage: '110 GB SSD',
        os: 'Windows 10/11 64-bit',
      ),
    ),
    Game(
      title: 'Minecraft',
      genre: 'Sandbox',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDrTWLRoJL-Pm7bNEN2rW8dFF8tqrYuxM_AA&s',
      platforms: ['PC', 'PlayStation', 'Xbox', 'Mobile', 'Nintendo Switch'],
      description: 'Build, explore, and survive in an infinite blocky world.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i5-4690 / AMD A10-7800',
        gpu: 'NVIDIA GTX 700 / AMD Radeon R9 series',
        ram: '8 GB DDR4',
        storage: '4 GB SSD',
        os: 'Windows 7/8/10 64-bit',
      ),
    ),
    Game(
      title: 'Valorant',
      genre: 'FPS',
      imageUrl: 'https://store-images.s-microsoft.com/image/apps.21507.13663857844271189.4c1de202-3961-4c40-a0aa-7f4f1388775a.20ed7782-0eda-4f9d-b421-4cc47492edc6',
      platforms: ['PC'],
      description: 'A tactical 5v5 character-based shooter by Riot Games.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i3-4150 / AMD Ryzen 3 1200',
        gpu: 'NVIDIA GTX 1050 Ti / AMD R9 285',
        ram: '4 GB DDR4',
        storage: '10 GB SSD',
        os: 'Windows 10 64-bit',
      ),
    ),
    Game(
      title: 'The Last of Us Part I',
      genre: 'Action Adventure',
      imageUrl: 'https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1888930/header.jpg?t=1750959031',
      platforms: ['PC', 'PlayStation'],
      description: 'A post-apocalyptic survival thriller with cinematic storytelling.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i7-8700 / AMD Ryzen 5 3600',
        gpu: 'NVIDIA RTX 2080 Super / AMD RX 5700 XT',
        ram: '16 GB DDR5',
        storage: '100 GB SSD',
        os: 'Windows 10/11 64-bit',
      ),
    ),
    Game(
      title: 'EA Sports FC 24',
      genre: 'Sports',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_J4VwaFN4cj1vUTXkmrC6mSCsi5mvTEzHw&s',
      platforms: ['PC', 'PlayStation', 'Xbox', 'Nintendo Switch'],
      description: 'The world\'s most popular football simulation game.',
      laptopSpecs: LaptopSpecs(
        cpu: 'Intel Core i5-6600K / AMD Ryzen 5 1600',
        gpu: 'NVIDIA GTX 1050 Ti / AMD RX 570',
        ram: '8 GB DDR4',
        storage: '50 GB SSD',
        os: 'Windows 10/11 64-bit',
      ),
    ),
  ];

  static List<Game> filterByPlatform(String platform) {
    if (platform == 'All') return allGames;
    return allGames.where((g) => g.platforms.contains(platform)).toList();
  }
}
