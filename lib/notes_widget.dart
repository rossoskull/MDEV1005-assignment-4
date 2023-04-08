import 'package:flutter/material.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  /// controller for the text field in the dialog box.
  late final TextEditingController noteTextController = TextEditingController();

  /// list of notes.
  late final notes = <String>[];

  @override
  void initState() {
    super.initState();

    /// add some initial notes.
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
          /// show the dialog box.
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
                        /// clear the text field and close the dialog box.
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
                        /// add the note to the list and close the dialog box.
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
                        /// remove the note from the list.
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
