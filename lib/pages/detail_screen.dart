import 'package:flutter/material.dart';
import 'package:kosan_apps/themes.dart';
import 'package:kosan_apps/widgets/facility_item.dart';
import 'package:kosan_apps/widgets/list_photo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  // final Uri _url = Uri.parse('https://goo.gl/maps/y1UeZFGt4wY4Enpu6');

  // void _launchUrl() async {
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/img_cover.png',
              height: 350,
              width: MediaQuery.of(context).size.width,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 330),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        placeHeader(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Main Facilities',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 12),
                        mainFacility(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Photos',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 12),
                        detailPic(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Location',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 6),
                        location(),
                        const SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            topButton(context),
          ],
        ),
      ),
    );
  }

  Padding topButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (() => Navigator.pop(context)),
            child: Image.asset(
              'assets/images/btn_back.png',
              width: 40,
            ),
          ),
          Image.asset(
            'assets/images/btn_wishlist.png',
            width: 40,
          ),
        ],
      ),
    );
  }

  Padding location() {
    _launchUrl(String url) async {
      if (!await launchUrlString(url)) throw 'Could not launch $url';
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Jalan Kappan Sukses No. 20\nPalembang',
            style: greyTextStyle.copyWith(fontSize: 14),
          ),
          InkWell(
            onTap: () {
              _launchUrl('https://goo.gl/maps/y1UeZFGt4wY4Enpu6');
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on,
                size: 22,
                color: Color(0xFF989BA1),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding detailPic() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ListPhoto(
              imageUrl: 'assets/images/img_detailpic_1.png',
            ),
            const SizedBox(width: 18),
            ListPhoto(
              imageUrl: 'assets/images/img_detailpic_2.png',
            ),
            const SizedBox(width: 18),
            ListPhoto(
              imageUrl: 'assets/images/img_detailpic_3.png',
            ),
            const SizedBox(width: 18),
          ],
        ),
      ),
    );
  }

  Padding placeHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kuretakeso Hott',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: '\$52',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: '/month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: Color(0xFF989BA1),
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding mainFacility() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FacilityItem(
              name: 'Kitchens',
              imageUrl: 'assets/icons/ic_kitchenbar.png',
              total: '2',
            ),
            const SizedBox(width: 30),
            FacilityItem(
              name: 'Bedrooms',
              imageUrl: 'assets/icons/ic_bedroom.png',
              total: '3',
            ),
            const SizedBox(width: 30),
            FacilityItem(
              name: 'Wardrobes',
              imageUrl: 'assets/icons/ic_wardrobe.png',
              total: '2',
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
