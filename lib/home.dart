import 'package:flutter/material.dart';
import 'package:qiita_viewer/article_page.dart';
import 'package:qiita_viewer/model/article.dart';
import 'package:qiita_viewer/repository/qiita_repository.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QiitaViewer', style: TextStyle(color: Colors.white)),
      ),
      body: _QiitaListView(),
    );
  }
}

class _QiitaListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QiitaList();
}

class _QiitaList extends State<_QiitaListView> {
  List<Article> articles = List();

  void loadArticles() async {
    var _articles = await QiitaRepository.getArticles();
    setState(() {
      articles = _articles ?? List();
    });
  }

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, int i) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black12),
              ),
            ),
            child: ListTile(
              leading: Image.network(articles[i].user.profileImageUrl),
              title: Text(articles[i].title),
              subtitle: Text(articles[i].user.name),
              //trailing: Icon(Icons.favorite, color: Colors.pink),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('${articles[i].likesCount}'),
                  Icon(Icons.favorite, color: Colors.pink)
                ],
              ),
              onTap: () => {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new ArticlePage(
                                url: articles[i].url,
                                title: articles[i].title,
                              )),
                    )
                  },
            ),
          );
        });
  }
}
