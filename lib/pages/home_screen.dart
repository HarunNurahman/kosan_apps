import 'package:flutter/material.dart';
import 'package:kosan_apps/models/city.dart';
import 'package:kosan_apps/themes.dart';
import 'package:kosan_apps/widgets/city_card.dart';
import 'package:kosan_apps/widgets/space_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: edge),
          child: ListView(
            children: [
              // HEADER
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              // POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Popular Cities',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: edge),
                    child: Row(
                      children: [
                        CityCard(
                          City(
                            id: 1,
                            name: 'Jakarta',
                            imageUrl: 'assets/images/img_city_1.png',
                            isFavorited: false,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CityCard(
                          City(
                            id: 2,
                            name: 'Bandung',
                            imageUrl: 'assets/images/img_city_2.png',
                            isFavorited: true,
                          ),
                        ),
                        const SizedBox(width: 20),
                        CityCard(
                          City(
                            id: 3,
                            name: 'Surabaya',
                            imageUrl: 'assets/images/img_city_3.png',
                            isFavorited: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: [
                //     const SizedBox(width: 24),
                //     CityCard(),
                //     const SizedBox(width: 20),
                //     CityCard(),
                //     const SizedBox(width: 20),
                //     CityCard(),
                //   ],
                // ),
              ),
              const SizedBox(height: 30),
              // RECOMMENDED SPACE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recommended Space',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  SpaceCard(),
                  const SizedBox(height: 30),
                  SpaceCard(),
                  const SizedBox(height: 30),
                  SpaceCard(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
