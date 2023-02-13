import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String title, subtitle;
  const EmptyState({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6!),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
