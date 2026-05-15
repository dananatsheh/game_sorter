import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/game.dart';
import '../utils/app_colors.dart';

class GameDetailPage extends StatelessWidget {
  final Game game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Custom app bar with game image
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: AppColors.cardDark,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    game.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.darkPurple,
                      child: const Icon(Icons.gamepad, color: AppColors.pink, size: 80),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, AppColors.background],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and genre
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          game.title,
                          style: GoogleFonts.orbitron(
                            color: AppColors.textPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          game.genre,
                          style: GoogleFonts.rajdhani(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    game.description,
                    style: GoogleFonts.rajdhani(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Platforms section
                  _SectionTitle(title: 'Available Platforms'),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: game.platforms
                        .map((p) => _PlatformBadge(label: p))
                        .toList(),
                  ),

                  const SizedBox(height: 24),

                  // Laptop specs section
                  _SectionTitle(title: 'Recommended PC Specs'),
                  const SizedBox(height: 12),

                  _SpecsCard(specs: game.laptopSpecs),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.orbitron(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _SpecsCard extends StatelessWidget {
  final LaptopSpecs specs;

  const _SpecsCard({required this.specs});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          _SpecRow(icon: Icons.memory, label: 'CPU', value: specs.cpu),
          const Divider(color: AppColors.divider, height: 20),
          _SpecRow(icon: Icons.videogame_asset, label: 'GPU', value: specs.gpu),
          const Divider(color: AppColors.divider, height: 20),
          _SpecRow(icon: Icons.developer_board, label: 'RAM', value: specs.ram),
          const Divider(color: AppColors.divider, height: 20),
          _SpecRow(icon: Icons.storage, label: 'Storage', value: specs.storage),
          const Divider(color: AppColors.divider, height: 20),
          _SpecRow(icon: Icons.desktop_windows, label: 'OS', value: specs.os),
        ],
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _SpecRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.pink, size: 20),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.rajdhani(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width - 130,
              child: Text(
                value,
                style: GoogleFonts.rajdhani(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PlatformBadge extends StatelessWidget {
  final String label;

  const _PlatformBadge({required this.label});

  Color get _color {
    switch (label) {
      case 'PC': return AppColors.blue;
      case 'PlayStation': return AppColors.purple;
      case 'Xbox': return const Color(0xFF107C10);
      case 'Nintendo Switch': return const Color(0xFFE4000F);
      case 'Mobile': return AppColors.darkBlue;
      default: return AppColors.darkPurple;
    }
  }

  IconData get _icon {
    switch (label) {
      case 'PC': return Icons.computer;
      case 'PlayStation': return Icons.sports_esports;
      case 'Xbox': return Icons.sports_esports;
      case 'Nintendo Switch': return Icons.sports_esports;
      case 'Mobile': return Icons.phone_android;
      default: return Icons.gamepad;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: _color, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.rajdhani(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
