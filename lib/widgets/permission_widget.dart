import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/usuario.dart';
import '../services/permission_service.dart';
import '../services/auth_service.dart';

class PermissionWidget extends ConsumerWidget {
  final Widget child;
  final String action;
  final String resource;
  final Widget? fallback;

  const PermissionWidget({
    super.key,
    required this.child,
    required this.action,
    required this.resource,
    this.fallback,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final permissionService = ref.watch(permissionServiceProvider);

    return FutureBuilder<bool>(
      future: permissionService.canPerformAction(currentUser, action, resource),
      builder: (context, snapshot) {
        final hasPermission = snapshot.data ?? false;

        if (hasPermission) {
          return child;
        } else if (fallback != null) {
          return fallback!;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class PermissionFAB extends ConsumerWidget {
  final VoidCallback onPressed;
  final String action;
  final String resource;
  final IconData icon;
  final String tooltip;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const PermissionFAB({
    super.key,
    required this.onPressed,
    required this.action,
    required this.resource,
    required this.icon,
    required this.tooltip,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final permissionService = ref.watch(permissionServiceProvider);

    return FutureBuilder<bool>(
      future: permissionService.canPerformAction(currentUser, action, resource),
      builder: (context, snapshot) {
        final hasPermission = snapshot.data ?? false;

        if (hasPermission) {
          return FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: backgroundColor ?? Colors.blue,
            foregroundColor: foregroundColor ?? Colors.white,
            tooltip: tooltip,
            child: Icon(icon),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class PermissionIconButton extends ConsumerWidget {
  final VoidCallback onPressed;
  final String action;
  final String resource;
  final IconData icon;
  final String tooltip;
  final Color? color;

  const PermissionIconButton({
    super.key,
    required this.onPressed,
    required this.action,
    required this.resource,
    required this.icon,
    required this.tooltip,
    this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final permissionService = ref.watch(permissionServiceProvider);

    return FutureBuilder<bool>(
      future: permissionService.canPerformAction(currentUser, action, resource),
      builder: (context, snapshot) {
        final hasPermission = snapshot.data ?? false;

        if (hasPermission) {
          return IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: color),
            tooltip: tooltip,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
