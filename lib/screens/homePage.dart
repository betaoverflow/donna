import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donna/model/UserAuth.dart';
import 'package:donna/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:donna/model/categories.dart';
import 'package:donna/model/cardModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  late ScrollController _scrollController;
  late TabController _tabController;
  int currentIndex = 0;

  _smoothScrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(microseconds: 300), curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: categories.length, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }

  List<CardModel> filterCards(CategoryModel category, List<CardModel> cards) {
    List<CardModel> newList = [];

    for (var i = 0; i < cards.length; i++) {
      if (cards[i].category == category.name) {
        newList.add(cards[i]);
      }
    }

    return newList;
  }

  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> _usersStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .snapshots();
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: _usersStream,
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        cardContentWithPersonalCategory = List.from(cardContent);

        var commands = snapshot.data!.get("commands");
        if (commands != null) {
          var personalizedCommands = commands["personalized"];
          if (personalizedCommands != null) {
            personalizedCommands.forEach((c) {
              // print(c);
              cardContentWithPersonalCategory.add(
                CardModel(title: c["title"], content: c["content"], category: categories[4].name)
              );
            });
          }
        }

        return NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(right: 15),
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: _tabController,
                        isScrollable: true,
                        indicator: UnderlineTabIndicator(),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.black45,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        tabs: List.generate(categories.length,
                            (index) => Text(categories[index].name))),
                  ),
                ),
              ];
            },
            body: Container(
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(categories.length, (index) {
                    List<CardModel> newList =
                        filterCards(categories[index], cardContentWithPersonalCategory);
                    return ListView.builder(
                      itemCount: newList.length,
                      itemBuilder: (context, index) {
                        return VoiceCard(
                          subtitle: newList[index].title,
                          content: newList[index].content,
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 25),
                    );
                  })),
            ));
      },
    );
  }
}
