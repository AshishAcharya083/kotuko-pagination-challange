import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kotuko_coding_challange/core/models/list_info_model.dart';
import 'package:kotuko_coding_challange/utils/screen_size.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class AirlineDetailPage extends StatelessWidget {
  final String? airlineLogo;
  final String? airlineName;
  final String? airlineCountry;
  final String? establishedDate;
  final String? website;
  final String? slogan;

  AirlineDetailPage({
    this.airlineLogo,
    this.airlineCountry,
    this.website,
    this.slogan,
    this.establishedDate,
    this.airlineName,
  });

  void _launchURL(String url) async {
    // await launch(url);
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.getWidth(context) * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.4)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(airlineLogo!),
                  )),
            ),
            SizedBox(
              height: ScreenSize.getHeight(context) * 0.02,
            ),
            Text(
              airlineName!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$airlineCountry, $establishedDate",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                _launchURL(website!);
              },
              child: Text(
                website!,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
