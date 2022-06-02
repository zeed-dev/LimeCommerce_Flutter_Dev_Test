import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mini_apps/common/style.dart';
import 'package:mini_apps/extensions/ext.dart';
import 'package:mini_apps/helper/helper.dart';
import 'package:mini_apps/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  static double itemHeight = 650;
  static double itemWidth = 400;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      width: itemWidth,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            offset: const Offset(0, 1),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: paddingAll(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.favorite_border,
                color: kgrey,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: product.thumbnail,
                fit: BoxFit.cover,
                height: 70,
                width: 70,
                progressIndicatorBuilder: (
                  context,
                  url,
                  downloadProgress,
                ) =>
                    SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: kSubtitle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Text(
                  "\$${product.price.toString()}",
                  style: kSubtitle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.solid,
                    fontSize: 17,
                    color: kgrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " - ",
                  style: kSubtitle.copyWith(
                    fontSize: 17,
                    color: korange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\$${Helper.getDiscountPrice(product.price, product.discountPercentage).toStringAsFixed(2)}",
                  style: kSubtitle.copyWith(
                    fontSize: 17,
                    color: korange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Visibility(
              visible: product.discountPercentage != 0 ||
                  product.discountPercentage != 0.0,
              child: Padding(
                padding: paddingBottom(5.0),
                child: Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: korange,
                  borderRadius: BorderRadius.circular(8),
                  elevation: 0,
                  badgeContent: Text(
                    "Discount ${product.discountPercentage}%",
                    style: kBodyText.copyWith(color: kwhite),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: kSubtitle.copyWith(fontSize: 12),
            ),
            const Spacer(),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 18.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10,
                  ),
                  onRatingUpdate: (rating) {
                    if (kDebugMode) {
                      log("Rating Update");
                    }
                  },
                ),
                Text(
                  "(${product.rating.toString()})",
                  style: kBodyText.copyWith(color: kgrey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
