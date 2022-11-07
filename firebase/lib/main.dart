import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var moviesRef = firestore.collection("movies");
    var babaRef = moviesRef.doc("The Godfather");
    print("Babaref " + babaRef.id);
    return Scaffold(
      appBar: AppBar(title: Text("Filmler")),
      body: Center(
        child: Container(
            child: Column(
          children: [
            /* ElevatedButton(
              onPressed: () async {
                var response = await moviesRef.get();
                var list = response.docs;
                print(list.first.data());
              },
              child: Text("get data"),
            ), */
            StreamBuilder<QuerySnapshot>(
              stream: moviesRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  List<DocumentSnapshot> listOfDocumentSnapshot =
                      asyncSnapshot.data.docs;
                  return Flexible(
                    child: ListView.builder(
                      itemCount: listOfDocumentSnapshot.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.indigo,
                          child: ListTile(
                            title: Text(
                                '${listOfDocumentSnapshot[index]['name']}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${listOfDocumentSnapshot[index]['rating']}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white)),
                                Text('${listOfDocumentSnapshot[index]['year']}',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
