import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String title;
  final int index;
  const ListItem({Key? key, required this.title, required this.index})
      : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        title: Text(widget.title),
        subtitle: Text('item number ${widget.index}'),
        leading: Checkbox(
          value: _isSelected,
          onChanged: (value) {
            setState(() {
              _isSelected = value ?? false;
            });
          },
          
        ),
      ),
    );
  }
}
