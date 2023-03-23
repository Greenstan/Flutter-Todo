import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<List<Object>> lifeAreas;
 
  String controlDrop;

  Dropdown(this.controlDrop, this.lifeAreas, {Key key}) : super(key: key);

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  static const lifeAreasA = [
    ["Health", Colors.red],
    ["Social", Colors.blue],
    ["Work", Colors.green]
  ];
  @override
  Widget build(BuildContext context) {

  this.widget.controlDrop = lifeAreasA[0][0];
    
    return Container(
      child: DropdownButton(
          
          value: this.widget.controlDrop,
          items: lifeAreasA.map(
            (index) {
              return DropdownMenuItem(
                child: Text(index[0]),
                value: index,
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(() {
              this.widget.controlDrop = val;
            });
          }),
    );
  }
}
