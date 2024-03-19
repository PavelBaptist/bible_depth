import 'package:bible_depth/ui/svg/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTile extends StatefulWidget {
  ActionPane? endActionPane;
  void Function()? onTap;
  String title;
  MyTile({super.key, required this.title, this.onTap, this.endActionPane});

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData style = Theme.of(context);
    return Slidable(
      key: widget.key,
      endActionPane: widget.endActionPane,
      child: InkWell(
        onHover: (value) {
          selected = value;
          setState(() {});
        },
        canRequestFocus: true,
        onTap: widget.onTap,
        child: Container(
          color: selected
              ? style.colorScheme.primary
              : style.colorScheme.inversePrimary,
          height: 85,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 30),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: selected
                              ? style.colorScheme.inversePrimary
                              : Colors.black,
                        ),
                  ),
                ),
                SvgIcon(
                  selected ? SvgIcons.arrowRightWhite : SvgIcons.arrowRightGrey,
                ),
                const SizedBox(width: 33),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
