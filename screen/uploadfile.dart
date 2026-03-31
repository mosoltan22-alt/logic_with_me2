import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
 /// save file
  String? _fileName;
  String? _filePath;

  /// upload file function
  Future<void> _uploadFile() async{
    final file =  await FilePicker.platform.pickFiles();

    if ( file!= null && file.files.single.name.isNotEmpty){
      setState(() {
        _fileName = file.files.single.name;
        _filePath = file.files.single.path; // ✔️ الصح
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            /// upload file

            Container(
              width: 320,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black38),
              ),

              /// icon pdf
              child: Row(
                children: [
                  SvgPicture.asset(
                      width: 40,
                      'assets/svg/pdf-file-free-3.svg'),
                 SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _fileName == null ?
                        'Upload File'
                      : _fileName!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      Text('pdf, doc, docx'),

                    ],
                  ),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context){
                      return [
                        PopupMenuItem(
                            onTap: _uploadFile,
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Icon(CupertinoIcons.arrow_up_doc),
                            SizedBox(width: 10,),
                            Text('Upload'),
                          ],)),




                        PopupMenuItem(child: Row(
                          children: [
                            Icon(CupertinoIcons.eye),
                            SizedBox(width: 10,),
                            Text('View'),
                          ],)),



                        PopupMenuItem(
                      onTap: (){
                        setState(() {
                          _fileName = null;

                        });
                      },
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.delete_solid, color: Colors.red,),
                            SizedBox(width: 10,),
                            Text('Remove'),
                          ],)),
                      ];
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            if (_filePath != null && _filePath!.endsWith('pdf'))

              Container(
               width: 230,
               height: 400,
                child: SfPdfViewer.file(File(_filePath!)),

             )
          ],

        ),
      ),
    );
  }
}
