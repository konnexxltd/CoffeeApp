import 'package:coffee_app_amplify/models/Preference.dart';
import 'package:coffee_app_amplify/widgets/settings_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PreferenceDetails extends StatelessWidget {
  final Preference preference;
  final VoidCallback? onQrCode, onEdit, onDelete, onSave;
  const PreferenceDetails(
      {Key? key,
      required this.preference,
      this.onQrCode,
      this.onEdit,
      this.onDelete,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  preference.title,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          height: 20,
                          color: preference.hot
                              ? AppColors.red
                              : AppColors.primaryMaterial,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                preference.hot ? 'hot' : 'cold',
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
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
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.primaryMaterial.shade300.withOpacity(0.1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " ${preference.size.name} ${preference.base.name}",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        preference.notes,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              color: AppColors.primaryMaterial.shade300,
                            ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (onSave != null)
              SettingsTile(
                  arg: preference.title,
                  title: "Save the preference",
                  subtitle: "Save the preference for future use.",
                  icon: Icons.save,
                  onTap: onSave ?? () {},
                  showDivider: false),
            if (onQrCode != null)
              SettingsTile(
                  arg: preference.title,
                  title: "show_qr_code.title",
                  subtitle: "show_qr_code.description",
                  icon: Icons.qr_code,
                  onTap: onQrCode ?? () {},
                  showDivider: false),
            if (onEdit != null)
              SettingsTile(
                  arg: preference.title,
                  title: "edit_preferences.title",
                  subtitle: "edit_preferences.description",
                  icon: Icons.edit,
                  onTap: onEdit ?? () {},
                  showDivider: false),
            if (onDelete != null)
              SettingsTile(
                  arg: preference.title,
                  title: "delete_preferences.title",
                  subtitle: "delete_preferences.description",
                  icon: Icons.delete,
                  onTap: onDelete ?? () {},
                  color: AppColors.red,
                  showDivider: false),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
