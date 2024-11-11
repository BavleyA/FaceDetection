import 'package:flutter/material.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
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
                child: Center(child: Icon(Icons.add_a_photo, size: 60,)),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.indigoAccent,
                child: MaterialButton(
                    onPressed: (){},
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
                  onPressed: (){},
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