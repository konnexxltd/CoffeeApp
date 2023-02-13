// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ItemStateCWProxy {
  ItemState isLoading(bool isLoading);

  ItemState preference(Preference? preference);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemState(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemState call({
    bool? isLoading,
    Preference? preference,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfItemState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfItemState.copyWith.fieldName(...)`
class _$ItemStateCWProxyImpl implements _$ItemStateCWProxy {
  final ItemState _value;

  const _$ItemStateCWProxyImpl(this._value);

  @override
  ItemState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  ItemState preference(Preference? preference) => this(preference: preference);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ItemState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ItemState(...).copyWith(id: 12, name: "My name")
  /// ````
  ItemState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? preference = const $CopyWithPlaceholder(),
  }) {
    return ItemState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      preference: preference == const $CopyWithPlaceholder()
          ? _value.preference
          // ignore: cast_nullable_to_non_nullable
          : preference as Preference?,
    );
  }
}

extension $ItemStateCopyWith on ItemState {
  /// Returns a callable class that can be used as follows: `instanceOfItemState.copyWith(...)` or like so:`instanceOfItemState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ItemStateCWProxy get copyWith => _$ItemStateCWProxyImpl(this);
}
