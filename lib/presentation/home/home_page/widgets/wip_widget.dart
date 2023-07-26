import 'package:authorization/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class WIPWidget extends StatelessWidget {
  const WIPWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Placeholder(),
        Center(child: Text(S.of(context).wip)),
      ],
    );
  }
}
