import 'package:flutter/material.dart';

class AnimatedListViewPage extends StatefulWidget {
  @override
  _AnimatedListViewPageState createState() => _AnimatedListViewPageState();
}

class _AnimatedListViewPageState extends State<AnimatedListViewPage> {
  final ScrollController _scrollController = ScrollController();
  bool _scrolling = false;

  void _scrollToEnd() {
    setState(() {
      _scrolling = true;
    });
    _scrollController
        .animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
    )
        .then((_) {
      setState(() {
        _scrolling = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated ListView'),
        backgroundColor: Color(0xffc3b3b3),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_downward),
            onPressed: _scrolling
                ? null
                : _scrollToEnd, //ถ้า _scrolling เป็น true: จะทำให้ onPressed เป็น null ซึ่งหมายความว่าปุ่มจะไม่ทำงาน
          )
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2022/10/23/13/43/canoe-7541311_1280.jpg'),
              ),
              title: Text('Page $index'),
              trailing: Icon(Icons.check),
            ),
          );
        },
      ),
    );
  }
}
