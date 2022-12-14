import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget
      ({
    Key? key,
    required this.title,
    this.subTitle,
    this.actions,
  }) : super(key: key);

  final String title;
  final String? subTitle;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          subTitle != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      subTitle ?? 'alguma coisa',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                )
              : Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
          Row(children: actions ?? []),
        ],
      ),
    );
  }
}
