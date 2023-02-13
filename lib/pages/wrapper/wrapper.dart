import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../utils/transition.dart';
import '../dashboard/dashboard.dart';
import '../loading_page.dart';
import 'wrapper_bloc.dart';
import 'wrapper_state.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final WrapperBloc _bloc = WrapperBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WrapperState>(
        stream: _bloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              while (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushReplacement(
                  context,
                  createRoute(
                    Dashboard(
                      key: UniqueKey(),
                    ),
                  ));
            });
          }
          return LoadingPage(key: UniqueKey());
        });
  }
}
