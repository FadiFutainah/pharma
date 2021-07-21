import 'package:flutter/material.dart';

// old edit

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'زياد فارما',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            onTap: (index) {
              // Tab index when user select it, it start from zero
            },
            tabs: [
              Tab(
                text: 'سلات',
              ),
              Tab(
                text: 'منتج',
              ),
              Tab(
                text: 'شركة',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                "1",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Text(
                "2",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Text(
                "3",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// add new product
// add new company
// add new basket
// add new user






// body: Padding(
//   padding: const EdgeInsets.all(15.0),
//   child: GridView(
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//       mainAxisSpacing: 20,
//       crossAxisSpacing: 20,
//     ),
//     children: [
//       ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           color: Colors.blueGrey[200],
//           child: IconButton(
//             icon: Icon(
//               Icons.add,
//               size: 80,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       ),
//       ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           color: Colors.blueGrey[200],
//           child: IconButton(
//             icon: Icon(
//               Icons.add,
//               size: 80,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       ),
//       ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           color: Colors.blueGrey[200],
//           child: IconButton(
//             icon: Icon(
//               Icons.add,
//               size: 80,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       ),
//       ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           color: Colors.blueGrey[200],
//           child: IconButton(
//             icon: Icon(
//               Icons.add,
//               size: 80,
//             ),
//             onPressed: () {},
//           ),
//         ),
//       ),
//     ],
//   ),
// ),