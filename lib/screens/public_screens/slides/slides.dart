import 'package:flutter/material.dart';
import 'package:tribe/screens/public_screens/authentication/login/login.dart';
import 'package:tribe/utils/common/colors.dart';

class SlidesScreen extends StatelessWidget {
  static final String route = '/pageView';
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        body: PageView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/slide1.png'),
                    ),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Find",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 58.0,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Events",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 58.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20.0, bottom: 200.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Easily",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 58.0,
                            ),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // )
              ],
            ),
            // ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/Group.png'),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Find",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 58.0,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Events",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 58.0,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, bottom: 200.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Easily",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 58.0,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 70.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: media - 30,
                          height: 40.0,
                          child: RaisedButton(
                            child: Text(
                              'Lets Start',
                              style: TextStyle(
                                color: tribeTextWhite,
                                fontSize: 16.0,
                              ),
                            ),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              LoginScreen.route,
                            ),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
          scrollDirection: Axis.horizontal,
          onPageChanged: (number) {},
          controller: _controller,
        ),
      ),
    );
  }
}
