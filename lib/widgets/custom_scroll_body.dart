import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScrollBody extends StatelessWidget {
  final List<Widget> slivers;
  final VoidCallback? onRefresh;
  const CustomScrollBody({Key? key, required this.slivers, this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
        offsetToArmed: 20,
        onRefresh: () {
          HapticFeedback.mediumImpact();
          if (onRefresh != null) onRefresh!();
          return Future.value();
        },
        builder: (BuildContext context, Widget child,
            IndicatorController controller) {
          return child;
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: slivers,
        ),
    );
  }
}
