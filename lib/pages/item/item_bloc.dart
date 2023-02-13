import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:coffee_app_amplify/models/ModelProvider.dart';
import 'package:coffee_app_amplify/pages/item/item_state.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:rxdart/rxdart.dart';

class ItemBloc {
  final BehaviorSubject<ItemState> _state = BehaviorSubject<ItemState>();
  final CarouselController carouselController = CarouselController();
  final Preference? preference;
  late FormGroup form;

  ItemBloc({this.preference}) {
    var validators = [
      Validators.required,
    ];
    if (preference == null) {
      form = FormGroup({
        'title': FormControl<String>(validators: validators),
        'subtitle': FormControl<String>(validators: validators),
        'hot': FormControl<bool>(value: false),
        'notes': FormControl<String>(validators: validators),
        'size': FormControl<Size>(validators: validators),
        'base': FormControl<Base>(validators: validators),
      });
    } else {
      form = FormGroup({
        'title': FormControl<String>(
            value: preference!.title, validators: validators),
        'subtitle': FormControl<String>(
            value: preference!.subtitle, validators: validators),
        'hot': FormControl<bool>(value: preference!.hot),
        'notes': FormControl<String>(
            value: preference!.notes, validators: validators),
        'size':
            FormControl<Size>(value: preference!.size, validators: validators),
        'base':
            FormControl<Base>(value: preference!.base, validators: validators),
      });
    }
  }

  updatePreferences(Preference preference) async {
    _state.add(_state.value.copyWith(preference: preference));
  }

  createPreference() async {
    var user = await Amplify.Auth.getCurrentUser();
    Preference preference = Preference(
      user_id: user.userId,
      title: form.control('title').value,
      subtitle: form.control('subtitle').value,
      hot: form.control('hot').value,
      notes: form.control('notes').value,
      size: form.control('size').value,
      base: form.control('base').value,
    );
    await Amplify.DataStore.save(preference);
  }

  updatePreference() async {
    final updatedPreference = preference!.copyWith(
      title: form.control('title').value,
      subtitle: form.control('subtitle').value,
      hot: form.control('hot').value,
      notes: form.control('notes').value,
      size: form.control('size').value,
      base: form.control('base').value,
    );
    await Amplify.DataStore.save(updatedPreference);
  }

  Stream<ItemState> get state => _state.stream;

  void dispose() {
    _state.close();
  }
}
