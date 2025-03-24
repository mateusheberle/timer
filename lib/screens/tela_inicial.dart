import 'package:flutter/material.dart';
import 'package:timer_alura/components/button.dart';
import 'package:timer_alura/screens/tela_temporizador.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  // Constantes para strings e dimensões
  static const String logoPath = 'assets/Logo/Logo.png';
  static const String heroImagePath = 'assets/Imagens/Imagem tela inicial.png';
  static const double logoWidth = 187.6;
  static const double logoHeight = 48.0;
  static const double heroImageWidth = 381.2;
  static const double heroImageHeight = 319.7;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(logoPath, width: logoWidth, height: logoHeight),
              _buildTextSection(theme, colorScheme),
              Hero(
                tag: 'imagem',
                child: Image.asset(
                  heroImagePath,
                  width: heroImageWidth,
                  height: heroImageHeight,
                  fit: BoxFit.contain,
                ),
              ),
              Button(
                text: 'Quero iniciar!',
                onTap: () => _navigateToTemporizador(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(ThemeData theme, ColorScheme colorScheme) {
    return Text.rich(
      TextSpan(
        text: 'Otimize sua \nprodutividade,',
        style: theme.textTheme.titleSmall?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        children: [
          TextSpan(
            text: '\nmergulhe no que \nimporta',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  void _navigateToTemporizador(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, __, ___) => const TemporizadorTela(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
