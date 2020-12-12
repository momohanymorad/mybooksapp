
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mybookapp/answers.dart';
import 'package:toast/toast.dart';

class DashBoardScreen extends StatefulWidget {
  int index = 0;

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

String button_txt = "Submit";
final databaseReference = FirebaseDatabase.instance.reference();
final userId = FirebaseAuth.instanceFor().currentUser.uid;

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    TextEditingController _controller = new TextEditingController();
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: h / 7,
        ),
        Text(
          "Question " +
              (widget.index + 1).toString() +
              " / 20" +
              "\n" +
              ques[widget.index],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.lightBlue,
              fontSize: 20),
        ),
        SizedBox(
          height: h / 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
              controller: _controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  hintText: 'Please enter your answer..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _controller.clear();
                    },
                  ))),
        ),
        SizedBox(
          height: h / 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: h / 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {
                //  databaseReference.child(userId).set({
                  //  "question ${widget.index + 1}": _controller.text,
                  //});
                  setState(() {
                    if (widget.index >= 19) {
                      setState(() {
                        button_txt = "Done";
                        return null;
                      });
                    }
                    if (_controller.text.isNotEmpty && widget.index < 19) {
                      widget.index++;
                    }
                  });
                },
                child: Text(
                  button_txt,
                  style: TextStyle(color: Colors.green),
                ),
              ),
              RaisedButton(
                child: Text("See My Answers"),
                onPressed: () {
                  if (widget.index != 19) {
                    Toast.show("Please answer all questions", context,
                        duration: 3,
                        backgroundColor: Colors.lightBlue,
                        backgroundRadius: 15,
                        textColor: Colors.black);
                    return null;
                  }
                  if (widget.index > 18) {
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Answers(),
                    ));
                  }
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}

List<String> ques = [
  'Whats your name ?',
  'Whats your budget ?',
  'Whats your Age ?',
  'Whats your number ?',
  'Whats your Gender ?',
  'Whats your granp father name ?',
  'Whats your Gender ?',
  'Whats your eats ?',
  'Whats you father name ?',
  'Whats your Gender ?',
  'What was your most embarrassing ',
  'Whats your Gender ?',
  'Whats you mother name',
  'Have You Ever Dine ?',
  "Would You Rather Have ?",
  "Have You Ever Been In A Car ?",
  'Whats your Gender ?',
  'Whats your age ?',
  'Whats your name ?',
  'Whats your eating ?',
];
List<String> answers = [];
