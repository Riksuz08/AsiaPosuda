import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppUtils {
  AppUtils._();

  static const kSpacer = Spacer();

  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap12 = Gap(12);
  static const kGap24 = Gap(24);
  static const kGap40 = Gap(40);

  /// box
  static const kBox = SizedBox.shrink();
  static const kBoxWidth4 = SizedBox(width: 4);
  static const kBoxWidth8 = SizedBox(width: 8);
  static const kBoxWidth12 = SizedBox(width: 12);
  static const kBoxWidth16 = SizedBox(width: 16);
  static const kBoxHeight2 = SizedBox(height: 2);
  static const kBoxHeight4 = SizedBox(height: 4);
  static const kBoxHeight8 = SizedBox(height: 8);
  static const kBoxHeight12 = SizedBox(height: 12);
  static const kBoxHeight16 = SizedBox(height: 16);
  static const kBoxHeight24 = SizedBox(height: 24);

  /// divider
  static const kDivider = Divider(height: 1);

  /// padding
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static const kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);

  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);

  /// border radius
  static const kRadius = Radius.zero;
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kShapeRoundedNone = RoundedRectangleBorder(
    borderRadius: BorderRadius.zero,
  );
  static const kShapeRoundedAll12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12),
    ),
  );
  static const kShapeRoundedAll10 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static const kShapeRoundedBottom12 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(12),
      bottomLeft: Radius.circular(12),
    ),
  );
}
