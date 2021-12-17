import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:photo_list/domain/model/models.dart';
import 'package:photo_list/presentation/common/constants/constants.dart';

class PhotoDetails extends StatelessWidget {
  PhotoDetails({Key? key, required this.details}) : super(key: key);

  Photo details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(detailsPhoto),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image(Photo(title: details.title, imageUrl: details.imageUrl)),
            _description(
                Photo(title: details.title, imageUrl: details.imageUrl)),
            _backButton(context),
          ],
        )),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      width: 100.0,
      child: ElevatedButton(
        child: const Center(
          child: Text(
            backButton,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          minimumSize: const Size(100.0, 40.0),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Hero _image(Photo photo) {
    return Hero(
      tag: photo.id.toString(),
      child: Container(
        width: double.infinity,
        height: 300.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: photo.imageUrl != ''
                ? NetworkImage(photo.imageUrl)
                : NetworkImage(AllImages().defaultImage),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Container _description(Photo photo) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Text(
        photo.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
