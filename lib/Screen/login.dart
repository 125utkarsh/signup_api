import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async{

    try{

      Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email' : email,
          'password' : password
        }
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data);
        print('account create successfully');
      }else{
        print('failed');
      }
      //eve.holt@reqres.in
      //pistol

    }catch(e){
      print(e.toString());
    }
  }

  //@override
  //void initState(){
  //  super.initState();
  //}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/login123.jpeg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text('Welcome\nBack', style: TextStyle(
                color: Colors.white,
                fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,right: 35,left: 35
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: (){
                        login(emailController.text.toString(), passwordController.text.toString());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Sign In', style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w700),
                        ),

                      Row(
                        children: [
                         // TextButton(onPressed: (){}, child: Text('Sign Up'))
                        ],
                      )
                  ],
                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /*  drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              accountName: Text('utkarsh'),
              accountEmail: Text('123@gmail.com'),
              currentAccountPicture: CircleAvatar(foregroundImage: AssetImage("image decode.png")),
            ),
            ListTile(leading: Icon(Icons.home), title: Text("Home"), ),
          ],
        ),
      ),*/
    /*  body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 11),
                                color: Colors.green, // Set a fixed width
                                height: 50,
                                width: 180,// Set a fixed height
                                //alignment: Alignment.center,
                              ),
                              Container(
                                //margin: const EdgeInsets.only(right: 11),
                                color: Colors.green, // Set a fixed width
                                height: 50,
                                width: 180,// Set a fixed height
                                //alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 11),
                                color: Colors.green, // Set a fixed width
                                height: 50,
                                width: 180,// Set a fixed height
                                //alignment: Alignment.center,
                              ),
                              Container(
                                //margin: const EdgeInsets.only(right: 11),
                                color: Colors.green, // Set a fixed width
                                height: 50,
                                width: 180,// Set a fixed height
                                //alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 11),
                                color: Colors.green, // Set a fixed width
                                height: 50,
                                width: 180,// Set a fixed height
                                //alignment: Alignment.center,
                              ),
                              Container(
                                //margin: const EdgeInsets.only(right: 11),
                                color: Colors.green, // Set a fixed width
                                height: 50,
                                width: 180,// Set a fixed height
                                //alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
        ),
      ), */
    );
  }
}