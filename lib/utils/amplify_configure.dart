import 'dart:developer';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';

class AmplifyConfigure {
  static configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      final datastorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
      await Amplify.addPlugin(datastorePlugin);
      await Amplify.addPlugin(AmplifyAPI());
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      log('Could not configure Amplify: $e');
    }
  }
}
