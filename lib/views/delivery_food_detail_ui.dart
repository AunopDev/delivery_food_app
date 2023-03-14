// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, unused_import

import 'package:delivery_food_app/models/FoodShopList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryFoodDetailUI extends StatefulWidget {
  FoodShopList? foodShopList;

  DeliveryFoodDetailUI({super.key, this.foodShopList});

  @override
  State<DeliveryFoodDetailUI> createState() => _DeliveryFoodDetailUIState();
}

class _DeliveryFoodDetailUIState extends State<DeliveryFoodDetailUI> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'สายด่วนชวนกิน (' + widget.foodShopList!.shopName + ')',
          style: GoogleFonts.itim(),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/' + widget.foodShopList!.shopImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.store,
                    color: Colors.white,
                  ),
                  title: Text(
                    'ชื่อร้าน : ' + widget.foodShopList!.shopName,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _makePhoneCall(widget.foodShopList!.shopPhone);
                  },
                  leading: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.green,
                  ),
                  title: Text(
                    'เบอร์โทรร้าน : ' + widget.foodShopList!.shopPhone,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse('https://www.facebook.com/' +
                        widget.foodShopList!.shopFacebook));
                  },
                  leading: Icon(
                    FontAwesomeIcons.facebook,
                    color: Color(0xff426783),
                  ),
                  title: Text(
                    'เฟสบุ๊ค : ' + widget.foodShopList!.shopFacebook,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(widget.foodShopList!.shopWeb));
                  },
                  leading: Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'เว็บไซต์ : ' + widget.foodShopList!.shopWeb,
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.075,
                ),
                child: ListTile(
                  onTap: () {
                    _launchInBrowser(Uri.parse(
                        'https://www.google.com/maps/search/!api=1&query=' +
                            widget.foodShopList!.shopLatitude +
                            ',' +
                            widget.foodShopList!.shopLongtitude));
                  },
                  leading: Icon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.red,
                  ),
                  title: Text(
                    'ที่อยู่',
                    style: GoogleFonts.itim(),
                  ),
                  tileColor: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
