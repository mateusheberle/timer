import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_alura/components/button.dart';
import 'package:timer_alura/consts.dart';
import 'package:just_audio/just_audio.dart';

class TemporizadorTela extends StatefulWidget {
  const TemporizadorTela({super.key});

  @override
  State<TemporizadorTela> createState() => _TemporizadorTelaState();
}

class _TemporizadorTelaState extends State<TemporizadorTela> {
  int selecionado = 0;
  int _tempoRestante = 1500; // em segundos (25 minutos)
  Timer? _timer;
  bool _ativo = false;
  bool _zerou = false;

  void _selecionarCategoria(int index) {
    setState(() {
      selecionado = index;
      _tempoRestante = tempos[selecionado];
      _resetarTimer();
    });
  }

  void _iniciarTimer() {
    if (_ativo) return;

    setState(() {
      _ativo = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_tempoRestante > 0) {
        setState(() {
          _tempoRestante--;
        });
      } else {
        print('Tempo esgotado!');
        _pararTimer();
        _zerou = true;
        _somAlarme(true);
      }
    });
  }

  void _pausarTimer() {
    _timer?.cancel();
    setState(() {
      _ativo = false;
    });
  }

  void _resetarTimer() {
    _timer?.cancel();
    setState(() {
      _tempoRestante = tempos[selecionado];
      _ativo = false;
      _zerou = false;
    });
  }

  void _pararTimer() {
    _timer?.cancel();
    setState(() {
      _ativo = false;
    });
  }

  void _somAlarme(bool isAlarme) async {
    final player = AudioPlayer();
    await player.setAsset('assets/Sons/Beep.mp3');
    if (isAlarme) {
      player.play();
    } else {
      player.stop();
      _resetarTimer();
    }
  }

  String _formatarTempo(int segundos) {
    final minutos = (segundos ~/ 60).toString().padLeft(2, '0');
    final segs = (segundos % 60).toString().padLeft(2, '0');
    return '$minutos:$segs';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: colorScheme.onSurfaceVariant,
            size: 32 * value,
          ),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'imagem',
                child: Image.asset(
                  imagens[selecionado],
                  width: 317.67 * value,
                  height: 266.46 * value,
                  fit: BoxFit.contain,
                ),
              ),
              _buildTimerContainer(theme, colorScheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimerContainer(ThemeData theme, ColorScheme colorScheme) {
    return Container(
      width: 312 * value,
      height: 268 * value,
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: BorderRadius.circular(32 * value),
        border: Border.all(color: colorScheme.surface, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.all(24 * value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoriaItem('Foco', 0),
                _buildCategoriaItem('Pausa curta', 1),
                _buildCategoriaItem('Pausa longa', 2),
              ],
            ),
            Text(
              _formatarTempo(_tempoRestante),
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontSize: 53 * value,
              ),
            ),
            Button(
              text:
                  _zerou
                      ? 'Restart'
                      : _ativo
                      ? 'Pause'
                      : 'Play',
              icon:
                  _zerou
                      ? Icons.restart_alt
                      : _ativo
                      ? Icons.pause
                      : Icons.play_arrow,
              onTap:
                  _zerou
                      ? () => _somAlarme(false)
                      : _ativo
                      ? _pausarTimer
                      : _iniciarTimer,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriaItem(String text, int index) {
    return GestureDetector(
      onTap: () => _selecionarCategoria(index),
      child: CategoriaCronometro(
        text: text,
        isSelecionado: selecionado == index,
      ),
    );
  }
}

class CategoriaCronometro extends StatelessWidget {
  final String text;
  final bool isSelecionado;

  const CategoriaCronometro({
    super.key,
    required this.text,
    this.isSelecionado = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: isSelecionado ? theme.colorScheme.surface : Colors.transparent,
        borderRadius: BorderRadius.circular(8 * value),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8 * value, vertical: 8 * value),
      child: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: isSelecionado ? FontWeight.w600 : FontWeight.w200,
          fontSize: 12.5,
        ),
      ),
    );
  }
}
