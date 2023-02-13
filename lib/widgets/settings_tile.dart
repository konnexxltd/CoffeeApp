import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? arg;
  final IconData icon;
  final VoidCallback onTap;
  final bool showDivider;
  final Color? color;

  const SettingsTile(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap,
      required this.showDivider,
      this.color,
      this.arg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: color,
                  size: 32,
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ).tr(),
                      Text(
                        subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 12, color: color),
                      ).tr(args: [arg != null ? arg! : '']),
                    ],
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color ?? Theme.of(context).iconTheme.color,
                  size: 20,
                ),
              ],
            ),
            if (showDivider)
              Divider(
                thickness: 0.1,
                color: Colors.grey[300],
              ),
          ],
        ),
      ),
    );
  }
}
