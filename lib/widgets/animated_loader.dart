import 'package:flutter/material.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';
import 'package:test_task/widgets/common/stroke_text.dart';

class AnimatedGradientLoader extends StatefulWidget {
  const AnimatedGradientLoader({
    super.key,
    this.duration = const Duration(seconds: 3),
    this.height = 117.0,
    this.borderRadiusOuter = 16.0,
    this.borderRadiusInner = 12.0,
    this.gradient,
    this.borderGradient,
    this.backgroundColor = AppColors.white,
    this.onCompleted,
    this.borderWidth = 2.5,
  });

  final Duration duration;
  final double height;
  final double borderRadiusOuter;
  final double borderRadiusInner;
  final Gradient? gradient;
  final Gradient? borderGradient;
  final Color backgroundColor;
  final double borderWidth;
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
      colors: [AppColors.red, AppColors.yellow],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final Gradient defaultBorderGradient = LinearGradient(
      colors: [AppColors.darkOrange, AppColors.yellow],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final percent = _animation.value.clamp(0.0, 100.0);

        return LayoutBuilder(
          builder: (context, constraints) {
            final fullWidth = constraints.maxWidth;
            final fillWidth = fullWidth * (percent / 100.0);

            return Container(
              decoration: BoxDecoration(
                gradient: widget.borderGradient ?? defaultBorderGradient,
                borderRadius: BorderRadius.circular(widget.borderRadiusOuter),
              ),
              padding: EdgeInsets.all(widget.borderWidth),
              child: SizedBox(
                height: widget.height,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: fullWidth,
                      height: widget.height,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor,
                        borderRadius: BorderRadius.circular(
                          widget.borderRadiusInner,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadiusInner,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: fillWidth,
                          height: widget.height,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: widget.gradient ?? defaultGradient,
                              borderRadius: BorderRadius.circular(
                                widget.borderRadiusInner,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned.fill(
                      child: Center(
                        child: StrokeText(
                          '${percent.toInt()}%',
                          size: SizeConfig.font(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
