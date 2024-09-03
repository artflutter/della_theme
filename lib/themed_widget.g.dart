part of 'themed_widget.dart';

extension on BuildContext {
  MyColors get _default => const MyColors();

  MyColorsTheme? get _iThemeExt => Theme.of(this)
      .extensions
      .values
      .whereType<IMyColorsTheme>()
      .firstOrNull
      ?.$myColorsTheme;

  MyColorsTheme? get _themeExt => Theme.of(this).extension<MyColorsTheme>();

  Color brandColor(MyColors? theme) =>
      theme?.brandColor ??
      _themeExt?.brandColor ??
      _iThemeExt?.brandColor ??
      _default.brandColor;

  Color danger(MyColors? theme) =>
      theme?.danger ??
          _themeExt?.danger ??
          _iThemeExt?.danger ??
          _default.danger;
}

abstract class IMyColorsTheme {
  MyColorsTheme get $myColorsTheme;
}

class MyColorsTheme extends ThemeExtension<MyColorsTheme> {
  const MyColorsTheme({
    required this.brandColor,
    required this.danger,
  });

  final Color? brandColor;
  final Color? danger;

  @override
  MyColorsTheme copyWith({Color? brandColor, Color? danger}) {
    return MyColorsTheme(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  MyColorsTheme lerp(MyColorsTheme? other, double t) {
    if (other is! MyColorsTheme) {
      return this;
    }
    return MyColorsTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}
