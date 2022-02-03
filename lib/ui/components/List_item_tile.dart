import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kotuko_coding_challange/utils/screen_size.dart';

class ListItemTile extends StatelessWidget {
  final String passengerName;
  final String numberOfFlights;

  ListItemTile(this.passengerName, this.numberOfFlights);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2)
        ], color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: CachedNetworkImageProvider(
                'https://cdn.logojoy.com/wp-content/uploads/2018/05/30142202/1_big.jpg',
              ),
            ),
            Container(
              width: ScreenSize.getWidth(context) * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    passengerName,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "No. of Flights: ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            )),
                        TextSpan(
                          text: numberOfFlights,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ));
  }
}
