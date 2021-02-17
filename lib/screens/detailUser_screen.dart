import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/user_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailScreen extends StatefulWidget {
  final Response user;
  DetailScreen({Key key, this.user}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Completer<GoogleMapController> _controller = Completer();
  double latitude;
  double longtitude;

  CameraPosition _kGooglePlex;

  @override
  void initState() {
    // latitude = double.parse(widget.user.location.coordinates.latitude);
    // longtitude = double.parse(widget.user.location.coordinates.longitude);
    latitude = 37.43296265331129;
    longtitude = -122.08832357078792;
    _kGooglePlex = CameraPosition(
      target: LatLng(latitude, longtitude),
      zoom: 14.4746,
    );
    _goToTheLocation(_kGooglePlex);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _goToTheLocation(CameraPosition position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buidRow(
                title: 'Name',
                content: '${widget.user.name.first} ${widget.user.name.last}',
                icon: FontAwesomeIcons.userAlt,
              ),
              _buidRow(
                title: 'Phone',
                content: '${widget.user.cell}',
                icon: FontAwesomeIcons.phone,
              ),
              _buidRow(
                title: 'Location',
                content: '${widget.user.location.country} ',
                icon: FontAwesomeIcons.mapMarkerAlt,
              ),
              _buidRow(
                title: 'Birthday',
                content:
                    '${widget.user.dob.date.month} / ${widget.user.dob.date.day} / ${widget.user.dob.date.year}',
                icon: FontAwesomeIcons.birthdayCake,
              ),
              Container(
                width: double.infinity,
                height: 400,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buidRow({String title, String content, IconData icon}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FaIcon(
                    icon,
                    color: Theme.of(context).accentColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$title :',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
