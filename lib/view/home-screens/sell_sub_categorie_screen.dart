// ignore_for_file: must_be_immutable

import 'package:bhai_chara/utils/push.dart';
import 'package:bhai_chara/utils/text-styles.dart';
import 'package:bhai_chara/view/post%20and%20detail/post_and_detail_1.dart';
import 'package:flutter/material.dart';

import '../../utils/container.dart';

class SubCategorieScreen extends StatefulWidget {
  SubCategorieScreen({super.key, this.link, this.text, this.color});
  var link, text, color;
  @override
  State<SubCategorieScreen> createState() => _SubCategorieScreenState();
}

class _SubCategorieScreenState extends State<SubCategorieScreen> {
  final List<String> animalCategories = [
    'Mammals',
    'Birds',
    'Reptiles',
    'Amphibians',
    'Fish',
    'Invertebrates',
    'Arthropods',
    'Mollusks',
    'Echinoderms',
    'Cnidarians',
    'Annelids',
    'Porifera',
    'Platyhelminthes',
    'Nematodes',
    'Coelenterates',
    'Arachnids',
    'Insects',
    'Crustaceans',
    'Mammals',
    'Birds',
    'Marsupials',
    'Primates',
    'Carnivores',
    'Herbivores',
    'Rodents',
    'Hoofed Animals',
    'Marine Animals',
    'Domesticated Animals',
    'Endangered Species',
    'Extinct Animals'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomContainer(
              text: 'What are you offering?',
              iconVar: Icons.close,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 18, bottom: 15),
              child: Text("Sub-Categories",
                  style: AppTextStyles.textStyleBoldSubTitleLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    for (var i = 0; i < animalCategories.length; i++)
                      InkWell(
                        onTap: () {
                          push(
                              context,
                              PostDetailScreen1(
                                subtext: animalCategories[i],
                                link: widget.link,
                                color: widget.color,
                                titletext: widget.text,
                              ));
                        },
                        child: Text(animalCategories[i],
                            style: AppTextStyles.textStyleNormalBodyMedium),
                      ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
