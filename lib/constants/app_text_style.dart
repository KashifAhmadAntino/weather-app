import 'package:flutter/material.dart';
import 'package:weather/constants/app_color.dart';

class TStyles {
  static TextStyle get r12 => const TextStyle(
        fontSize: 12,
        color: AppColors.kPureBlack,
      );
  static TextStyle get r14 => const TextStyle(
        fontSize: 14,
        color: AppColors.kPureBlack,
      );
  static TextStyle get r16 => const TextStyle(
        fontSize: 16,
        color: AppColors.kPureBlack,
      );
  static TextStyle get r18 => const TextStyle(
        fontSize: 18,
        color: AppColors.kPureBlack,
      );
  static TextStyle get r24 => const TextStyle(
        fontSize: 24,
        color: AppColors.kPureBlack,
      );
  static TextStyle get r60 => const TextStyle(
        fontSize: 60,
        color: AppColors.kPureBlack,
      );

  static TextStyle get b12 => r12.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b14 => r14.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b16 => r16.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b18 => r18.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get b24 => r24.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get msb12 => r12.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb14 => r14.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb16 => r16.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb18 => r18.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get msb24 => r24.copyWith(fontWeight: FontWeight.w700);

  static TextStyle get sb12 => r12.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb14 => r14.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb16 => r16.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb18 => r18.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb24 => r24.copyWith(fontWeight: FontWeight.w600);
  static TextStyle get sb60 => r60.copyWith(fontWeight: FontWeight.w600);

  static TextStyle get med12 => r12.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med14 => r14.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med16 => r16.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med18 => r18.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get med24 => r24.copyWith(fontWeight: FontWeight.w500);
}

extension TextSTYLE on TextStyle {
  TextStyle get required => copyWith(color: AppColors.kRedDust);
  TextStyle get hint => copyWith(color: AppColors.kGrey217);
  TextStyle get midBlack => copyWith(color: AppColors.grey62);
  TextStyle get white => copyWith(color: AppColors.kPureWhite);
  TextStyle get black => copyWith(color: AppColors.kPureBlack);
}
