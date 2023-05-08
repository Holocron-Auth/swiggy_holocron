import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'home.dart';

class RedirectScreen extends StatefulWidget {
  final String number;
  final Map<String, dynamic> data1;
  const RedirectScreen({required this.number, required this.data1});
  @override
  RedirectScreenState createState() => RedirectScreenState();
}

class RedirectScreenState extends State<RedirectScreen> {

  // late String mobileNumber;

  // String email = "pendyala20096@iiitd.ac.in";
  // File image = File('assets/profile.png');
  bool isExpanded = false;
  bool isExpanded2 = false;


  Future<bool> getConsent(String phone) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };
    var data = '{"json": {"phone":"$phone","clientID": "mu9sNO34Ue-dunlOx2dZ7"}}';

    var url = Uri.parse('https://holocron-auth.gjd.one/api/trpc/mobile.thirdPartyConsent');
    var res = await http.post(url, headers: headers, body: data);

    if (res.statusCode != 200) {
      return false;
    }
    else {
      var decoded = jsonDecode(res.body);
      bool response  =  decoded['result']['data']["json"]["success"];
      // String response1 = response as String;
      print(response);
      return true;
    }
  }

  // String age = "21";
  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;
    // String name = widget.data1['data']['json']['name'];
    String name =widget.data1['data']['json']["user"]['name'];
    String email = widget.data1['data']['json']["user"]['email'];
    String phone = widget.data1['data']['json']["user"]['phone'];
    String gender = widget.data1['data']['json']["user"]["gender"];
    String dob = widget.data1['data']['json']["user"]["dateOfBirth"];
    String address = widget.data1['data']['json']["user"]["address"];
    //calculate age from dob
    DateTime today = DateTime.now();
    DateTime dob1 = DateTime.parse(dob);
    int age1 = today.year - dob1.year;
    // String image = widget.data1[]

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top:0.3*height, left: 0.05 * width, right: 0.05 * width),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: Column(children: [
                Container(margin:EdgeInsets.only(top:0.03*height),child:Text('Login to Swiggy', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black))),
                Row(children: [
Container(      margin:EdgeInsets.only(left:0.04*width),           child: Text('Verified by', style: TextStyle(color: Colors.black)),
),                  Text(' Holocron', style: TextStyle(color: Colors.deepOrange)),
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
                    margin: EdgeInsets.only(top: 0.01 * height, left:0.04 * width),
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
                      child: Text(
                        name.isNotEmpty ? name[0] : "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 0.02 * width),
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
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.black),
                                )),
                            Container(
                                margin: EdgeInsets.only(right: 0.2 * width),
                                child: Text(widget.number.substring(widget.number.length - 10),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black))),
                            Container(
                                child: Text(email,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: Colors.black)))
                          ]))
                ]),
                Container(
                    margin: EdgeInsets.only(top: 0.05 * height, left: 0.04 * width, right: 0.04 * width),
                    width: width,
                    height: 0.05 * height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0))),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffEF4626)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    title: Container(
                                        child: Text('Authorise Access',
                                            style: TextStyle(
                                                color: Colors.black))),
                                    content: Container(
                                        // height: 0.5 * height,
                                        width: width,
                                        child: Column(children: [
                                          Row(children: [
                                            Text('Verified by',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            Text(' Holocron',
                                                style: TextStyle(
                                                    color: Colors.deepOrange)),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 0.01 * width),
                                              child: Image.asset(
                                                'assets/Vector.png',
                                                scale: 6,
                                              ),
                                            ),
                                          ]),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 0.01 * height,
                                                  right: 0.2 * width),
                                              child: Text(
                                                  'This will allow Swiggy to:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18))),
                                          //Expansion Tiles
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 0.01 * height),
                                              // height: 0.08*height,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2)),
                                              child: ExpansionTile(
                                                title: Text(
                                                  'See your Name, Phone Number and Email ID linked to this account',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                onExpansionChanged:
                                                    (bool expanded) {
                                                  isExpanded = expanded;
                                                  print(isExpanded);
                                                },
                                                children: [
                                                  Container(
                                                      child: Text(
                                                    'Name: $name',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                                  Container(
                                                      child: Text(
                                                    "Phone Number:" +  widget.number.substring(widget.number.length - 10),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                                  Container(
                                                      child: Text(
                                                    'Email ID: $email',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                                ],
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 0.01 * height),
                                              // height: 0.08*height,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2)),
                                              child: ExpansionTile(
                                                title: Text(
                                                  'Know your basic information such as Age, Gender and Address',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                onExpansionChanged:
                                                    (bool expanded) {
                                                  isExpanded2 = expanded;
                                                  print(isExpanded2);
                                                },
                                                children: [
                                                  Container(
                                                      child: Text(
                                                    "Age:   ${age1}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                                  Container(
                                                    child:Text(
                                                      "Gender: $gender",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                    )
                                                  )
                                                ],
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 0.01 * height,
                                                  left: 0.01 * width),
                                              child: Text(
                                                  'By clicking Accept, you all this app and Holocron to use your information in accordance with their respective terms of service and privacy policy. You can change this and other account permissions at any times.',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10))),

                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 0.02 * height),
                                              height: 0.07 * height,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.deepOrange,
                                                          elevation: 10),
                                                  onPressed: () async{
                                                    bool consent  = await getConsent(phone);
                                                    // var url = Uri.parse('https://holocron-auth.gjd.one/api/trpc/mobile.thirdPartyConsent');
                                                    if(consent == true){
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PermissionsScreen()),
                                                      );

                                                    }
                                                    else{
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                        content: Text('Consent not Stored. Try Again'),
                                                        duration: Duration(seconds: 2),
                                                      ));
                                                    }

                                                  },
                                                  child: Text('Accept',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 24,
                                                          fontWeight: FontWeight
                                                              .w500)))),

                                          Container(
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                      'I do not want to share these information',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.deepOrange,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .w300))))
                                        ])));
                              });
                        },
                        child: Text("Continue",
                            style: TextStyle(color: Colors.white)))),
                Container(
                    margin: EdgeInsets.only(top: 0.01 * height),
                    child: Text('Login with another Account',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 12))),
                Container(
                    margin: EdgeInsets.only(top: 0.01 * height),
                    child: Text(
                        'By continuing, you agree to sharing your details with the concerned 3rd Part app via Holocron',
                        style: TextStyle(color: Colors.black, fontSize: 8))),
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
              ]),
            ),
          ]),
        ));
  }
}
