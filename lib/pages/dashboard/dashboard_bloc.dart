import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:coffee_app_amplify/models/ModelProvider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:rxdart/rxdart.dart';

import '../../utils/app_colors.dart';
import 'dashboard_state.dart';

class DashboardBloc {
  final BehaviorSubject<DashboardState> _state =
      BehaviorSubject<DashboardState>();
  final CarouselController carouselController = CarouselController();

  DashboardBloc() {
    initState();
  }

  initState() async {
    _state.add(DashboardState.initial());
    await updatePreferences();
    _state.add(_state.value.copyWith(isLoading: false));
  }

  setIsLoading(bool isLoading) {
    _state.add(_state.value.copyWith(isLoading: isLoading));
  }

  updatePreferences() async {
    var user = await Amplify.Auth.getCurrentUser();
    List<Preference> preferences = await Amplify.DataStore.query(
        Preference.classType,
        where: Preference.USER_ID.eq(user.userId));
    _state.add(_state.value.copyWith(preferences: preferences));
  }

  Stream<DashboardState> get state => _state.stream;

  Future<void> deletePreference(Preference preference) async {
    setIsLoading(true);
    await Amplify.DataStore.delete(preference);
    await updatePreferences();
    setIsLoading(false);
  }

  void dispose() {
    _state.close();
  }

  void signOut() {
    Amplify.Auth.signOut();
  }

  scanQrForPreference() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        AppColors.primaryString, "Cancel", false, ScanMode.QR);
    var preferences = await Amplify.DataStore.query(Preference.classType,
        where: Preference.ID.eq(barcodeScanRes));
    return preferences;
  }

  Future<void> saveForCurrentUser(Preference preference) async {
    setIsLoading(true);
    final user = await Amplify.Auth.getCurrentUser();
    final preferenceUpdated = Preference(
      title: preference.title,
      subtitle: preference.subtitle,
      notes: preference.notes,
      user_id: user.userId,
      base: preference.base,
      hot: preference.hot,
      size: preference.size,
    );
    await Amplify.DataStore.save(preferenceUpdated);
    setIsLoading(false);
  }
}
