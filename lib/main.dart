import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Room',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int countRow = 0;
  int numberOfItem = 2;
  @override
  void initState() {
    countNumberRow();
    super.initState();
  }

  void countNumberRow() {
    if (numberOfItem % 5 == 0) {
      countRow = numberOfItem ~/ 5;
    } else {
      countRow = numberOfItem ~/ 5 + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Hotel Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 0),
                      color: Colors.black26,
                      blurRadius: 2)
                ]),
            child: _buildListRoom()),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                numberOfItem--;
                countNumberRow();
              });
            },
            child: Icon(Icons.remove),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                numberOfItem++;
                countNumberRow();
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildListRoom() {
    int _indexItem = 0;
    return Column(
      children: List<Widget>.generate(countRow, (indexColumn) {
        if (indexColumn == countRow - 1) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<Widget>.generate(5, (indexRow) {
                _indexItem++;
                if (_indexItem >= numberOfItem) {
                  return Placeholder(
                    color: Colors.transparent,
                    fallbackHeight: 25,
                    fallbackWidth: 25,
                  );
                  // return Visibility(
                  //   visible: false,
                  //   child: _buildRoom(_indexItem));
                  // return AnimatedOpacity(
                  //     opacity: 0,
                  //     duration: Duration(milliseconds: 100),
                  //     child: _buildRoom(_indexItem, visibleTap: false));
                }
                return _buildRoom(_indexItem);
              }),
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(5, (indexRow) {
              _indexItem++;
              return _buildRoom(_indexItem);
            }),
          ),
        );
      }),
    );
  }

  Widget _buildRoom(int index, {bool visibleTap = true}) {
    return InkWell(
      onTap: visibleTap
          ? () {
              print(index);
              setState(() {});
            }
          : null,
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/room.svg',
            color: Colors.black,
            width: 25,
          ),
          Positioned(
            top: 6,
            left: 6,
            child: SvgPicture.asset('assets/icons/round_room.svg',
                color: Colors.yellow),
          ),
          Positioned(
            bottom: 3,
            left: 2,
            child: Text(
              '1111',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
