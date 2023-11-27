import 'dart:ui';

import 'package:ccl_ui/common/extensions.dart';
import 'package:ccl_ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:stacked/stacked.dart';

class BackgroundProgress<T extends BaseViewModel> extends ViewModelWidget<T> {
  final Widget child;
  final String? message;
  final bool blurBackground;

  const BackgroundProgress(
      {super.key,
      required this.child,
      this.blurBackground = true,
      this.message});

  @override
  Widget build(BuildContext context, T viewModel) {
    final progressWidget = Container(
      decoration: BoxDecoration(
          color: context.colors.primaryContainer.withOpacity(0.5)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(strokeWidth: 3.0),
            if (message.isNotNullOrEmpty) ...[
              verticalSpaceLight,
              Text(
                message!,
                style: context.styleTitleMedium?.copyWith(
                  color: context.colors.onPrimaryContainer,
                  shadows: [
                    BoxShadow(
                      color: context.colors.primaryContainer,
                      spreadRadius: 5.0,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      child: Stack(
        children: [
          child,
          if (viewModel.isBusy)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: viewModel.isBusy ? 1 : 0,
                duration: const Duration(milliseconds: 2000),
                child: blurBackground
                    ? BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: progressWidget,
                      )
                    : progressWidget,
              ),
            ),
        ],
      ),
    );
  }
}
