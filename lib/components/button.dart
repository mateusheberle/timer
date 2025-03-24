// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function? onTap;

  const Button({super.key, required this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 48,
      width: 316.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Icon(icon, color: Theme.of(context).colorScheme.background)
                  : Container(),
              const SizedBox(width: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
