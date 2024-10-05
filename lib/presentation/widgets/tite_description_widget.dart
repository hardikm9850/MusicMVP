import 'package:flutter/material.dart';
import 'package:fav_music_album/core/utils.dart';
import 'package:fav_music_album/presentation/widgets/space.dart';

class TitleDescriptionWidget extends StatelessWidget {
  TitleDescriptionWidget(
      {Key? key, this.body, this.title, this.bodyStyle, this.titleStyle})
      : super(key: key);
  String? body;
  String? title;
  TextStyle? titleStyle;
  TextStyle? bodyStyle;
  @override
  Widget build(BuildContext context) {
    titleStyle = titleStyle ??
        Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: AppConst.kAppSecondaryColor, fontSize: 18);
    bodyStyle = bodyStyle ??
        Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppConst.kAppSecondaryColor.withOpacity(0.7), fontSize: 18);

    return Row(children: [
      Text(
        title ?? '',
        style: titleStyle,
      ),
      const HorizontalSpace(5),
      Text(
        body ?? '',
        style: bodyStyle,
      )
    ]);
  }
}
