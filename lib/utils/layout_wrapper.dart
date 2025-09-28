import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_task/theme/app_colors.dart';

class BackgroundWrapper extends StatefulWidget {
  final Widget child;
  final String? backgroundUrl;
  final double opacity;
  final bool withGlow;
  final double glowIntensity;
  final Duration glowDuration;
  final Curve glowCurve;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.backgroundUrl,
    this.opacity = 0.5,
    this.withGlow = false,
    this.glowIntensity = 0.15,
    this.glowDuration = const Duration(seconds: 3),
    this.glowCurve = Curves.easeInOut,
  });

  @override
  State<BackgroundWrapper> createState() => _BackgroundWrapperState();
}

class _BackgroundWrapperState extends State<BackgroundWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;
  bool _isImageLoaded = false;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.backgroundUrl != null) {
        precacheImage(
          AssetImage('assets/images/${widget.backgroundUrl!}'),
          context,
        ).then((_) {
          if (mounted) {
            setState(() {
              _isImageLoaded = true;
            });
          }
        });
      } else {
        _isImageLoaded = true;
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: widget.glowDuration,
    )..repeat(reverse: true);

    _glowAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.05, end: 0.12), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.12, end: 0.08), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.08, end: 0.15), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.15, end: 0.05), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: widget.glowCurve));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Плавное появление картинки через AnimatedOpacity
        if (widget.backgroundUrl != null)
          AnimatedOpacity(
            opacity: _isImageLoaded ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              'assets/images/${widget.backgroundUrl!}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          )
        else
          Container(color: Colors.white), // если картинки нет

        if (widget.withGlow)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _glowAnimation,
              builder: (context, child) {
                final dx = (_random.nextDouble() - 0.5) * 0.02;
                final dy = (_random.nextDouble() - 0.5) * 0.02;

                return Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0 + dx, 0.8 + dy),
                      radius: 0.6,
                      colors: [
                        AppColors.yellow.withOpacity(_glowAnimation.value),
                        AppColors.orange.withOpacity(
                          _glowAnimation.value * 0.6,
                        ),
                        AppColors.red.withOpacity(_glowAnimation.value * 0.3),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        widget.child,
      ],
    );
  }
}
