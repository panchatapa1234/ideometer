import 'package:flutter/material.dart';
import 'package:ideometer/secondpage.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var img =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQq_viEhQXwto0IUuxO7LTnyfyJVCkVWtJ8KWp1rETEGuXt79pv8ebOQuILDIu1yDIdgnw&usqp=CAU';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 4, 144),
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
                                  fit: BoxFit.cover, image: NetworkImage(img))))
                    ]))),
            Center(
                child: Column(children: [
              SizedBox(
                height: height * 0.2,
              ),
              Container(
                child: Text(
                  "Ideas Submitted :",
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 244, 245)),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Secondpage(),
                      ));
                },
                icon: Column(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Ideas Funded :",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ])),
          ])),
    );
  }
}
