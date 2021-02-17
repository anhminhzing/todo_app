import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/theme_bloc.dart';
import 'package:flutter_app/bloc/user_bloc.dart';
import 'package:flutter_app/data/user_data.dart';

class ListUser extends StatefulWidget {
  final VoidCallback changeTheme;
  ListUser({
    Key key,
    this.changeTheme,
  }) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  UserBloc userBloc;
  ThemeBloc _bloc;
  bool isLight = true;

  TextStyle get basicTextStyle => TextStyle(
        color: Colors.white,
        fontSize: 18,
      );

  @override
  void initState() {
    userBloc = UserBloc()..getData();
    super.initState();
  }

  @override
  void dispose() {
    userBloc.dispose();
    _bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List User'),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Switch(
            value: isLight,
            onChanged: (value) {
              setState(() {
                isLight = value;
              });
              widget.changeTheme();
            },
          )
        ],
      ),
      body: Stack(
        children: [
          StreamBuilder<Result>(
            stream: userBloc.userBlocStream,
            builder: (BuildContext builder, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: (snapshot.data.results as List).map((e) {
                      return Container(
                        child: ListTile(
                          onTap: () {},
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
                  ),
                );
              } else if (snapshot.hasError) {
                return Container(
                  child: Text('Error'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
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
