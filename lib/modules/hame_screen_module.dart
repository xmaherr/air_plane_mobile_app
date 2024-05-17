import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HomeScreenModule extends StatelessWidget {
  const HomeScreenModule ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Volami Airlines",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w100,
            fontFamily: 'Times New Roman',
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF161E36),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("welcome Maher",
            style: TextStyle(
                fontSize: 20,
              fontWeight: FontWeight.w100,
              fontFamily: 'Times New Roman',
            ),
            ),
            Divider(),
            Row(
              children: [
                Text("upcoming flights",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                SizedBox(width: 10,),
                Icon(Icons.flight_takeoff)
              ],
            ),
            Expanded(
              child:  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Date'),
                      ),
                      DataColumn(
                        label: Text('Route'),
                      ),
                      DataColumn(
                        label: Text('Cancle'),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      20,
                          (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(DateFormat.yMMMd().format(DateTime.now()))), DataCell(
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 90), // Limit the width of the Route column
                              child: Text('Cairo-London'),
                            ),
                          ),
                          DataCell(
                            IconButton(
                              icon: Icon(Icons.cancel),
                              color: Colors.red,
                              onPressed: () {
                                // Define your cancel button action here
                                print('Cancel button pressed for Person $index');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
