import 'package:caltrack/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/food_search_page.dart';
import 'pages/calorie_tracker_page.dart';

void main() async {
  // Ensuring Flutter is fully initialized before Firebase initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase before the app starts
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calorie Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  const MyHomePage(title: "CalTrack"), // Set the initial page
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _page = 0;

  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    HomeScreen(),
    FoodSearchPage(),
    CalorieTrackerPage(),
    // CheckoutScreen()
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: IndexedStack(
        children: pages,
        index: _page,
      ),



      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        onTap: onPageChanged,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,size: 30,),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank,size: 30,),
              label: "Log Food"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,size: 30,),
              label: "Track Cal"
          ),
        ],
      ),



    );
  }
}




