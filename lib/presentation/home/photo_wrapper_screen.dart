import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_list/domain/model/models.dart';
import 'package:photo_list/presentation/common/constants/constants.dart';

class PhotoWrapperScreen extends StatelessWidget {
  const PhotoWrapperScreen({
    Key? key,
    required this.listPhotos,
  }) : super(key: key);

  final List<Photo> listPhotos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: listPhotos.length,
      itemBuilder: (context, index) {
        var photo = listPhotos[index];
        return Hero(
          tag: photo.id.toString(),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/details/${photo.id}',
                  arguments: photo);
            },
            child: Stack(
              children: [
                _photo(photo),
                _placeholder(context, photo),
              ],
            ),
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0),
    );
  }

  Container _placeholder(BuildContext context, Photo photo) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      color: Colors.deepPurple.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          photo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  Container _photo(Photo photo) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: photo.imageUrl != ''
              ? NetworkImage(photo.imageUrl)
              : NetworkImage(AllImages().defaultImage),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
    );
  }
}
