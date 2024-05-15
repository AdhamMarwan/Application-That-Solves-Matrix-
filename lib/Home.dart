import 'package:flutter/material.dart';
import 'matrix.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homemath(),
  ));
}

class homemath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('AdhamMath'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFA10505), Color(0xFF340D6C)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white, width: 2),
                  bottom: BorderSide(color: Colors.white, width: 2),
                  left: BorderSide(color: Colors.white, width: 2),
                  right: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              child: ListTile(
                leading: Image.asset('assets/6.png'),
                title: Text(
                  'Matrix',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Matrixx()),
                  );
                },
              ),
            ),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.white, width: 2),
                  bottom: BorderSide(color: Colors.white, width: 2),
                  left: BorderSide(color: Colors.white, width: 2),
                  right: BorderSide(color: Colors.white, width: 2),
                ),
              ),
              child: ListTile(
                leading: Image.asset('assets/aaa.jpg'),
                title: Text(
                  '',
                  style: TextStyle(color: Colors.white),
                ),


              ),
            ),
          ],
        ),
      ),
    );
  }
}
