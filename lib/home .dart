import 'package:backend_proj/on_Boarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String Name = '';
  final user = FirebaseAuth.instance.currentUser;

  @override
  initState() {
    super.initState();
    getuserdetail();
    setState(() {});
  }

  getuserdetail() {
    try {
      FirebaseFirestore.instance
          .collection('user detail')
          .doc(user!.uid)
          .get()
          .then((value) {
        print(value.data());
        setState(() {
          Name = value.data()?['Name'];
        });
      });
    } catch (e) {}
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut().then((value) => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OnBoarding()))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(30, 150, 30, 0),
      child: Column(
        children: [
          Text(Name),
          Text(user!.email!),
          Text(user!.uid + Name),
          ElevatedButton(onPressed: _signOut, child: const Text('Logout'))
        ],
      ),
    ));
  }
}
