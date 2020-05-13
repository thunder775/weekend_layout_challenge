import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekend_layout_challenge/customers.dart';

void main() => runApp(MaterialApp(
      home: RegisterPage(),
      theme: ThemeData(accentColor: Colors.white),
    ));

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '';
  String pwd = '';
  bool isLogging = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF57876),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 24),
                  child: Text(
                    'Use the best CRM to grow your business',
                    style: TextStyle(
                      wordSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 24),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18, top: 0),
                          child: Container(
                            child: TextFormField(
                              onChanged: (newValue) {
                                email = newValue;
                                setState(() {});
                              },
                              style: TextStyle(
                                  color: Color(0xFF5C5F76), fontSize: 19),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  wordSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                                hintText: 'Email Address',
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 16),
                                filled: false,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEDEDE),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18, top: 0),
                          child: Container(
                            child: TextFormField(
                              onChanged: (newValue) {
                                pwd = newValue;
                                setState(() {});
                              },
                              style: TextStyle(
                                  color: Color(0xFF5C5F76), fontSize: 19),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  wordSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                                hintText: 'Password',
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 18.0, horizontal: 16),
                                filled: false,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFDEDEDE),
                                    ),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                        ),
                        RaisedButton(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xFF54CC885),
                          onPressed: () async {
                            setState(() {
                              isLogging = true;
                            });
                            Session session =
                                Session({'Content-Type': 'application/json'});
                            http.Response login = await session.post(
                                'http://10.0.2.2:7007/login',
                                jsonEncode({'user': email, 'pwd': pwd}),
                                updateHeader: true);
                            http.Response customers = await session.get(
                                'http://10.0.2.2:7007/customers',
                                updateHeader: false);
                            if (login.statusCode == 200) {
                              setState(() {
                                isLogging = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustomersPage(
                                            customers:
                                                jsonDecode(customers.body),
                                            session: session,
                                          )));
                            }
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: isLogging
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                        wordSpacing: 1,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 27,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'Create a new Account,',
                                style: TextStyle(
                                  wordSpacing: 1,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFFC1C0C8),
                                  fontSize: 16,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " Signup",
                                    style: TextStyle(
                                      wordSpacing: 1,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                      color: Color(0XFFF57876),
                                    ),
                                  )
                                ]),
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Session {
  Map<String, String> headers = {};
  bool sessionCreated = false;

  Session(Map<String, String> headers) {
    this.headers = headers;
  }

  Future<http.Response> get(String url, {bool updateHeader}) async {
    http.Response response1 = await http.get(url, headers: headers);
    updateCookie(response1, updateHeader);
    return response1;
  }

  Future<http.Response> post(String url, dynamic data,
      {bool updateHeader}) async {
    http.Response response = await http.post(url, body: data, headers: headers);
    updateCookie(response, updateHeader);
    return response;
  }

  void updateCookie(http.Response response, bool updateHeader) {
    if (updateHeader) {
      String rawCookie = response.headers['set-cookie'];
      List<String> cookies = rawCookie.split(';');
      String session = cookies[0];
      String sessionSig = cookies[3].toString().split(',')[1];
      this.headers['Cookie'] = session + ';' + sessionSig;
    }
  }
}
