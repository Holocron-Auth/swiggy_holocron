import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "Priya Aggarwal";
  String number = "9502546860";
  String email = "priyaaggarwal@gmail.com";
  File image = File('assets/profile.png');
  bool isExpanded = false;
  bool isExpanded2 = false;
  String age = "21";

  @override
  // void initState(){
  //   image = File('assets/profile.png');
  // }
  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: width,
              color: Colors.orange,
              margin: EdgeInsets.only(top: 0.02 * height),
              child: Stack(
                children: [
                  Container(
                    child: Image.asset('assets/back.png', fit: BoxFit.fitWidth),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 0.25 * height),
                    child: Image.asset('assets/front.png'),
                  ),
                ],
              )),
          Container(
              height: 0.09 * height,
              margin: EdgeInsets.only(
                  left: 0.05 * width, right: 0.05 * width, top: 0.2 * height),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  )),
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => PermissionsScreen()),
                    // );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          title: Container(child: Text('Login to Swiggy')),
                          content: Container(
                              height: 0.357 * height,
                              child: Column(children: [
                                Row(children: [
                                  Text('Verified by',
                                      style: TextStyle(color: Colors.black)),
                                  Text(' Holocron',
                                      style:
                                          TextStyle(color: Colors.deepOrange)),
                                  Container(
                                    margin: EdgeInsets.only(left: 0.01 * width),
                                    child: Image.asset(
                                      'assets/Vector.png',
                                      scale: 6,
                                    ),
                                  ),
                                ]),
                                Row(children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 0.01 * height),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.orange,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: FileImage(image!),
                                    ),
                                  ),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 0.02 * width),
                                      child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: 0.01 * height,
                                                    right: 0.1 * width,
                                                    bottom: 0.01 * height),
                                                child: Text(
                                                  name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                )),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    right: 0.15 * width),
                                                child: Text('+91 ' + number,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: Colors.black))),
                                            Container(
                                                child: Text(email,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 14,
                                                        color: Colors.black)))
                                          ]))
                                ]),
                                Container(
                                    margin: EdgeInsets.only(top: 0.05 * height),
                                    width: width,
                                    height: 0.05 * height,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100.0))),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffEF4626)),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(25)),
                                                    title: Container(
                                                        child: Text(
                                                            'Authorise Access',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black))),
                                                    content: Container(
                                                        // height: 0.5 * height,
                                                        width: width,
                                                        child:
                                                            Column(children: [
                                                          Row(children: [
                                                            Text('Verified by',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black)),
                                                            Text(' Holocron',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .deepOrange)),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 0.01 *
                                                                          width),
                                                              child:
                                                                  Image.asset(
                                                                'assets/Vector.png',
                                                                scale: 6,
                                                              ),
                                                            ),
                                                          ]),
                                                              Container(
                                                                margin: EdgeInsets.only(top:0.01*height, right:0.2*width),
                                                                  child:Text('This will allow Swiggy to:', style: TextStyle(color: Colors.black, fontSize: 18))),
                                                              //Expansion Tiles 
                                                              Container(
                                                                margin: EdgeInsets.only(top:0.01*height),
                                                                // height: 0.08*height,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                  border: Border.all(color: Colors.black, width: 2)
                                                                ),
                                                                child:ExpansionTile(title: Text('See your Name, Phone Number and Email ID linked to this account', style: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.w400),),
                                                                  onExpansionChanged: (bool expanded) {
                                                                    isExpanded = expanded;
                                                                    print(isExpanded);
                                                                  },
                                                                  children: [
                                                                    Container(
                                                                      child:Text(
                                                                        'Name: $name',style: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.w400),
                                                                      )
                                                                    ),
                                                                    Container(
                                                                      child:Text(
                                                                        'Phone Number: +91$number',style: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.w400),
                                                                      )
                                                                    ),
                                                                    Container(
                                                                      child: Text(
                                                                        'Email ID: $email',style: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.w400),
                                                                      )
                                                                    ),
                                                                  ],
                                                                )
                                                              ),
                                                              Container(
                                                                  margin: EdgeInsets.only(top:0.01*height),
                                                                  // height: 0.08*height,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                      border: Border.all(color: Colors.black, width: 2)
                                                                  ),
                                                                  child:ExpansionTile(title: Text('Know your basic information such as Age, Gender and Address', style: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.w400),),
                                                                    onExpansionChanged: (bool expanded) {
                                                                      isExpanded2 = expanded;
                                                                      print(isExpanded2);
                                                                    },
                                                                    children: [
                                                                      Container(
                                                                        child:Text("Age: " + age, style: TextStyle(color:Colors.black, fontSize: 12,fontWeight: FontWeight.w400),)
                                                                      )



                                                                    ],
                                                                  )
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top:0.01*height, left:0.01*width),
                                                                child:Text('By clicking Accept, you all this app and Holocron to use your information in accordance with their respective terms of service and privacy policy. You can change this and other account permissions at any times.', style: TextStyle(color:Colors.black, fontWeight: FontWeight.w300 , fontSize: 10))
                                                              ),

                                                              Container(
                                                                margin: EdgeInsets.only(top:0.02*height),
                                                                height: 0.07*height,
                                                                width: width,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                                                ),
                                                                child:ElevatedButton(
                                                                  style:ElevatedButton.styleFrom(
                                                                    backgroundColor: Colors.deepOrange,
                                                                    elevation: 10
                                                                  ),
                                                                  onPressed: () {
                                                                    Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) => PermissionsScreen()),
                                                                    );
                                                                  },
                                                                  child: Text('Accept', style:TextStyle(color:Colors.white, fontSize: 24, fontWeight: FontWeight.w500))

                                                                )
                                                              ),

                                                              Container(
                                                                child: TextButton(
                                                                  onPressed: () {  },
                                                                  child:Text('I do not want to share these information', style: TextStyle(color:Colors.deepOrange, fontSize:12, fontWeight: FontWeight.w300 ))

                                                                )
                                                              )
                                                        ]))
                                                );
                                              });
                                        },
                                        child: Text("Continue",
                                            style: TextStyle(
                                                color: Colors.white)))),
                                Container(
                                    margin: EdgeInsets.only(top: 0.01 * height),
                                    child: Text('Login with another Account',
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 12))),
                                Container(
                                    margin: EdgeInsets.only(top: 0.01 * height),
                                    child: Text(
                                        'By continuing, you agree to sharing your details with the concerned 3rd Part app via Holocron',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 8))),
                                Container(
                                    child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Terms and Conditions',
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))
                              ])),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0.1 * width),
                        // margin: EdgeInsets.only(top: 0.25 * height),
                        child: Image.asset(
                          'assets/Vector.png',
                          scale: 4,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 0.03 * width),
                          child: Text(
                            'Continue with Holocron',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ))
                    ],
                  )))
        ],
      ),
    );
  }
}
