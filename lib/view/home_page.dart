import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../utils/games_data.dart';
import '../model/game.dart';
import '../components/game_card.dart';
import '../components/custom_drawer.dart';

class HomePage extends StatelessWidget {
  final String filterPlatform;

  const HomePage({super.key, this.filterPlatform = 'All'});

  @override
  Widget build(BuildContext context) {
    final List<Game> games = GamesData.filterByPlatform(filterPlatform);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.cardDark,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.pink),
        title: Text(
          'GG',
          style: GoogleFonts.orbitron(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: AppColors.textSecondary),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header banner
          _HeaderBanner(platform: filterPlatform),

          // Section title
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  filterPlatform == 'All' ? 'ALL GAMES' : '${filterPlatform.toUpperCase()} GAMES',
                  style: GoogleFonts.orbitron(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${games.length} titles',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Game list
          Expanded(
            child: games.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.videogame_asset_off,
                            color: AppColors.textSecondary, size: 60),
                        const SizedBox(height: 16),
                        Text(
                          'No games found',
                          style: GoogleFonts.orbitron(
                            color: AppColors.textSecondary,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      return GameCard(game: games[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBanner extends StatelessWidget {
  final String platform;

  const _HeaderBanner({required this.platform});

  String get _subtitle {
    switch (platform) {
      case 'PC': return 'Games available on PC — check laptop specs below';
      case 'PlayStation': return 'Exclusive & multiplatform PlayStation titles';
      case 'Xbox': return 'Xbox & Game Pass titles';
      case 'Mobile': return 'Games you can play on your phone';
      default: return 'Browse games and check PC specs';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.darkBlue, AppColors.darkPurple, AppColors.cardDark],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform == 'All' ? 'Find Your Game' : platform,
                  style: GoogleFonts.orbitron(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _subtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.pink.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.pink.withOpacity(0.5)),
            ),
            child: const Icon(Icons.sports_esports, color: AppColors.pink, size: 32),
          ),
        ],
      ),
    );
  }
}
