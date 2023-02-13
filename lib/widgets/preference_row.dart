import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PreferenceRow extends StatelessWidget {
  final String title, subtitle;
  final String type;
  final VoidCallback onTap;
  final bool isHot;

  const PreferenceRow({
    required Key key,
    required this.onTap,
    required this.title,
    required this.type,
    required this.isHot,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          splashColor: Colors.transparent,
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: theme.textTheme.headline6!.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              type,
                              style: theme.textTheme.headline6!.copyWith(
                                fontSize: 16,
                                color: AppColors.primaryMaterial.shade200,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    child: Container(
                                      height: 20,
                                      color: isHot
                                          ? AppColors.red
                                          : AppColors.primaryMaterial,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Center(
                                          child: Text(
                                            isHot ? 'hot' : 'cold',
                                            style: theme.textTheme.overline!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                          ).tr(),
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: theme.textTheme.subtitle1!.copyWith(
                  fontSize: 12,
                  letterSpacing: 0.8,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
