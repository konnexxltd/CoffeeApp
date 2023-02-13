import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:coffee_app_amplify/pages/wrapper/wrapper_state.dart';
import 'package:rxdart/rxdart.dart';

class WrapperBloc {
  final BehaviorSubject<WrapperState> _state = BehaviorSubject<WrapperState>();

  WrapperBloc() {
    initState();
  }

  initState() async {
    var attributes = await Amplify.Auth.fetchUserAttributes();
    _state.add(WrapperState(attributes: attributes));
  }

  Stream<WrapperState> get state => _state.stream;

  void dispose() {
    _state.close();
  }
}
