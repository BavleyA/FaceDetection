import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  File? _image;

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
                      _pickImage(ImageSource.camera);
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
                    _pickImage(ImageSource.gallery);
                  },
                  child: Text('Upload From Gallery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}