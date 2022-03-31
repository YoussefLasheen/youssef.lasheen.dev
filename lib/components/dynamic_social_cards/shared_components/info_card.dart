import 'package:flutter/material.dart';
import 'package:foil/foil.dart';

class InfoCard extends StatefulWidget {
  final Function buildChild;
  final Widget onhoverChild;
  final Function onPressed;
  final Future fetchData;

  const InfoCard({
    Key? key,
    required this.buildChild,
    required this.onhoverChild,
    required this.onPressed,
    required this.fetchData,
  }) : super(key: key);

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  late Future futureAlbum;
  bool hovering = false;

  @override
  void initState() {
    super.initState();
    futureAlbum = widget.fetchData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ConstrainedBox(
            constraints: const BoxConstraints.expand(height: 125, width: 300),
            child: Card(
              color: const Color(0xFF1f1e1f),
              elevation: hovering ? 20 : 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  widget.onPressed(snapshot);
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) {
                    setState(() {
                      hovering = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      hovering = false;
                    });
                  },
                  child: Foil(
                    isUnwrapped: !hovering,
                    child: IndexedStack(
                      index: hovering ? 0 : 1,
                      children: [
                        Center(child: widget.onhoverChild),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.buildChild(snapshot)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
