import 'package:flutter/material.dart';
import 'package:ideometer/thirdpage.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

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
                                    fit: BoxFit.cover,
                                    image: NetworkImage(img))))
                      ]))),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    Text(
                      "LOGIN WITH YOUR ACCOUNT",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                      decoration: InputDecoration(
                          hintText: "Username",
                          prefixIconColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          filled: true,
                          prefixIcon: Icon(Icons.person))),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none),
                        fillColor:
                            Theme.of(context).primaryColor.withOpacity(0.4),
                        filled: true,
                        prefixIcon: Icon(Icons.person)),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  Text(
                    "                                Do not have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Thirdpage(),
                            ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ]),
      ),
    );
  }
}
