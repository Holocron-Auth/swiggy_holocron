import 'package:Swiggy_Holocron/redirect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'dart:io';
import 'package:mobile_number/mobile_number.dart';

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
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

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
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 0.25 * height),
                    child: Image.asset('assets/front.png'),
                  ),
                ],
              )),
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
                  onPressed: () {
                    String mobileNumber = _mobileNumber;
                    print("here it is ");
                    print(mobileNumber);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RedirectScreen(number: mobileNumber)),
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
