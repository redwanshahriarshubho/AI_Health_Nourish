import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.pink5001,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.blueGray100,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.pink5001,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 11.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 36.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 32.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        ),
        headlineMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 26.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 18.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 15.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0X3F000000),
    primaryContainer: Color(0XFF000000),
    errorContainer: Color(0XFFF7D2D8),
    onError: Color(0X7FFFFFFF),
    onPrimary: Color(0XFF424042),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // BlueGray
  Color get blueGray100 => Color(0XFFD5D5D5);
  Color get blueGray10001 => Color(0XFFD9D9D9);
  Color get blueGray400 => Color(0XFF888888);
// Gray
  Color get gray400 => Color(0XFFC2A5A9);
  Color get gray40001 => Color(0XFFCEAFB4);
  Color get gray600 => Color(0XFF7F6C6F);
// Pink
  Color get pink100 => Color(0XFFE6C4C9);
  Color get pink50 => Color(0XFFFFE6EA);
  Color get pink5001 => Color(0XFFFFD9DF);
  Color get pink507f => Color(0X7FFEE5E9);
// Red
  Color get red100 => Color(0XFFFBD5DB);
  Color get red10001 => Color(0XFFF2CED4);
  Color get red10002 => Color(0XFFFFD8DF);
  Color get red50 => Color(0XFFFFECEF);
// WhiteAf
  Color get whiteA7007f => Color(0XFFD5D5D5);
  // LightBlue
  Color get lightBlueA400 => Color(0XFF00B6FF);
  //black
  Color get black900 => Color(0XFF000000);
}
