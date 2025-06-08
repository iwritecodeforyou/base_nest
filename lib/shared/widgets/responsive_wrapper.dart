import 'package:base_nest/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final bool scrollable;
  final bool safeArea;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.scrollable = false,
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: child,
    );

    if (scrollable) {
      content = SingleChildScrollView(child: content);
    }

    if (safeArea) {
      content = SafeArea(child: content);
    }

    return content;
  }
}