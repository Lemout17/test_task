import 'package:test_task/const/assets.dart';
import 'package:test_task/models/user_settings_model.dart';

class ShopItemModel {
  ShopItemModel({
    required this.name,
    required this.image,
    required this.price,
    required this.content,
  });

  final String name;
  final String image;
  final int price;
  final UnlockedContent content;
}

final shopItemsList = <ShopItemModel>[
  ShopItemModel(
    name: 'Yellow Egg',
    image: Assets.egg1,
    price: 0,
    content: UnlockedContent.egg1,
  ),
  ShopItemModel(
    name: 'Purple Egg',
    image: Assets.egg2,
    price: 200,
    content: UnlockedContent.egg2,
  ),
  ShopItemModel(
    name: 'Red Egg',
    image: Assets.egg3,
    price: 300,
    content: UnlockedContent.egg3,
  ),
  ShopItemModel(
    name: 'Orange Egg',
    image: Assets.egg4,
    price: 400,
    content: UnlockedContent.egg4,
  ),
  ShopItemModel(
    name: 'Background 1',
    image: Assets.bg1,
    price: 0,
    content: UnlockedContent.bg1,
  ),
  ShopItemModel(
    name: 'Background 2',
    image: Assets.bg2,
    price: 400,
    content: UnlockedContent.bg2,
  ),
];
