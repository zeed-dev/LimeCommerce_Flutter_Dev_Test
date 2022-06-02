import 'package:flutter/material.dart';
import 'package:mini_apps/common/style.dart';
import 'package:mini_apps/extensions/ext.dart';
import 'package:mini_apps/models/dumy_category.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.categopry,
    required this.index,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final Category categopry;
  final int index;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 44,
        margin: EdgeInsets.only(
          left: index == 0 ? 24 : 0,
          right: index == 2 ? 0 : 8,
        ),
        padding: paddingOnly(
          left: 13.0,
          right: 13.0,
          top: 12.0,
          bottom: 12.0,
        ),
        decoration: BoxDecoration(
          color: isActive ? korange : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            categopry.title,
            style: kSubtitle.copyWith(
              color: isActive ? kwhite : kgrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
