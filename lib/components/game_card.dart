import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/game.dart';
import '../utils/app_colors.dart';
import '../view/game_detail_page.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameDetailPage(game: game)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.divider, width: 1),
        ),
        child: Row(
          children: [
            // Game cover image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                game.imageUrl,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 100,
                  height: 120,
                  color: AppColors.darkPurple,
                  child: const Icon(Icons.gamepad, color: AppColors.pink, size: 40),
                ),
              ),
            ),
            const SizedBox(width: 14),
            // Game info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      game.title,
                      style: GoogleFonts.orbitron(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Genre badge
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.pink.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.pink.withOpacity(0.5)),
                      ),
                      child: Text(
                        game.genre,
                        style: const TextStyle(
                          color: AppColors.pink,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Description - plain system font, no Rajdhani
                    Text(
                      game.description,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Platform chips
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: game.platforms.map((p) => _PlatformChip(label: p)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformChip extends StatelessWidget {
  final String label;

  const _PlatformChip({required this.label});

  Color get _color {
    switch (label) {
      case 'PC':
        return AppColors.blue;
      case 'PlayStation':
        return AppColors.purple;
      case 'Xbox':
        return const Color(0xFF107C10);
      case 'Nintendo Switch':
        return const Color(0xFFE4000F);
      case 'Mobile':
        return AppColors.darkBlue;
      default:
        return AppColors.darkPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.35),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: _color.withOpacity(0.7), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 9,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
