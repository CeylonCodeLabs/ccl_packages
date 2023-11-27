import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final Widget? button;
  final double? size;
  final String? textMessage;
  final Function()? onPressed;

  const EmptyWidget({
    super.key,
    this.button,
    this.size,
    this.textMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //TODO
        // Assets.images.emptyImage.image(
        //   width: MediaQuery.of(context).size.width / 5,
        //   height: MediaQuery.of(context).size.width / 5,
        // ),
        const SizedBox(height: 8),
        Text(
          textMessage ?? 'Data not found',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        button ?? Container(),
      ],
    );
  }
}
