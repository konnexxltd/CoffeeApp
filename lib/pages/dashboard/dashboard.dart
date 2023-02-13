import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:coffee_app_amplify/models/ModelProvider.dart';
import 'package:coffee_app_amplify/pages/dashboard/dashboard_bloc.dart';
import 'package:coffee_app_amplify/utils/app_colors.dart';
import 'package:coffee_app_amplify/widgets/preference_details.dart';
import 'package:coffee_app_amplify/widgets/preference_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../utils/transition.dart';
import '../../widgets/custom_scroll_body.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/two_tone_text.dart';
import '../item/item.dart';
import 'dashboard_state.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({required Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardBloc _bloc = DashboardBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollBody(
        onRefresh: _bloc.initState,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            sliver: SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              centerTitle: true,
              title: TwoToneText(
                firstText: 'coffee ',
                secondText: 'app',
                tag: 'two_tone_text',
                fontSize: 28,
                key: UniqueKey(),
              ),
              leadingWidth: 90,
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () async {
                      var result =
                          await Navigator.of(context, rootNavigator: true)
                              .push(createRoute(const Item()));
                      if (result != null) {
                        if (result) {
                          _bloc.initState();
                        }
                      }
                    },
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).iconTheme.color,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () async {
                      var preference = await _bloc.scanQrForPreference();
                      if (preference.isNotEmpty) {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => PreferenceDetails(
                            preference: preference.first,
                            onSave: () {
                              Navigator.pop(context);
                              _bloc.saveForCurrentUser(preference.first);
                            },
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.qr_code,
                      color: Theme.of(context).iconTheme.color,
                      size: 30,
                    ),
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onLongPress: () {
                    _bloc.signOut();
                  },
                  child: Icon(
                    Icons.logout,
                    color: AppColors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<DashboardState>(
              stream: _bloc.state,
              initialData: DashboardState.initial(),
              builder: (context, snapshot) {
                Widget child = const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                if (snapshot.hasData && snapshot.data!.isLoading == false) {
                  var state = snapshot.data;
                  var preferences = state!.preferences;
                  if (preferences!.isNotEmpty) {
                    child = SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return PreferenceRow(
                              key: UniqueKey(),
                              onTap: () {
                                showBarModalBottomSheet(
                                    expand: false,
                                    useRootNavigator: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => PreferenceDetails(
                                          preference: preferences[index],
                                          onQrCode: () async {
                                            Navigator.of(context).pop();
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15.0))),
                                                    title: Text(
                                                      preferences[index].title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6,
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    content: SizedBox(
                                                      height: 200,
                                                      width: 200,
                                                      child: Center(
                                                        child: QrImage(
                                                          data:
                                                              preferences[index]
                                                                  .id,
                                                          version:
                                                              QrVersions.auto,
                                                          foregroundColor:
                                                              Theme.of(context)
                                                                  .iconTheme
                                                                  .color,
                                                          size: 200.0,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          onEdit: () async {
                                            Navigator.of(context).pop();
                                            var result =
                                                await Navigator.of(context)
                                                    .push(createRoute(Item(
                                              preference: preferences[index],
                                            )));
                                            if (result != null) {
                                              if (result) {
                                                _bloc.initState();
                                              }
                                            }
                                          },
                                          onDelete: () async {
                                            Navigator.pop(context);
                                            await _bloc.deletePreference(
                                                preferences[index]);
                                          },
                                        ));
                              },
                              title: preferences[index].title,
                              type: preferences[index].base.name,
                              isHot: preferences[index].hot,
                              subtitle: preferences[index].subtitle);
                        },
                        childCount: preferences.length,
                      )),
                    );
                  } else {
                    child = const SliverPadding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: EmptyState(
                          title: "No Preferences Yet",
                          subtitle: "To get started, click the + button",
                        ),
                      ),
                    );
                  }
                }

                return SliverAnimatedSwitcher(
                    duration: const Duration(milliseconds: 300), child: child);
              }),
        ],
      ),
    );
  }
}
