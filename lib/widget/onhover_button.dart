import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnhoverButton extends StatefulWidget {
  final Widget child;
  final Widget button;
  final Function onPressed;
  const OnhoverButton({
    Key? key,
    required this.child,
    required this.button,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<OnhoverButton> createState() => _OnhoverButtonState();
}

class _OnhoverButtonState extends State<OnhoverButton> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (_hovering) {
        setState(() {
          hovering = _hovering;
        });
      },
      onTap: ()=> widget.onPressed(),
      child: IndexedStack(
        index: hovering ? 0 : 1,
        children: [Center(child: widget.button), widget.child],
      ),
    );
  }
}
