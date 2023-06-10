import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Basics(),
    );
  }
}

class Basics extends StatelessWidget {
  const Basics({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basics'),
        leading: Icon(Icons.admin_panel_settings),
        actions: [Icon(Icons.add), Icon(Icons.adf_scanner)],
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          // margin: EdgeInsets.only(top: 100),
          // padding: EdgeInsets.all(20),
          child: Center(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                simpleText('Hello World'),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    fromAssets(),
                    Row(
                      children: [
                        Icon(Icons.add),
                        Spacer(),
                        simpleText(' A text in a stack'),
                        Spacer(),
                        Icon(Icons.delete)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Container(
                          width: 150, height: 150, child: profilePicture()),
                    )
                  ],
                ),
                Divider(
                  color: Colors.red,
                  thickness: 1,
                  height: 20,
                ),
                Container(
                  width: size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: const Offset(0, 1))
                      ]),
                ),
                Row(
                  children: [
                    Container(height: 100, width: 100, child: profilePicture()),
                    Expanded(
                        child: Center(child: simpleText(' A text in a row')))
                  ],
                ),
                fromAssets(),
                richText()
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ))),
    );
  }

  CircleAvatar profilePicture() {
    return CircleAvatar(
      backgroundColor: Colors.red,
      backgroundImage: NetworkImage(
          'https://images.pexels.com/photos/16444750/pexels-photo-16444750/free-photo-of-ville-art-rue-mur.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    );
  }

  Image fromAssets() {
    return Image.asset(
      'assets/images/local.jpeg',
      fit: BoxFit.cover,
    );
  }

  Image fromNetwork({required double height, required double width}) {
    return Image.network(
        'https://images.pexels.com/photos/16444750/pexels-photo-16444750/free-photo-of-ville-art-rue-mur.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        height: height,
        width: width,
        fit: BoxFit.fitWidth);
  }

  Text simpleText(String text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        textAlign: TextAlign.start);
  }

  Text richText() {
    return const Text.rich(TextSpan(
        text: 'Hello',
        style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
        children: [
          TextSpan(
              text: 'World',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          TextSpan(
              text: 'World',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 10,
              )),
          TextSpan(text: 'Another')
        ]));
  }
}
