import 'package:flutter/material.dart';
import 'tag/duration_tag.dart';
import 'tag/status_tag.dart';

class CardListLO extends StatelessWidget {
  final int index;
  final Color borderColor;
  final IconData? iconData;
  final Size size;
  final double radius;
  final Function(int) onButtonPressed;
  final String livelloText;
  final String tipoText;
  final String descrizione;
  final String? durataText;
  final Color? durataColor;
  final String titolo;
  final String imageUrl;

  CardListLO(
      {required this.index,
      required this.borderColor,
      required this.iconData,
      required this.size,
      required this.onButtonPressed,
      required this.livelloText,
      required this.tipoText,
      required this.descrizione,
      this.durataText = null,
      this.durataColor = null,
      required this.titolo,
      required this.imageUrl,
      this.radius = 8.0});

  @override
  Widget build(BuildContext context) {
    double wPadding = 20;
    double insideMargin = 16;
    var imageWidth = size.width * 21.49 / 100;
    var textWidth = size.width - imageWidth - 2 * wPadding - insideMargin;

    return GestureDetector(
        onTap: () => onButtonPressed(index),
        child: Container(
            color: Colors.transparent,
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                (durataText != null && durataText!.isNotEmpty)
                    ? Positioned(
                        top: 8,
                        right: 8,
                        child: DurationTag.fromMinutes(90),
                      )
                    : const SizedBox.shrink(),
                Padding(
                    padding: EdgeInsets.only(left: wPadding, right: wPadding),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(radius),
                            child: Image(
                              image: NetworkImage(imageUrl),
                              width: imageWidth,
                              height: size.height,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: insideMargin,
                        ),
                        SizedBox(
                            width: textWidth,
                            height: size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(children: [
                                  Text(
                                    livelloText,
                                    style: const TextStyle(
                                        color: Colors.lightGreenAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    " | ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    tipoText,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ]),
                                Text(
                                  titolo,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  descrizione,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                  maxLines: 2,
                                )
                              ],
                            ))
                      ],
                    )),
                (iconData != null)
                    ? Positioned(
                        top: 6,
                        left: 8,
                        child: StatusTag(
                          backgroundColor: borderColor,
                          child: Icon(iconData!),
                        ))
                    : const SizedBox.shrink(),
              ],
            )));
  }
}
