import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Multiple Images'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  selectImages();
                },
                child: const Text('Select Images'),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (_, int index) {
                          return Image.file(
                            File(imageFileList[index].path),
                            fit: BoxFit.cover,
                          );
                        },
                        separatorBuilder: (_, int index) => Container(),
                        itemCount: imageFileList.length)),
              ),
            ],
          ),
        ));
  }

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      if (selectedImages.length <= 3) {
        imageFileList.addAll(selectedImages);
      } else {
        // showDialog(
        //     context: context,
        //     builder: (_) {
        //       return const AlertDialog(
        //         content: Center(child: Text('Limite de 3 imagenes')),
        //       );
        //     });
        var snackBar = const SnackBar(
          content: Text('Limite de 3 imagenes'),
          backgroundColor: Colors.red,
        );
        // Step 3
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    print("Image List Length:" + imageFileList.length.toString());
    setState(() {});
  }
}
