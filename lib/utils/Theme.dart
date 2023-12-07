import "package:flutter/material.dart";
import "package:sber_app_filyakin/utils/ColorsPalete.dart";
import "package:sber_app_filyakin/utils/TextThemes.dart";

final themeData = ThemeData(
  textTheme: sfProTextTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorPalette.whiteColor,
  ),
  tabBarTheme: TabBarTheme(
    indicatorColor: ColorPalette.mainGreenColor,
    indicatorSize: TabBarIndicatorSize.tab,
    overlayColor:
        MaterialStateColor.resolveWith((states) => ColorPalette.mainGreenColor),
  ),
  dividerTheme:
      const DividerThemeData(color: ColorPalette.blackColor, thickness: 2),
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorPalette.blackColor,
      onPrimary: ColorPalette.greyColor,
      secondary: ColorPalette.mainGreenColor,
      onSecondary: ColorPalette.mainGreenColor,
      error: ColorPalette.redColor,
      onError: ColorPalette.redColor,
      background: ColorPalette.whiteColor,
      onBackground: ColorPalette.whiteColor,
      surface: ColorPalette.blackColor,
      onSurface: ColorPalette.blackColor),
  useMaterial3: true,
);
