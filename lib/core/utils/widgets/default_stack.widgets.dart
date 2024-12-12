import 'package:flutter/widgets.dart';
import 'package:emeron/core/utils/constants/constants.dart';

class DefaultStack extends StatelessWidget {
  final Widget child;

  const DefaultStack({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppImages.bg,
          fit: BoxFit.fill,
        ),
        SafeArea(child: child)
      ],
    );
  }
}
