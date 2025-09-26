import 'package:flutter/material.dart';

class FirstUiListItem extends StatefulWidget {
  const FirstUiListItem({super.key, required this.title});
  final String title;

  @override
  State<FirstUiListItem> createState() => _FirstUiListItemState();
}

class _FirstUiListItemState extends State<FirstUiListItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 65,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 212, 215, 216),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.equalizer,
              size: 20,
              color: Colors.black,
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: isChecked ? TextDecoration.lineThrough : null,
                decorationThickness: 3,
              ),
            ),
            trailing: Transform.scale(
              scale: 1.3,

              child: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
