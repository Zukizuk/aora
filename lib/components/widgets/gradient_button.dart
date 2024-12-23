import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  const GradientButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: () {},
        minWidth: 327,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
    );
  }
}
