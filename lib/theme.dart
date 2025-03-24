import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  textTheme: TextTheme(
    // Heading small
    headlineSmall: GoogleFonts.unbounded(
      fontSize: 37 * 1.2,
      height: 1.2,
      fontWeight: FontWeight.bold,
    ),
    // Subtitle large
    titleLarge: GoogleFonts.unbounded(
      fontSize: 31 * 1.2,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    // Subtitle
    titleMedium: GoogleFonts.unbounded(
      fontSize: 28 * 1.2,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.unbounded(
      fontSize: 28 * 1.2,
      height: 1.5,
      fontWeight: FontWeight.w200,
    ),
    // Paragraph large
    bodyLarge: GoogleFonts.unbounded(fontSize: 22 * 1.2, height: 1.5),
    // Paragraph
    bodyMedium: GoogleFonts.unbounded(fontSize: 18 * 1.2, height: 1.5),
    // Paragraph small
    bodySmall: GoogleFonts.unbounded(fontSize: 15 * 1.2, height: 1.5),
    // Label
    labelSmall: GoogleFonts.unbounded(fontSize: 12.5 * 1.2, height: 1.5),
  ),

  colorScheme: ColorScheme.dark(
    brightness: Brightness.dark,
    background: Color(0xFF021123), // azul médio
    primary: Color(0xFFB872FF), // lilás botões
    secondary: Color(0x4C144480), // azul royal - chips with 30% transparency
    surface: Color(0xFF144480), // azul royal - fundo cronômetro
    onSurfaceVariant: Color(0xFFFFFFFF), // branco
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFFFFFFFF),
    onSurface: Color(0xFF98A0A8),
  ),

  // scaffoldBackgroundColor: const Color(0xFF021123),

  // extensions: <ThemeExtension<dynamic>>[
  //   CustomColors(
  //     verdeEscuro: const Color(0xFF0F725C), // verde escuro
  //     verdeCheck: const Color(0xFF00F4BF), // verde - check
  //     cinzaMedio: const Color(0xFF98A0A8), // cinza médio
  //   ),
  // ],
);
