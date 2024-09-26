import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumLight => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w300,
      );
// Headline text style
  static get headlineMediumSemiBold => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );


  //from wizzy
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
    fontSize: 12.fSize,
  );
  static get bodySmall_1 => theme.textTheme.bodySmall!;
// Headline text style

  static get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
    fontWeight: FontWeight.w600,
  );
  static get titleSmallLightblueA400 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.lightBlueA400,
    fontSize: 14.fSize,
  );
// Title text style
//   static get titleSmallLightblueA400 => theme.textTheme.titleSmall!.copyWith(
//     color: appTheme.lightBlueA400,
//     fontSize: 14.fSize,
//   );
}
