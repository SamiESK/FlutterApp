import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
//import 'CoolButton.dart';
import 'package:test/coolbutton.dart';
import 'coolbutton.dart';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 6eezy ya m3lem tany tany ya browski',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Memes Editor Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? image;
  int _counter = 0;

  // Check if gallery image is valid
  Future galleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

// Widget for Image picker buttons
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      //MK changed from Center to Container
      body: AspectRatio(
        aspectRatio: 1 / 2,
        child: ListView(children: [
          Container(
            //  alignment: Alignment.topCenter,
            margin: new EdgeInsets.symmetric(horizontal: 30.0),
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //   margin: EdgeInsets.only(left: 200.0, top: 300.0)),
              children: <Widget>[
                MaterialButton(
                    color: Colors.blue,
                    child: const Text("Pick Image from Gallery",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      galleryImage();
                    }),

                SizedBox(height: 50),

                image != null ? Image.file(image!) : Text("No image selected"),
                // Background button
                Text(
                  'Please choose a Background/Theme',
                  style: Theme.of(context).textTheme.headline6,
                ),

                // Top caption text field
                SizedBox(height: 70),
                TextField(
                  //MK: TextField for input text for captions
                  //MK: the below is for wrapping the text when it finishes the a line
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: null, // when user presses enter it will adapt to it
                  //MK: The below is for not showing borders, and hintText
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    //border: OutlineInputBorder(),
                    hintText: 'Enter a Caption term',
                  ),
                ),

                SizedBox(height: 70),
                Text('Please choose a Media file',
                    style: Theme.of(context).textTheme.headline5),

                // Twitter caption field
                SizedBox(height: 70),
                TextField(
                  //MK: TextField for input text for Twitter captions
                  //MK: the below is for wrapping the text when it finishes the a line
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: null, // when user presses enter it will adapt to it
                  //MK: The below is for not showing borders, and hintText
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    //border: OutlineInputBorder(),
                    hintText: 'Enter a Twitter Caption term (Optional)',
                  ),
                ),
                //MK:Below button is for the Done/Download - Functionality to be added later
                ButtonAnimation(Color.fromRGBO(57, 92, 249, 1),
                    Color.fromRGBO(44, 78, 233, 1)),
              ],
            ),
          ),
        ]),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: trialfunc,
      //   tooltip: 'Download',
      //   child: const Icon(Icons.download),
      // ),
    );
  }

  void trialfunc() {
    print('Hellow');
  }
}
