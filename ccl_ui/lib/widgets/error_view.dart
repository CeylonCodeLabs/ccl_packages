import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String? title;
  final String message;
  final String? buttonText;
  final void Function()? onTap;

  const ErrorView(
      {super.key,
      this.title,
      required this.message,
      this.buttonText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (title?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (onTap != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton(
                onPressed: onTap,
                child: Text(buttonText ?? 'Go Back'),
              ),
            ),
        ],
      ),
    );
  }
}
