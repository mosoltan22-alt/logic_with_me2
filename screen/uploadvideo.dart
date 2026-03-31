      import 'dart:io';

      import 'package:flutter/material.dart';
      import 'package:image_picker/image_picker.dart';
      import 'package:video_player/video_player.dart';

      class Uploadvideo extends StatefulWidget {
      const Uploadvideo({super.key});

      @override
      State<Uploadvideo> createState() => _UploadvideoState();
      }

      class _UploadvideoState extends State<Uploadvideo> {
      // save video
       XFile? selectedVideo;
       VideoPlayerController? _controller;
      /// upload video function
      Future<void> _uploadvideo() async{
       final XFile? pickedVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);

       if (pickedVideo != null){
         _controller = VideoPlayerController.file(File(pickedVideo.path));

         await _controller?.initialize();
         _controller?.play();
       }
       setState(() {
         selectedVideo = pickedVideo;
       });
      }

       @override
       void dispose() {
        if (_controller != null){
         _controller?.dispose();}
         super.dispose();
       }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.red.shade900,
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 100,),
                if (_controller != null && _controller!.value.isInitialized)


                  /// VEDIO
                  Container(
                    width: 250,
                    height: 400, // 👈 لازم تحدد ارتفاع
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: _controller!.value.size.width,
                        height: _controller!.value.size.height,
                        child: VideoPlayer(_controller!),
                      ),
                    ),
                  ),

                SizedBox(height: 50,),

                /// upload image
                GestureDetector(
                  onTap: (){
                    _uploadvideo();
                  },
                  child: Container(
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child:
                    Text(
                    'Upload Video',
                    style: TextStyle(color: Colors.white),)),
                ),
              ),



            ],
          ),
        ),
      );
      }
      }
