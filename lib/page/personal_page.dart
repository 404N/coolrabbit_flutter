import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Image(image: NetworkImage("https://i.loli.net/2020/01/19/egDEfu5jXlJ6r3a.png"),),),);
  }
}
