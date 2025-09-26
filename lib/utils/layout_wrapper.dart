import 'package:flutter/material.dart';

class BackgroundWrapper extends StatefulWidget {
  final Widget child;
  final String? backgroundUrl;
  final double opacity;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.backgroundUrl,
    this.opacity = 0.5,
  });

  @override
  State<BackgroundWrapper> createState() => _BackgroundWrapperState();
}

class _BackgroundWrapperState extends State<BackgroundWrapper>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: widget.backgroundUrl != null
              ? Image.asset(widget.backgroundUrl!, fit: BoxFit.cover)
              : const SizedBox(),
        ),
        widget.child,
      ],
    );
  }
}
