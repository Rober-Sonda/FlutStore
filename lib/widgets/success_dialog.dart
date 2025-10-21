import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onPressed;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.message,
    this.onPressed,
  }) : super(key: key);

  static void show(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => SuccessDialog(
            title: title,
            message: message,
            onPressed: onPressed,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: AppTheme.successColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onPressed ?? () => Navigator.of(context).pop(),
          child: const Text('Continuar'),
        ),
      ],
    );
  }
}
