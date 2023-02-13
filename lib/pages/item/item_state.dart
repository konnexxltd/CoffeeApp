import 'package:coffee_app_amplify/models/Preference.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'item_state.g.dart';

@CopyWith()
class ItemState {

  Preference? preference;
  bool isLoading = false;

  ItemState(
      {
        required this.isLoading,
        this.preference});

  factory ItemState.initial() => ItemState(
    isLoading: true,
  );
}
