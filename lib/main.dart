import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(RegisterPage());

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0XFFF57876),
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
                      'Learn to code by watching others',
                      style: TextStyle(
                        wordSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 36),
                    child: Text(
                      'See how experienced developers solve problems in real-time.'
                      ' Watching scripted tutorials is great, but understanding '
                      'how developers think is invaluable.',
                      style: TextStyle(
                        height: 1.5,
                        wordSpacing: 1,
//                      fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white.withOpacity(.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0,top: 20),
                    child: RaisedButton(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Color(0xFF5E55A5),
                      onPressed: () {},
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Try it free 7 days',
                              style: TextStyle(
                                wordSpacing: 1,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " then\n \$20/mo. thereafter",
                                  style: TextStyle(
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                )
                              ]),
                        ),
                      )),
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
                            padding: const EdgeInsets.only(
                              bottom: 18,
                            ),
                            child: Container(
                              child: TextFormField(
                                style: TextStyle(
                                    color: Color(0xFF5C5F76), fontSize: 19),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                  hintText: 'First Name',
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
                                style: TextStyle(
                                    color: Color(0xFF5C5F76), fontSize: 19),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                  hintText: 'Last Name',
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
                            onPressed: () {},
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Text('CLAIM YOUR FREE TRIAL',
                                  style: TextStyle(
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),textAlign: TextAlign.center,),
                            )),
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text:
                                      'By clicking the button, you are agreeing\nto our',
                                  style: TextStyle(
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xFFC1C0C8),
                                    fontSize: 14,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: " Terms and Services",
                                      style: TextStyle(
                                        wordSpacing: 1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
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
      ),
    );
  }
}
