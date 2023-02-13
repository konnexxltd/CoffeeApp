import 'package:flutter/material.dart';

import '../widgets/two_tone_text.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TwoToneText(
          firstText: 'coffee ',
          secondText: 'app',
          tag: 'two_tone_text',
          fontSize: 36,
          key: UniqueKey(),
        ),
      ),
    );
  }
}
