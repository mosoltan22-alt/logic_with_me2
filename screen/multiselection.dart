import 'package:flutter/material.dart';

class Multiselection extends StatefulWidget {
  const Multiselection({super.key});

  @override
  State<Multiselection> createState() => _MultiselectionState();
}

class _MultiselectionState extends State<Multiselection> {

  List<String> types= [
    'News',
    'health',
    'cooking',
  'flutter',
    'sport',
    'technology',
    'science',
    'nature',
    'food',
    'travel',
    'AI',
    'programming',
    'design',
  ];
// to save data to catch typesListectedIndex = 0;
List<String> Emptytype =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 140),
              Text(
                'What do you want to see in X?',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 40),
              Wrap(
                spacing: 8,
                  runSpacing: 10,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  children: List.generate(
                      types.length,
                          (index) {
                        final type = types[index];
                        final isTypeSelected = Emptytype.contains(type);
        
                  return  GestureDetector(
                    onTap: (){
                      if(!isTypeSelected){
                        Emptytype.add(type);
                      }else{
                        Emptytype.remove(type);
                      }
                      setState(() {
                      });
        
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                                  decoration: BoxDecoration(
                    color: isTypeSelected
                                    ? Colors.blue
                                    :  Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        
                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  child: Text(
                    type,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 14),
                                  ),
                                ),
                  );
                      }),
              ),
        //Empty List
              SizedBox(height: 80),
                 Center(
        
                   child: Column(
                     spacing: 10,
                     children: Emptytype.map ((v){
                       return Text(v,style: TextStyle(color: Colors.white, fontSize: 20),
                       );
                   }).toList(),
                   ),
                 ),
            ],
          ),
        ),
      ),
    );
  }
}
