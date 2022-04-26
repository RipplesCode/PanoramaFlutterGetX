import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panorama/panorama.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panorama Demo'),
        centerTitle: true,
      ),
      body:Obx(()=>  Panorama(
        zoom: 1,
        animSpeed: 1.0,
        child: controller.selectedImagePath.value != ''
            ? Image.file(File(controller.selectedImagePath.value))
            : Image.asset('image/place.jpg'),
      )),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          controller.getImage(ImageSource.camera);
        },
        child: Icon(Icons.panorama),
      ),
    );
  }
}
