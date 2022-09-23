import 'package:dropdownapi/test.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = [
    'Anas',
    'Yousuf',
    'Anas1',
    'Rehman',
    'Tauseef',
    'Ajmal'
  ];
  final subti = [
    'asad@gmail.com',
    'asad@gmail.com',
    'asad@gmail.com',
    'asad@gmail.com',
    'asad@gmail.com',
    'asad@gmail.com',
  ];
  // List<String>.generate(10, (i) => "Item $i");

  var items = <String>[];
  @override
  void initState() {
    items.addAll(duplicateItems);
    items.addAll(subti);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Search Filter"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: InkWell(
                      onTap: () {},
                      child: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Test(
                                        title: items[index],
                                        subtitlee: subti[index],
                                      )));
                        },
                        child: Text('${items[index]}')),
                    subtitle: Text('${subti[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'dart:html';

// import 'package:flutter/material.dart';

// import 'Api/bankdetaill.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   String _dropcommitteesub = "";

//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Welcome to Flutter',
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Welcome to Flutter'),
//           ),
//           body: FutureBuilder(
//             future: getbanks(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Text('Loading...');
//               } else if (snapshot.data == null) {
//                 print("object  :null data  ${snapshot.data}");
//                 return InkWell(onTap: () {}, child: Text(''));
//               } else {
//                 return DropdownButton<String>(
//                   isExpanded: true,
//                   underline: Container(),
//                   hint: _dropcommitteesub == ""
//                       ? Text('Select Payment method')
//                       : Text(
//                           _dropcommitteesub,
//                         ),
//                   items: [
//                     for (var i = 0; i < snapshot.data.length; i++) ...[
//                       '${snapshot.data[i].bank_title}',
//                     ]
//                   ].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(
//                         value,
//                         style: TextStyle(color: Color.fromARGB(255, 2, 107, 6)),
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _dropcommitteesub = value!;

//                       for (var i = 0; i < snapshot.data.length; i++) {
//                         if (_dropcommitteesub ==
//                             '${snapshot.data[i].bank_title}') {
//                           print("Yousuf");

//                           // Container(
//                           //   width: MediaQuery.of(context).size.width * 0.9,
//                           //   margin: EdgeInsets.only(
//                           //     top: MediaQuery.of(context).size.height * 0.01,
//                           //     bottom: MediaQuery.of(context).size.height * 0.05,
//                           //   ),
//                           //   child: Column(
//                           //     children: [
//                           //       // Jazzcash(context, "Easypaisa"),
//                           //       Container(
//                           //         width:
//                           //             MediaQuery.of(context).size.width * 0.90,
//                           //         height:
//                           //             MediaQuery.of(context).size.height * 0.20,
//                           //         decoration: BoxDecoration(
//                           //           color: Colors.green,
//                           //           borderRadius: BorderRadius.only(
//                           //             bottomRight: Radius.circular(20),
//                           //             bottomLeft: Radius.circular(20),
//                           //           ),
//                           //           boxShadow: [
//                           //             BoxShadow(
//                           //               color: Colors.grey.withOpacity(0.2),
//                           //               spreadRadius: 5,
//                           //               blurRadius: 7,
//                           //               offset: Offset(
//                           //                   0, 3), // changes position of shadow
//                           //             ),
//                           //           ],
//                           //         ),
//                           //         child: bankcarddetail(context, "Easypaisa",
//                           //             "HBL", "4210145848848", "454545025145"),
//                           //       ),
//                           //     ],
//                           //   ),
//                           // );

//                           // bankcarddetail(
//                           //   context,
//                           //   '${snapshot.data[i].acc_ttitle}',
//                           //   '${snapshot.data[i].acc_no}',
//                           //   '${snapshot.data[i].acc_iban}',
//                           //   '${snapshot.data[i].bank_title}',
//                           // );
//                         }
//                       }

//                       //  _dropDownValue = "";

//                       print(_dropcommitteesub);
//                     });
//                   },
//                 );

//                 //
//               }
//             },
//           ),
//         ));
//   }

//   Widget bankcarddetail(context, banktitle, acctitle, accno, acciban) {
//     return Container(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//       SizedBox(
//         height: 10,
//       ),
//       Text(
//         'Account title',
//         style: TextStyle(fontSize: 10, color: Colors.black),
//       ),
//       Text(
//         acctitle,
//         style: TextStyle(fontSize: 18, color: Colors.black),
//       ),
//       Text(
//         'Account Number',
//         style: TextStyle(fontSize: 10, color: Colors.black),
//       ),
//       Text(
//         accno,
//         style: TextStyle(fontSize: 18, color: Colors.black),
//       ),
//       Text(
//         'IBAN',
//         style: TextStyle(fontSize: 10, color: Colors.black),
//       ),
//       Text(
//         accno,
//         style: TextStyle(fontSize: 18, color: Colors.black),
//       ),
//     ]));
//   }
// }


