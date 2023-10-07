import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            //Customer Image
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.amberAccent,
                backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.6aa49513b4d471bb0b090745fc53df46?rik=xSqrwUDjme65Ig&pid=ImgRaw&r=0',
                ),
              ),
            ),
            //Customer Name
            Container(
                height: 75,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400],
                    border: Border.all(
                      color: const Color.fromRGBO(189, 189, 189, 1),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange[400],
                      radius: 35,
                      child: const Icon(Icons.person,
                          size: 35, color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    const Text('Okasha Shaibu', style: TextStyle(fontSize: 20)),
                  ]),
                )),
            const SizedBox(height: 20),
            //Customer Phone Number
            Container(
                height: 75,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[400]),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 192, 236, 32),
                      radius: 35,
                      child: Icon(Icons.phone, size: 35, color: Colors.white),
                    ),
                    SizedBox(width: 15),
                    Text('0550673133', style: TextStyle(fontSize: 20)),
                  ]),
                )),
            const SizedBox(height: 20),
            //Customer Location
            Container(
                height: 75,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundColor: Colors.deepOrange[400],
                      radius: 35,
                      child: const Icon(Icons.location_on,
                          size: 35, color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    const Text('Aboaso', style: TextStyle(fontSize: 20)),
                  ]),
                ))
          ]),
        ));
  }
}
