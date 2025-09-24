import 'package:flutter/material.dart';

class AnimatedGradientLoader extends StatefulWidget {
  const AnimatedGradientLoader({
    super.key,
    this.duration = const Duration(seconds: 3),
    this.height = 117.0,
    this.borderRadius = 16.0,
    this.gradient,
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.onCompleted,
  });

  final Duration duration;
  final double height;
  final double borderRadius;
  final Gradient? gradient;
  final Color backgroundColor;
  final VoidCallback? onCompleted;

  @override
  State<AnimatedGradientLoader> createState() => _AnimatedGradientLoaderState();
}

class _AnimatedGradientLoaderState extends State<AnimatedGradientLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ).drive(Tween(begin: 0.0, end: 100.0));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted?.call();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Gradient defaultGradient = LinearGradient(
      colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final percent = _animation.value.clamp(0.0, 100.0);
        return LayoutBuilder(
          builder: (context, constraints) {
            final fullWidth = constraints.maxWidth;
            final fillWidth = fullWidth * (percent / 100.0);

            return SizedBox(
              height: widget.height,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Background
                  Container(
                    width: fullWidth,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                    ),
                  ),

                  // Gradient fill clipped to width
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: fillWidth,
                        height: widget.height,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: widget.gradient ?? defaultGradient,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Percentage text centered
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        '${percent.toInt()}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.35),
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
