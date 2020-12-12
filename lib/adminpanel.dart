import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  TextEditingController _controller_for_question_number;
  TextEditingController _controller_for_question_value;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HELLO ADMIN BRENDEN"),
      ),
      body: ListView(
        children: [
          Text("Change Questions"),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Please enter question number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _controller_for_question_number.clear();
                    },
                  ))),
          SizedBox(
            height: 50,
          ),
          TextField(
              decoration: InputDecoration(
                  hintText: 'Please write your question',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _controller_for_question_value.clear();
                    },
                  ))),
          RaisedButton(
            onPressed: () {},
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
