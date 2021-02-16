import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/user_bloc.dart';
import 'package:flutter_app/data/user_data.dart';

class ListUser extends StatefulWidget {
  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  UserBloc userBloc;

  TextStyle get basicTextStyle => TextStyle(
        color: Colors.white,
        fontSize: 18,
      );

  @override
  void initState() {
    userBloc = UserBloc()..init();
    super.initState();
  }

  @override
  void dispose() {
    userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SafeArea(
            child: SingleChildScrollView(
                child: StreamBuilder<Result>(
              stream: userBloc.userBlocStream,
              builder: (BuildContext builder, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data.results[0].picture.thumbnail);
                  return Column(
                    children: (snapshot.data.results as List).map((e) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: _buildAvatar(e.picture.large),
                          title: _buildTitle(
                            e.name.first,
                            e.name.last,
                          ),
                          subtitle: _buildSubtitle(
                            e.location.state,
                            e.location.country,
                          ),
                          // trailing:,
                        ),
                      );
                    }).toList(),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Text('Error'),
                  );
                }
                return Text('Loading');
              },
            )),
          )
        ],
      ),
    );
  }

  Widget _buildAvatar(String url) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      fadeInDuration: Duration(microseconds: 200),
      imageBuilder: (context, imageProvider) => Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String first, String last) {
    return Text('$first $last');
  }

  Widget _buildSubtitle(String state, String country) {
    return Text('$state , $country');
  }
}
