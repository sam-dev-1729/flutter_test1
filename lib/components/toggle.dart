import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toggle extends StatelessWidget {
  final List<String> items;
  final int selectedIndex;
  final Decoration? decoration;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final double height;
  final double width;
  final double itemWidth;
  final double acHeight;
  final double? acwidth;
  final bool isSelectedIconShow;
  final ValueChanged<int> onItemSelected;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? acBorderRadius;

  const Toggle({
    Key? key,
    required this.items,
    this.selectedIndex = 0,
    required this.onItemSelected,
    this.isSelectedIconShow = true,
    this.height = 40,
    this.width = 80,
    this.decoration,
    this.selectedColor,
    this.selectedTextColor,
    this.itemWidth = 120,
    this.acHeight = 30,
    this.acwidth = 100,
    this.padding,
    this.margin,
    this.acBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: decoration,
        padding: padding ?? const EdgeInsets.all(0),
        margin: margin ?? const EdgeInsets.all(0),
        height: 40,
        width: items.length * 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var index = items.indexOf(item);
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onItemSelected(index),
              child: ItemWidget(
                item: item,
                selectedColor: selectedColor,
                selectedTextColor: selectedTextColor,
                isSelectedIconShow: isSelectedIconShow,
                isSelected: index == selectedIndex,
                width: itemWidth,
                acHeight: acHeight,
                acwidth: acwidth,
                acBorderRadius: acBorderRadius,
              ),
            );
          }).toList(),
        ));
  }
}

class ItemWidget extends StatelessWidget {
  final TextStyle? selectedStyle;
  final bool isSelected;
  final bool isSelectedIconShow;
  final String item;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final double width;
  final double? acwidth;
  final double acHeight;
  final BorderRadiusGeometry? acBorderRadius;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    this.selectedStyle,
    required this.isSelectedIconShow,
    this.selectedColor,
    this.selectedTextColor,
    this.acwidth,
    required this.acHeight,
    this.acBorderRadius,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: 70,
        height: 30,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor ?? Colors.white : null,
          borderRadius: BorderRadius.circular(25),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: _buildbody(context),
        ),
      ).paddingAll(3),
    );
  }

  _buildbody(context) => Center(
        child: Text(
          item,
          textAlign: TextAlign.center,
          style: isSelected
              ? selectedStyle ??
                  Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: selectedTextColor ??
                          Theme.of(context).appBarTheme.backgroundColor)
              : Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white, fontSize: 16),
        ),
      );
}
