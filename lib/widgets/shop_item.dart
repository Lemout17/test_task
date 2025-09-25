import 'package:flutter/material.dart';
import 'package:test_task/const/assets.dart';
import 'package:test_task/models/shop_item_model.dart';
import 'package:test_task/theme/app_colors.dart';
import 'package:test_task/utils/size_config.dart';

class ShopItem extends StatelessWidget {
  final ShopItemModel item;
  final VoidCallback? onTap;
  final bool isUnlockedContent;
  final bool isUsed;

  const ShopItem({
    super.key,
    required this.item,
    this.onTap,
    required this.isUnlockedContent,
    required this.isUsed,
  });

  @override
  Widget build(BuildContext context) {
    final isBackground = item.name.contains('Background');

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.w(isBackground ? 4.5 : 8)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.buttonWrapper),
            fit: BoxFit.contain,
          ),
          boxShadow: [
            isUsed
                ? BoxShadow(
                    color: AppColors.green,
                    offset: const Offset(0, 0),
                    blurRadius: 20,
                  )
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.w(2)),
                child: Image.asset(item.image, fit: BoxFit.contain),
              ),
            ),
            if (item.price != 0 && !isUnlockedContent) ...[
              SizedBox(height: SizeConfig.h(0.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.price.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(width: SizeConfig.w(1)),
                  Image.asset(Assets.coin, height: SizeConfig.h(2)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
