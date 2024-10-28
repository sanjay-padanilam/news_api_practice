import 'package:flutter/material.dart';
import 'package:news_api_practice/controller/news_screen_controler.dart';

import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.read<NewsScreenControler>().getarticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Consumer<NewsScreenControler>(
              builder: (context, proobj, child) => ListView.separated(
                  itemBuilder: (context, index) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              proobj.articlelist[index].title.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(proobj
                                      .articlelist[index].urlToImage
                                      .toString())),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 50,
                              child: Text(
                                  "publish at ${proobj.articlelist[index].publishedAt}"),
                            ),
                            Text(
                              proobj.articlelist[index].description.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: proobj.articlelist.length))),
    );
  }
}
