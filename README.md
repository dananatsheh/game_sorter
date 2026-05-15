# 🎮 Game Sorter – Flutter App

A Flutter application that displays video games sorted by platform and shows recommended laptop specifications for each game.

## Features
- Browse games by platform (PC, PlayStation, Xbox, Mobile, Nintendo Switch)
- View detailed laptop/PC specs required to run each game
- Dark themed UI with pink/purple/blue accent colors
- Side drawer navigation
- Tap any game to see full details and specs

## Screenshots
> Dark gaming theme with `#be0a81` pink, dark purple, and dark blue accents.

## How to Run

```bash
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── main.dart               # Entry point
├── model/
│   └── game.dart           # Game & LaptopSpecs classes
├── view/
│   ├── home_page.dart      # Main screen with game list
│   └── game_detail_page.dart # Game details & specs screen
├── components/
│   ├── game_card.dart      # Reusable game list item
│   └── custom_drawer.dart  # Side navigation drawer
└── utils/
    ├── app_colors.dart     # Color constants
    └── games_data.dart     # Game data & filter logic
```

## Upload to GitHub

```bash
git init
git add .
git status
git commit -m "first commit - Game Sorter Flutter app"
git remote add origin https://github.com/YOUR_USERNAME/game_sorter.git
git push -u origin main
```

## Tech Used
- Flutter 3.x
- Dart
- `google_fonts` package (Orbitron + Rajdhani fonts)
- Material Design (Dark theme)

## Topics Covered (Assignment Checklist)
- ✅ MaterialApp
- ✅ Scaffold
- ✅ AppBar
- ✅ Row & Column
- ✅ Container
- ✅ Images (Network images for game covers)
- ✅ Drawer (Custom side navigation)
- ✅ Good UI Design (Dark gaming aesthetic)
