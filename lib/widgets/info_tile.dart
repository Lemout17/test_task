import 'package:flutter/material.dart';
import 'package:test_task/utils/size_config.dart';

class InfoTile extends StatelessWidget {
  final String asset;
  final String text;
  final String title;

  const InfoTile({
    super.key,
    required this.asset,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 1, child: Image.asset('assets/images/$asset')),
        SizedBox(width: SizeConfig.w(3)),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: SizeConfig.h(1)),
              Text(text, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ],
    );
  }
}
