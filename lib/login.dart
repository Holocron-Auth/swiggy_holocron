import 'dart:convert';

import 'package:Swiggy_Holocron/redirect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'dart:io';
import 'package:mobile_number/mobile_number.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "Ritvik Pendyala";
  String number = "9502546860";
  String email = "pendyala20096@iiitd.ac.in";
  // File image = File('assets/profile.png');
  bool isExpanded = false;
  bool isExpanded2 = false;
  String age = "21";
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  Future<Map<String, dynamic>> fetchData(String phone) async {
    var headers = {
      'ngrok-skip-browser-warning': '1',
      'Content-Type': 'text/plain',
    };
    String phone1 = (phone.substring(phone.length - 10));

    var data =
        '{"json": {"phone": "$phone1" , "clientID": "mu9sNO34Ue-dunlOx2dZ7", "scope": "identify email phone address"}}';

    // var url =
    //     Uri.parse('https://55e1-103-25-231-102.ngrok-free.app/api/trpc/mobile.thirdParty');
    var url = Uri.parse('https://holocron-auth.gjd.one/api/trpc/mobile.thirdParty');
    print("In progress");
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Details couldn't be retrieved"),
        duration: Duration(seconds: 2),
      ));
    }
    print(res.body);
    print("splitter");
    var decoded = jsonDecode(res.body);
    print(decoded);
    // print(decoded['result']['data']['json']['user']['name']);
    // print(jsonDecode(res.body)['result']['data']['json']['name']);
    // print(decoded['result'].runtimeType);
    return decoded['result'];
    // print(res.body);
  }

  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _padding = MediaQuery.of(context).padding;
    double width = (MediaQuery.of(context).size.width);
    double height = (MediaQuery.of(context).size.height) -
        _padding.top -
        _padding.bottom -
        kBottomNavigationBarHeight;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Container(
            width: width,
            color: Colors.orange,
            margin: EdgeInsets.only(top: 0.02 * height),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 0.25 * height),
              child: Image.asset('assets/front.png'),
            ),
          ),
          Container(
            child: Text('S W I G G Y',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 0.1 * width,
                    fontWeight: FontWeight.bold)),
          ),
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
                  onPressed: () async {
                    String mobileNumber = _mobileNumber;
                    String mobile =
                        mobileNumber.substring(mobileNumber.length - 10);
                    print("here it is ");
                    print(mobile);
                    var response = await fetchData(mobileNumber);
                    print(response);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RedirectScreen(number: mobile, data1: response)),
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
