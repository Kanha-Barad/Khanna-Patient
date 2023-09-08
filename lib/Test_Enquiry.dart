import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:khannapatient/Widgets/BottomNavigation.dart';
import 'package:url_launcher/url_launcher.dart';

class tsetEnquiry extends StatefulWidget {
  const tsetEnquiry({super.key});

  @override
  State<tsetEnquiry> createState() => _tsetEnquiryState();
}

class _tsetEnquiryState extends State<tsetEnquiry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff123456),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            "Test Enquiry",
            style: TextStyle(color: Colors.white),
          ),
        ),
        //info@pathcareindia.com
//         E-8A, Hauz Khas Market,
// New Delhi-110016
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Us : ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Card(
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Color.fromARGB(255, 219, 215, 215), width: 1)),
                  child: Column(
                    children: [
                      ListTile(
                          leading: Icon(
                            Icons.phone_outlined,
                            color: Color.fromARGB(255, 129, 194, 132),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: PhoneCallWidget(
                                            phoneNumber: '01146123456'),
                                      ),
                                      TextSpan(
                                        text: ',  ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          height: 1.4,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: PhoneCallWidget(
                                            phoneNumber: '9785712222'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromARGB(255, 208, 207, 207),
                        thickness: 0.6,
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.email_outlined,
                            color: Color.fromARGB(255, 204, 75, 66),
                          ),
                          title: EmailWidget(
                            email: "info@pathcareindia.com",
                          )),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromARGB(255, 208, 207, 207),
                        thickness: 0.6,
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined,
                            color: Color.fromARGB(255, 204, 75, 66)),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 6.0, bottom: 4),
                          child: Text(
                            "E-8A, Hauz Khas Market, New Delhi-110016",
                            style: TextStyle(
                                height: 1.4,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: AllBottOMNaviGAtionBar(),
    );
  }
}

class PhoneCallWidget extends StatelessWidget {
  final String phoneNumber;

  PhoneCallWidget({required this.phoneNumber});

  void _makePhoneCall(BuildContext context) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(phoneNumber);
    if (res != null && !res) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to make a phone call")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _makePhoneCall(context),
      child: Text(
        phoneNumber,
        style: TextStyle(
            color: Colors.blue,
            height: 1.4,
            fontSize: 14,
            fontWeight: FontWeight.w500
            //decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  final String email;

  EmailWidget({required this.email});

  void _sendEmail(BuildContext context) async {
    var emailURL = "mailto:$email";
    if (await canLaunch(emailURL)) {
      await launch(emailURL);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send an email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _sendEmail(context),
      child: Text(
        email,
        style: TextStyle(height: 1.4, fontSize: 14, fontWeight: FontWeight.w500
            //decoration: TextDecoration.underline,
            ),
      ),
    );
  }
}
