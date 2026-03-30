import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toggleselection extends StatefulWidget {
  const Toggleselection({super.key});

  @override
  State<Toggleselection> createState() => _ToggleselectionState();
}

class _ToggleselectionState extends State<Toggleselection> {

  bool isfollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
           Stack(
             clipBehavior: Clip.none,
             children: [
               CircleAvatar(
                 radius: 140,
                 backgroundImage:  AssetImage('assets/WhatsApp Image 2025-11-21 at 16.07.52.jpeg'),
               ),

               Positioned(
                 left: 0,
                 right: 0,
                 bottom: -20,
                 child: GestureDetector(
                   onTap: (){
                     setState(() {
                       isfollow =! isfollow;
                     });
                   },
                   child: CircleAvatar(
                     backgroundColor: Colors.red.shade600,
                     radius: 25,
                     child: Icon(
                       isfollow ? CupertinoIcons.add
                           : CupertinoIcons.check_mark,
                       color: Colors.white,),
                   ),
                 ),
               )
             ],
           ),

            SizedBox(height: 50),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isfollow ? CupertinoIcons.add
                        : CupertinoIcons.check_mark,
                    color: Colors.white,),
                  SizedBox(width: 10),
                  Text('MO.soltan', style: TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
