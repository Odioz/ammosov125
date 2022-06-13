import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'meropriat.dart';
import 'cxema.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: 
    FirebaseOptions(apiKey: "AIzaSyD-_Tzx1XXzpsHw5ugT-ZQAZdhRIL5zu88", appId: "1:654150344430:web:067652c636f05b411dddff", messagingSenderId: "654150344430", projectId: "ammosov125", databaseURL: "https://ammosov125-default-rtdb.firebaseio.com"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

//  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ысыах',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: 
           Scaffold(
                body: DefaultTabController(
                    length: 2,
                    child: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 200.0,
                            floating: false,
                            pinned: false,
                            flexibleSpace: FlexibleSpaceBar(
                                centerTitle: true,
                                title: Text("Республиканский ысыах",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    )),
                                background: Image.asset(
                                  "/images/amm.jpg",
                                  fit: BoxFit.fitHeight,
                                )),
                          ),
                          SliverPersistentHeader(
                            delegate: _SliverAppBarDelegate(
                              TabBar(
                                labelColor: Colors.black87,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(text: "Программа"),
                                  Tab(text: "Схема"),
                                ],
                              ),
                            ),
                            pinned: true,
                          ),
                        ];
                      },
                      body: Center(
                        child: TabBarView(
                          children: [PokazMeropriat(), PokazCxemy()],
                        ),
                      ),
                    ))));
          }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
