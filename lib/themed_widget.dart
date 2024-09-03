import 'package:flutter/material.dart';

part 'themed_widget.g.dart';

class ThemedWidget extends StatelessWidget {
  final MyColors? theme;

  const ThemedWidget({
    super.key,
    this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.tightFor(
          width: 100,
          height: 100,
        ),
        color: context.brandColor(theme),
        child: Center(
          child: Container(
            constraints: const BoxConstraints.tightFor(
              width: 50,
              height: 50,
            ),
            color: context.danger(theme),
          ),
        ),
      ),
    );
  }
}

class MyColors {
  const MyColors({
    this.brandColor = Colors.purple,
    this.danger = Colors.pink,
  });

  final Color brandColor;
  final Color danger;
}





