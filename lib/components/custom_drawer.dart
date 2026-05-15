import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import '../view/home_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _goToHome(BuildContext context, String platform) {
    Navigator.pop(context); // close drawer
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage(filterPlatform: platform)),
    );
  }

  void _showAbout(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'About GG',
          style: GoogleFonts.orbitron(color: AppColors.textPrimary, fontSize: 16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GG is a game sorter app that helps you discover games by platform and check the recommended PC specs needed to run each title smoothly.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'Platforms covered:',
              style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            _aboutRow(Icons.computer, 'PC'),
            _aboutRow(Icons.sports_esports, 'PlayStation'),
            _aboutRow(Icons.sports_esports, 'Xbox'),
            _aboutRow(Icons.phone_android, 'Mobile'),
            _aboutRow(Icons.sports_esports, 'Nintendo Switch'),
            const SizedBox(height: 16),
            const Text(
              'Built with Flutter 💙',
              style: TextStyle(color: AppColors.pink, fontSize: 13),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close', style: TextStyle(color: AppColors.pink)),
          ),
        ],
      ),
    );
  }

  Widget _aboutRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(icon, color: AppColors.pink, size: 16),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.cardDark,
      child: SafeArea(
        child: Column(
          children: [
            _DrawerHeader(),
            const Divider(color: AppColors.divider, thickness: 1),
            _DrawerTile(
              icon: Icons.gamepad,
              label: 'All Games',
              onTap: () => _goToHome(context, 'All'),
            ),
            _DrawerTile(
              icon: Icons.computer,
              label: 'PC Games',
              onTap: () => _goToHome(context, 'PC'),
            ),
            _DrawerTile(
              icon: Icons.sports_esports,
              label: 'PlayStation Games',
              onTap: () => _goToHome(context, 'PlayStation'),
            ),
            _DrawerTile(
              icon: Icons.sports_esports,
              label: 'Xbox Games',
              onTap: () => _goToHome(context, 'Xbox'),
            ),
            _DrawerTile(
              icon: Icons.phone_android,
              label: 'Mobile Games',
              onTap: () => _goToHome(context, 'Mobile'),
            ),
            const Divider(color: AppColors.divider, thickness: 1),
            _DrawerTile(
              icon: Icons.info_outline,
              label: 'About',
              onTap: () => _showAbout(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [AppColors.pink, AppColors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(Icons.sports_esports, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GG',
                style: GoogleFonts.orbitron(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
              const Text(
                'Find your perfect game',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.pink, size: 22),
      title: Text(
        label,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
