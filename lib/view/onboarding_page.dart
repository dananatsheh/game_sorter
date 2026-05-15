import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/app_colors.dart';
import 'home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_OnboardSlide> _slides = [
    _OnboardSlide(
      icon: Icons.computer,
      platformName: 'PC Gaming',
      platformFilter: 'PC',
      tagline: 'Ultimate Power & Freedom',
      description:
          'PC gaming offers the highest performance, best graphics, and the largest game library. '
          'Upgrade your hardware anytime and enjoy games at 4K, high framerates, and ultra settings. '
          'GG shows you exactly what specs your laptop needs for every title.',
      gradient: [AppColors.darkBlue, AppColors.blue],
      accentColor: const Color(0xFF4FC3F7),
    ),
    _OnboardSlide(
      icon: Icons.sports_esports,
      platformName: 'Xbox',
      platformFilter: 'Xbox',
      tagline: 'Play Anywhere. Game Pass Ready.',
      description:
          'Xbox delivers a seamless gaming experience across console and PC with Xbox Game Pass. '
          'With exclusive titles like Forza Horizon and Halo, it\'s the home of blockbuster gaming. '
          'GG helps you discover which games shine best on Xbox.',
      gradient: [const Color(0xFF0A2A0A), const Color(0xFF107C10)],
      accentColor: const Color(0xFF4CAF50),
    ),
    _OnboardSlide(
      icon: Icons.gamepad,
      platformName: 'PlayStation',
      platformFilter: 'PlayStation',
      tagline: 'The Home of Exclusives',
      description:
          'PlayStation is renowned for its world-class exclusive titles like God of War, '
          'The Last of Us, and Spider-Man. Experience cinematic storytelling like no other platform. '
          'GG tells you which PlayStation games are also available on PC.',
      gradient: [AppColors.darkPurple, AppColors.purple],
      accentColor: const Color(0xFF7986CB),
    ),
  ];

  void _goToHome() {
    final selectedPlatform = _slides[_currentPage].platformFilter;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(filterPlatform: selectedPlatform),
      ),
    );
  }

  void _skipToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage(filterPlatform: 'All')),
    );
  }

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Slides take all available space
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemCount: _slides.length,
              itemBuilder: (context, index) {
                return _SlideContent(slide: _slides[index]);
              },
            ),
          ),

          // Bottom controls pinned below, never overlaps text
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 8, 40, 40),
            child: Column(
              children: [
                // Dot indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _slides.length,
                    (i) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == i ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == i
                            ? AppColors.pink
                            : AppColors.textSecondary.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Main button
                GestureDetector(
                  onTap: _nextPage,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.pink, AppColors.purple],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        _currentPage == _slides.length - 1
                            ? 'BROWSE ${_slides[_currentPage].platformName.toUpperCase()}  🎮'
                            : 'NEXT',
                        style: GoogleFonts.orbitron(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),

                // See All button
                TextButton(
                  onPressed: _skipToHome,
                  child: const Text(
                    'See All Games',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SlideContent extends StatelessWidget {
  final _OnboardSlide slide;

  const _SlideContent({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Icon circle with glow
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: slide.gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: slide.accentColor.withOpacity(0.4),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(slide.icon, color: Colors.white, size: 64),
          ),

          const SizedBox(height: 40),

          // Platform name
          Text(
            slide.platformName,
            style: GoogleFonts.orbitron(
              color: AppColors.textPrimary,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          // Tagline
          Text(
            slide.tagline,
            style: TextStyle(
              color: slide.accentColor,
              fontSize: 12,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Description
          Text(
            slide.description,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _OnboardSlide {
  final IconData icon;
  final String platformName;
  final String platformFilter;
  final String tagline;
  final String description;
  final List<Color> gradient;
  final Color accentColor;

  const _OnboardSlide({
    required this.icon,
    required this.platformName,
    required this.platformFilter,
    required this.tagline,
    required this.description,
    required this.gradient,
    required this.accentColor,
  });
}
