import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'Postso.dart';
late List<Post> drivers;
class MyApp extends StatefulWidget {
// to set the root of app.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  late final String title;
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text("Food Table",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body:Container(
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Rid',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Cid',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Bill',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child:_buildBody(context),
              ),
            )
          ],
        ),
        color:const Color(0xFF303030),
      ),
    );
  }

  // build list view & manage states
  FutureBuilder<List<Post>> _buildBody(BuildContext context) {
    final HttpService httpService = HttpService();
    return FutureBuilder<List<Post>>(
      future: httpService.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Post>? posts = snapshot.data; //marked
          return _buildPosts(context, posts!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  // build list view & its tile
  ListView _buildPosts(BuildContext context, List<Post> posts) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          height:70,
          child: Card(
            shadowColor: Colors.white,
            color:const Color(0xFF303030),
            elevation: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    child: Text(posts[index].Rid,style: const TextStyle(fontWeight: FontWeight.bold,
                      color:Colors.white,),),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(posts[index].Cid,style: const TextStyle(fontWeight: FontWeight.bold,
                      color:Colors.white,),),
                  ),),
                Expanded(
                  child: Container(
                    child: Text(posts[index].Date,style: const TextStyle(fontWeight: FontWeight.bold,color:Colors.white,),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(posts[index].Bill,style: const TextStyle(fontWeight: FontWeight.bold,color:Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class HttpService {
  Future<List<Post>> getPosts() async {
    Response res = await get(
        Uri.parse('http://localhost/localconnect/order_change.php'));
    print(res.body);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts = body.map(
            (dynamic item) => Post.fromJson(item),
      ).toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
