import 'package:flutter/material.dart';
import  'package:university_times/main.dart';

// Constant values

List<Map> categories = [
  {'name': 'News'},
  {'name': 'Sports'},
  {'name': 'Fashion'},
  {'name': 'Entertainment'},
];

const BoxShadow bigBoxShadow = BoxShadow(
  color: Color(0x23575757),
  blurRadius: 30.31,
  offset: Offset(5.13, 10.13),
);

const BoxShadow smallBoxShadow = BoxShadow(
  color: Color(0x13575757),
  blurRadius: 70.31,
  offset: Offset(0.13, 8.13),
);

// End of Constants

Widget categoryBuilder(category) => CategoryOverview();

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: SearchBar(),
          bottom: TabBar(
            tabs: categories
                .map((item) => Tab(
                      text: item['name'],
                    ))
                .toList(),
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: categories.map((item) => categoryBuilder(item)).toList(),
        ),
      ),
      length: categories.length,
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _searchBarController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: "What're you looking for?",
                enabledBorder: buildSearchInputBorder(),
                focusedBorder: buildSearchInputBorder(focused: true),
                border: buildSearchInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
      height: 32,
    );
  }

  OutlineInputBorder buildSearchInputBorder({bool focused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
          color: focused ? primaryColor : customColor.shade200, width: 1),
    );
  }
}

class CategoryOverview extends StatefulWidget {
  @override
  _CategoryOverviewState createState() => _CategoryOverviewState();
}

class _CategoryOverviewState extends State<CategoryOverview> {
  List<Widget> _overviewItems = [
    TopPosts(),
    TrendingSection(),
    ForYouSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _overviewItems[index],
      itemCount: _overviewItems.length,
    );
  }
}

class TopPosts extends StatefulWidget {
  @override
  _TopPostsState createState() => _TopPostsState();
}

class _TopPostsState extends State<TopPosts> {
  List<Map> _topPosts = [
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': '15 June 2018'
    },
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': '15 June 2018'
    },
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': '15 June 2018'
    },
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': '15 June 2018'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 35),
          child: MyCard(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: SizedBox.expand(
                        child: Image(
                          image:
                          AssetImage('assets/images/post_img_default.jpg'),
                          fit: BoxFit.cover,
                        )),
                    height: 108,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _topPosts[index]['summary'],
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircleAvatar(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                _topPosts[index]['author'],
                                style:
                                TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.54,
                                  foreground: Paint()
                                    ..style = PaintingStyle.fill
                                    ..strokeWidth = .2
                                    ..color = Theme.of(context).primaryColor
                                ),
                              ),
                              Text(
                                _topPosts[index]['post-date-formatted'],
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10.77,
                                  foreground: Paint()
                                    ..color = customColor.shade500
                                    ..strokeWidth = .24
                                    ..style = PaintingStyle.fill
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {
                            setState(() {
                              _topPosts[index]['bookmarked'] =
                              !_topPosts[index]['bookmarked'];
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Post bookmark status changed ${_topPosts[index]['bookmarked'].toString()}')));
                            });
                          },
                          color: Theme.of(context).hintColor,
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              _topPosts[index]['favourited'] =
                              !_topPosts[index]['favourited'];
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Post bookmark status changed')));
                            });
                          },
                          color: Theme.of(context).hintColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width - 80,
            ),
          ),
        ),
        itemCount: _topPosts.length,
        scrollDirection: Axis.horizontal,
      ),
      height: 292,
      width: MediaQuery.of(context).size.width - 60,

    );
  }
}

class TrendingSection extends StatefulWidget {
  @override
  _TrendingSectionState createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  List<Map> _trendingTopics = [
    {
      'id': 0,
      'img-url': '',
      'topic-summary':
          'There are many variations of passages of Lorem Ipsum available.',
      'topic': 'Exploration',
      'formatted-date': '15 June 2018'
    },
    {
      'id': 0,
      'img-url': '',
      'topic-summary':
      'There are many variations of passages of Lorem Ipsum available.',
      'topic': 'Exploration',
      'formatted-date': '15 June 2018'
    },
    {
      'id': 0,
      'img-url': '',
      'topic-summary':
      'There are many variations of passages of Lorem Ipsum available.',
      'topic': 'Exploration',
      'formatted-date': '15 June 2018'
    },
    {
      'id': 0,
      'img-url': '',
      'topic-summary':
      'There are many variations of passages of Lorem Ipsum available.',
      'topic': 'Exploration',
      'formatted-date': '15 June 2018'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Trending',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 35, top: 15),
                child: MyCard(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        FractionallySizedBox(
                          child: Image.asset(
                            'assets/images/post_img_default.jpg',
                            fit: BoxFit.cover,
                            width: 120,
                          ),
                          heightFactor: 1,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  _trendingTopics[index]['topic'].toUpperCase(),
                                  style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 12.86
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  _trendingTopics[index]['topic-summary'],
                                  maxLines: 3,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 10.96,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      _trendingTopics[index]['formatted-date'],
                                      style: TextStyle(
                                        color: Theme.of(context).hintColor,
                                        fontSize: 10.77
                                      ),
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width - 60,
                  ),
                ),
              ),
              itemCount: _trendingTopics.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      height: 193,
      width: MediaQuery.of(context).size.width - 60,
    );
  }
}

class ForYouSection extends StatefulWidget {
  @override
  _ForYouSectionState createState() => _ForYouSectionState();
}

class _ForYouSectionState extends State<ForYouSection> {
  List<Map> _postsForYou = [
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': 'January 21, 2020',
      'title': 'Ice Cream to Happy day'
    },
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': 'January 21, 2020',
      'title': 'Ice Cream to Happy day'
    },
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': 'January 21, 2020',
      'title': 'Ice Cream to Happy day'
    },
    {
      'id': 0,
      'img-url': '',
      'bookmarked': false,
      'favourited': false,
      'summary': 'Just a simple tabletop scene for you to insert your design,'
          'art, you know bringing your ideas to life.',
      'author': 'Sholanke Olamide',
      'post-date-formatted': 'January 21, 2020',
      'title': 'Ice Cream to Happy day'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'For you',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children:
                _postsForYou.map((post) => buildStackedPostCard(post)).toList(),
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget buildStackedPostCard(post) {
    double stackCardHeight = 100;
    double stackImageWidth = 90;

    return Container(
      child: Stack(children: <Widget>[
        Positioned(
          child: MyCard(
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 33,
                        width: 33,
                        child: CircleAvatar(),
                      ),
                      SizedBox(
                        width: 11.18,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'by ',
                                    style: TextStyle(
                                        color: customColor.shade700,
                                        fontSize: 11.6),
                                  ),
                                  TextSpan(
                                    text: post['author'],
                                    style: TextStyle(
                                      fontSize: 13.5,
                                    )
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              post['post-date-formatted'],
                              style: TextStyle(
                                fontSize: 12.35,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            post['favourited'] = !post['favourited'];
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Post bookmark status changed')));
                          });
                        },
                        color: Theme.of(context).hintColor,
                      ),
                    ],
                  ),
                  Text(
                    post['title'],
                    style: TextStyle(
                      fontSize: 15.38,
                    ),
                  ),
                  FractionallySizedBox(
                    child: Text(
                      post['summary'],
                      maxLines: 1,
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 12.35
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    widthFactor: .8,
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              height: stackCardHeight,
              width: MediaQuery.of(context).size.width - 30,
              padding: EdgeInsets.only(left: stackImageWidth + 5),
            ),
            boxShadow: [smallBoxShadow],
          ),
          top: 0,
          left: 0,
        ),
        Positioned(
          child: Card(
            child: Container(
                height: stackCardHeight,
                width: stackImageWidth,
                child: Image.asset(
                  'assets/images/post_img_default.jpg',
                  fit: BoxFit.cover,
                )),
            margin: EdgeInsets.zero,
          ),
          top: 0,
          left: 0,
        ),
      ], overflow: Overflow.visible),
      height: stackCardHeight + 10,
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }
}

class MyCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final ShapeBorder shape;
  final Clip clipBehaviour;
  final EdgeInsets margin;
  final bool semanticContainer, borderOnForeground;
  final List<BoxShadow> boxShadow;

  const MyCard(
      {Key key,
      this.child,
      this.color,
      this.shape,
      this.clipBehaviour,
      this.margin,
      this.semanticContainer = true,
      this.borderOnForeground = true,
      this.boxShadow = const [bigBoxShadow]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: this.child,
        shape: this.shape,
        color: this.color,
        margin: this.margin,
        semanticContainer: this.semanticContainer,
        borderOnForeground: this.borderOnForeground,
        clipBehavior: this.clipBehaviour,
      ),
      decoration: BoxDecoration(
        boxShadow: boxShadow,
      ),
    );
  }
}
