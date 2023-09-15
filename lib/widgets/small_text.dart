import 'package:flutter/widgets.dart';

class SmallText extends StatelessWidget {
  final String text;

  const SmallText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w300,
        overflow: TextOverflow.ellipsis,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
