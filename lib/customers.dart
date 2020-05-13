import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class CustomersPage extends StatefulWidget {
  List<dynamic> customers;
  Session session;

  CustomersPage({this.customers, this.session});

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              http.Response customers = await widget.session
                  .get('http://10.0.2.2:7007/customers', updateHeader: false);
              widget.customers = jsonDecode(customers.body);
              setState(() {
                isLoading = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.input),
            color: Colors.white,
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              http.Response logout = await widget.session
                  .get('http://10.0.2.2:7007/logout', updateHeader: true);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
            },
          )
        ],
        backgroundColor: Color(0XFFF57876),
        title: Text(
          'Customers',
          style: TextStyle(
            wordSpacing: 1,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: widget.customers
                    .map((customer) => customerCard(
                          context,
                          name: customer['name'],
                          gender: customer['gender'],
                          id: customer['_id'],
                          phone: customer['number'],
                        ))
                    .toList(),
              ),
      ),
    );
  }

  Container customerCard(BuildContext context,
      {String name, String phone, String gender, String id}) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                phone,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            gender,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            id,
            style: TextStyle(fontSize: 17, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
