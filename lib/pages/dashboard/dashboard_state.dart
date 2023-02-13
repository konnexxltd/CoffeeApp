import 'package:coffee_app_amplify/models/Preference.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'dashboard_state.g.dart';

@CopyWith()
class DashboardState {

  List<Preference>? preferences;
  bool isLoading = false;

  DashboardState(
      {
        required this.isLoading,
        this.preferences});

  factory DashboardState.initial() => DashboardState(
    isLoading: true,
  );
}
