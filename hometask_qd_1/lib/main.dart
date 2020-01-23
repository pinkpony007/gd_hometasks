import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        bottomAppBarColor: Colors.white,
      ),
      home: MyHomePage(
          title: 'Posts'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  bool like = false;
  bool bookmark = false;

  @override
  _MyHomePageState createState() => _MyHomePageState(like);
}

class _MyHomePageState extends State<MyHomePage> {

  _MyHomePageState(like);

  @override
  void initState(){
    super.initState();
  }

  Icon _like = Icon(Icons.favorite, color: Colors.red,size: 35.0);
  Icon _dislike = Icon(Icons.favorite_border, color: Colors.black,size: 35.0);

  Icon _onbookmark = Icon(Icons.bookmark, color: Colors.black, size: 35.0);
  Icon _offbookmark = Icon(Icons.bookmark_border, color: Colors.black, size: 35.0);

  Icon setLike() {
    setState(() => widget.like);
    if(widget.like)
      return _like;
    else
      return _dislike;
  }

  Icon setBookmark(){
    setState(() => widget.bookmark);
    if(widget.bookmark)
      return _onbookmark;
    else
      return _offbookmark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              subtitle: Text('Kharkiv, Ukraine'),
              title: Text('griddynamics_ua', style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black
                ),
              ),
              leading: CircleAvatar(
                child: Image.network('https://instagram.fhrk2-1.fna.fbcdn.net/v/t51.2885-19/s150x150/73420570_2552881835036596_491963464097464320_n.jpg?_nc_ht=instagram.fhrk2-1.fna.fbcdn.net&_nc_ohc=pVGdpx5MkesAX-okQcH&oh=4b2e42f148cd95c5af0c6fc3fe035fd8&oe=5ED4282B'),
              ),
              trailing: Icon(Icons.more_vert),
            ),
            GestureDetector(
              onDoubleTap: (){
                widget.like = true;
                setLike();
              },
                child: Image.network('https://instagram.fhrk2-1.fna.fbcdn.net/v/t51.2885-15/sh0.08/e35/s750x750/75580657_560769188050551_332563824158768362_n.jpg?_nc_ht=instagram.fhrk2-1.fna.fbcdn.net&_nc_cat=103&_nc_ohc=mzviCiLCBP8AX_JcVpa&oh=c568af028686d71327930ccb7e8661b7&oe=5EA210A8', width: double.infinity,fit: BoxFit.fitWidth,)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: setLike(),
                  onPressed: (){
                    if(widget.like)
                      widget.like = false;
                    else
                      widget.like = true;
                    setLike();
                  },
                ),
                Icon(
                  FontAwesomeIcons.comment,
                  size: 30.0,
                  color: Colors.black,
                ),
                IconButton(
                    icon: Icon(
                      FontAwesomeIcons.paperPlane,
                        color: Colors.black,
                      size: 30.0
                    ),
                    onPressed: null,
                  ),

                Expanded(child: Container() ),
                  IconButton(
                      icon: setBookmark(),
                    onPressed: (){
                        if(widget.bookmark)
                          widget.bookmark = false;
                        else
                          widget.bookmark = true;
                        setBookmark();
                    },
                  ),
              ],
            ),
            Container(
              child: RichText(overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: ' griddynamics_ua',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: ' Welcome to the Flutter workshop from Grid Dynamics. In this course, you will learn how to create Flutter applications efficiently and simply, as every lecture comes with a full coding screencast and broadcasting code on a laptop. We are updating this course frequently, as flutter and dart are in their early stages of development. So what are you waiting for? 📆 The first class will be on January 20. 📌 More info and registration are on our bio.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black),
                  )
                ]
              )),
            ),
          ],
        ),
      ),
    );
  }
}
