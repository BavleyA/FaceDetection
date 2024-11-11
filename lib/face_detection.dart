import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;

  List<Face> faces=[];

  Future _pickImage(ImageSource source) async{
    try{
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      setState(() {
        _image = File(image.path);
      });
    }
    catch(error){
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future _faceDetect(File img) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    final inputImage = InputImage.fromFilePath(img.path);
    faces = await faceDetector.processImage(inputImage);
    setState(() {});
    print(faces.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Face Detection',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.grey,
                child: Center(
                    child: _image == null ? Icon(
                      Icons.add_a_photo, size: 60,
                    ) : Image.file(_image!),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.indigoAccent,
                child: MaterialButton(
                    onPressed: (){
                      _pickImage(ImageSource.camera).then((value){
                        if(_image != null){
                          _faceDetect(_image!);
                        }
                      });
                    },
                  child: Text('Take a Photo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.indigoAccent,
                child: MaterialButton(
                  onPressed: (){
                    _pickImage(ImageSource.gallery).then((value){
                      if(_image !=null){
                        _faceDetect(_image!);
                      }
                    });
                  },
                  child: Text('Upload From Gallery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Number of Faces in Image is ${faces.length}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}