import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  /// box
  static const kBox = SizedBox.shrink();
  static const kBoxWith4 = SizedBox(width: 4);
  static const kBoxWith8 = SizedBox(width: 8);
  static const kBoxWith12 = SizedBox(width: 12);
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
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);


  /// border radius
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
}
