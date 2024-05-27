import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ideometer/fourthpage.dart';
import 'package:image_picker/image_picker.dart';

class Thirdpage extends StatefulWidget {
  const Thirdpage({super.key});

  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  Uint8? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var img =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq_viEhQXwto0IUuxO7LTnyfyJVCkVWtJ8KWp1rETEGuXt79pv8ebOQuILDIu1yDIdgnw&usqp=CAU';
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 4, 4, 144),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 4, 144),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          title: Center(
            child: Text(
              "Idea-O-Meter",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                    elevation: 10,
                    child: Container(
                        alignment: AlignmentDirectional.topStart,
                        height: height * 0.1,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 246, 245, 247),
                        ),
                        child: Column(children: [
                          Container(
                              height: height * 0.1,
                              width: width * 3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(img))))
                        ]))),
                Container(
                  alignment: Alignment.topLeft,
                  height: height * 0.7,
                  width: width * 1,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "Home/Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      MemoryImage(_image! as Uint8List))
                              : const CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    weight: 20,
                                    size: 30,
                                  ),
                                  radius: 50,
                                ),
                        ],
                      ),
                      Positioned(
                          bottom: -0,
                          left: 140,
                          child: IconButton(
                              onPressed: () {
                                showImagePickerOption(context);
                              },
                              icon: const Icon(Icons.add_a_photo)))
                    ],
                  ),
                ),
              ]),
        ));
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 90,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera,
                            size: 90,
                          ),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 90,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync() as Uint8?;
    });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'What is idea-o-ometer?',
    'College',
    'Idea',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var idea in searchTerms) {
      if (idea.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(idea);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var idea in searchTerms) {
      if (idea.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(idea);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
