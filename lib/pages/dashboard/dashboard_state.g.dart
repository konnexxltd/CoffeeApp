// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DashboardStateCWProxy {
  DashboardState isLoading(bool isLoading);

  DashboardState preferences(List<Preference>? preferences);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardState(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardState call({
    bool? isLoading,
    List<Preference>? preferences,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDashboardState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDashboardState.copyWith.fieldName(...)`
class _$DashboardStateCWProxyImpl implements _$DashboardStateCWProxy {
  final DashboardState _value;

  const _$DashboardStateCWProxyImpl(this._value);

  @override
  DashboardState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  DashboardState preferences(List<Preference>? preferences) =>
      this(preferences: preferences);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DashboardState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DashboardState(...).copyWith(id: 12, name: "My name")
  /// ````
  DashboardState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? preferences = const $CopyWithPlaceholder(),
  }) {
    return DashboardState(
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      preferences: preferences == const $CopyWithPlaceholder()
          ? _value.preferences
          // ignore: cast_nullable_to_non_nullable
          : preferences as List<Preference>?,
    );
  }
}

extension $DashboardStateCopyWith on DashboardState {
  /// Returns a callable class that can be used as follows: `instanceOfDashboardState.copyWith(...)` or like so:`instanceOfDashboardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DashboardStateCWProxy get copyWith => _$DashboardStateCWProxyImpl(this);
}
