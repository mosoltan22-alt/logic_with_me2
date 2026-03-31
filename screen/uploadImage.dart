import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Uploadimage extends StatefulWidget {
  const Uploadimage({super.key});

  @override
  State<Uploadimage> createState() => _UploadimageState();
}

class _UploadimageState extends State<Uploadimage> {
// save photo
 XFile? selectedImage;
  /// upload function
  Future<void> _uploadImage() async{
   final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

   setState(() {
     selectedImage = pickedImage;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 90,),
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
              selectedImage == null?null
              :Image.file(File(selectedImage!.path)),
            ),
            SizedBox(height: 40,),

            ///uploadbutton
            GestureDetector(
              onTap: (){
             _uploadImage();
              },
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color:
                  selectedImage == null?
                  Colors.green.withOpacity(0.9)
                  :Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child:
                Text(
                  selectedImage == null ?
                  'Upload Image'
                      :'Change Image',
                  style: TextStyle(color: Colors.white),)),
              ),
            ),
            /// remove button
            SizedBox(height: 20,),

            if ( selectedImage != null)
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedImage = null;
                  });
                },
                child: Container(
                  width: 180,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                    selectedImage == null?
                    Colors.green.withOpacity(0.9)
                        :Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child:
                  Text(

                   'Remove Image',
                    style: TextStyle(color: Colors.white),)),
                ),
              ),

          ],
        ),
      ),

    );
  }
}
