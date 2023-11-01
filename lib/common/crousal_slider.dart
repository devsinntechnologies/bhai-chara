import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarouselDemo extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Column(children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Products")
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot data = snapshot.data;

                    DocumentSnapshot dataDoc = data.docs[0];

                    return CarouselSlider.builder(
                      carouselController: CarouselController(),
                      options: CarouselOptions(
                        height: 300,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged:,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemCount: dataDoc.get('urlImage').length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        height: 300,
                        width: double.infinity,
                        child: Image(
                          image:
                              NetworkImage(dataDoc.get('urlImage')[itemIndex]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator.adaptive();
                }),
          ]),
        ),
      );
}
