import 'package:flutter/material.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  late final TextEditingController noteTextController = TextEditingController();
  late final notes = <String>[];

  @override
  void initState() {
    super.initState();
    notes.addAll([
      'Get groceries from Walmart',
      'Buy a new phone',
      'Call mom',
      'Call dad'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add A Note'),
                  content: TextFormField(
                    controller: noteTextController,
                    decoration: InputDecoration(
                      hintText: 'Enter your note here',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        noteTextController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          notes.add(noteTextController.text);
                        });
                        noteTextController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text('You can swipe to delete a note ⇆',
                style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(notes[index]),
                      onDismissed: (direction) {
                        setState(() {
                          notes.removeAt(index);
                        });
                      },
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(title: Text(notes[index])),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
