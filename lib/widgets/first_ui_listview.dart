import 'package:flutter/material.dart';
import 'package:ui_chalenges/widgets/first_ui_list_item.dart';
import 'package:ui_chalenges/widgets/show_dialog.dart';

class FirstUiListview extends StatefulWidget {
  const FirstUiListview({super.key});

  @override
  State<FirstUiListview> createState() => _FirstUiListviewState();
}

class _FirstUiListviewState extends State<FirstUiListview> {
  final List<String> items = [
    'Complete Flutter assignment',
    'Review clean architecture',
    'Practice widget catalog',
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(items[index]),
          direction: DismissDirection.endToStart,
          confirmDismiss: (_) async {
            final confirm = await showDeleteDialog(
              context,
              title: "Confirm Delete",
              itemName: items[index],
            );
            if (confirm) {
              final deletedItem = items[index];
              final deletedIndex = index;

              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('"$deletedItem" deleted'),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      setState(() {
                        items.insert(deletedIndex, deletedItem);
                      });
                    },
                  ),
                  duration: const Duration(seconds: 3),
                ),
              );
            }

            return confirm;
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: FirstUiListItem(
            key: ValueKey(items[index]),
            title: items[index],
          ),
        );
      },
      itemCount: items.length,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex -= 1;
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
      },
    );
  }
}
