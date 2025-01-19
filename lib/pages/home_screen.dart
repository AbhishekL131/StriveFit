
import 'package:caltrack/pages/calorie_tracker_page.dart';
import 'package:caltrack/pages/food_search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(245, 247, 249, 1),
      appBar: AppBar(
        backgroundColor: Color(0xFF003366),
        title: Text(
          "Cal Track",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 25.0,top: 15.0),
              child: Text(
                "Today",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 3,
                child: Container(
                  height: 235, // Adjusted height for nutrient bars
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily Nutrient Intake',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003366),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildNutrientIndicator("Protein", 0.75, Colors.green, "g"),
                          buildNutrientIndicator("Fat", 0.5, Colors.red, "g"),
                          buildNutrientIndicator("Carbs", 0.6, Colors.blue, "g"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 150,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 8),
                            child: Text(
                              "Steps",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.directions_walk,
                                  size: 45,
                                  color: Colors.pinkAccent,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "6,678",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Horizontal Progress Bar below the Row
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Step Goal: 10,000",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 5),
                                LinearProgressIndicator(
                                  value: 6678 / 10000, // Steps divided by goal
                                  backgroundColor: Colors.grey[300],
                                  color: Colors.pinkAccent,
                                  minHeight: 10,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 150,
                      width: 190,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,left: 15),
                            child: Text(
                              "Exercise",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  size: 45,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 10,),

                                Text(
                                  "400 KCal",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 13.0,top: 5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.cloud_done,
                                  size: 40,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 15,),

                                Text(
                                  "1:01 Hr",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 3,
                child: Container(
                  height: 235, // Adjusted height for nutrient bars
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],

        ),
      ),

    );
  }


  Widget buildNutrientIndicator(
      String label, double percent, Color color, String unit) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 10.0,
          animation: true,
          percent: percent,
          center: new Text(
            "${(percent * 100).toStringAsFixed(1)}%",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: color,
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

}