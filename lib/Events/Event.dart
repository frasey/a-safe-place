import 'package:a_safe_place/Events/StandardInputField.dart';
import 'package:a_safe_place/Database/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:a_safe_place/Tags/Tag.dart';
import 'package:a_safe_place/Tags/tag_dialog.dart';

class Event extends StatefulWidget {
  const Event ({Key? key}) : super(key: key);

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {

  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("WidgetsBinding");
       // await MongoDatabase.connect();
      print("post db");

    });
  }
  
  final _formKey = GlobalKey<FormState>();   // handles the validator

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Create New",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SingleChildScrollView(scrollDirection: Axis.vertical),
                // EVENT TITLE
                const StandardInputField(
                    name: 'Event title', keyboardType: TextInputType.text),
                // DATE * TIME
                const StandardInputField(
                    name: 'Date and Time',
                    keyboardType: TextInputType.datetime),
                // LOCATION
                const StandardInputField(
                    name: 'Location', keyboardType: TextInputType.text),
                // DESCRIPTION
                const StandardInputField(
                    name: 'Description', keyboardType: TextInputType.multiline),
                // REMINDER - PLACEHOLDER
                const StandardInputField(
                    name: 'Reminder', keyboardType: TextInputType.text),
                // CONTACT NAME
                const StandardInputField(
                    name: 'Contact name', keyboardType: TextInputType.text),
                // CONTACT NUMBER
                const StandardInputField(
                    name: 'Contact number', keyboardType: TextInputType.phone),
                // UPLOAD DOCS/IMAGES - PLACEHOLDER
                const StandardInputField(
                    name: 'Upload docs/images',
                    keyboardType: TextInputType.text),

                ElevatedButton(
                  onPressed: () async {
                    Tag? newTag = await showAddTagDialog(context);
                    if (newTag != null) {
                      print("New Tag: ${newTag.name}");
                    }
                  },
                  child: const Text('Add Tag'),
                ),

                // ELEVATED BUTTON
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //if currentState value is true, then trigger the scaffold messenger to trigger the validator of every text form field
                        // collection.insertMany()
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Great!'),
                          ),
                        );
                      }
                    },
                    child: const Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TODO stop form overflow
// TODO alter description field to larger size
// TODO reminders
// TODO image uploads
// TODO save to db