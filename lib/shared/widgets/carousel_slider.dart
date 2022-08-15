import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants/carousel_source.dart';

CarouselSlider carouselSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      height: 600,
    ),
    items: imgList
        .map((item) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(117, 10, 10, 10),
                      blurRadius: 10,
                      spreadRadius: 0.2,
                      offset: Offset(1, 4), // Shadow position
                    ),
                  ],
                ),
                child: Card(
                  child: Wrap(
                      // alignment: WrapAlignment.center,
                      children: [
                        Image.network(
                          item,
                          fit: BoxFit.contain,
                          width: 1000,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: crossax,
                            children: [
                              Wrap(
                                children: const [
                                  Icon(Icons.favorite_border),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Favorite',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Wrap(
                                children: const [
                                  Icon(Icons.share_outlined),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Share',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ))
        .toList(),
  );
}
