import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbinlaw/models/numberModel.dart';
import 'package:robbinlaw/models/numberTypes.dart';
import 'package:robbinlaw/widgets/numberCard.dart';
import 'package:robbinlaw/controllers/appController.dart';

class NumbersCarousel extends StatefulWidget {
  NumbersCarousel({this.color});

  final Color color;

  @override
  _NumbersCarouselState createState() => _NumbersCarouselState();
}

class _NumbersCarouselState extends State<NumbersCarousel>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: mainTypes.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color myColor = widget.color;

    return SizedBox(
      height: 350.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 4.0,
            color: myColor,
          ),
        ),
        child: Stack(
          children: <Widget>[
            TabBarView(
              controller: _tabController,
              children: mainTypes.map((numberModel) {
                return GestureDetector(
                  onTap: () {
                    List<NumberModel> numberListType;
                    switch (numberModel.title) {
                      case '1':
                        numberListType = oneTypes;
                        break;
                      case '2':
                        numberListType = twoTypes;
                        break;
                      default:
                        throw '${numberModel.title} type not recognized';
                    }
                    Get.find<AppController>()
                        .updateNumberListType(numberListType);
                  },
                  child: NumberCard(
                    numberModel: numberModel,
                  ),
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabPageSelector(
                  controller: _tabController,
                  color: Colors.white,
                  selectedColor: myColor,
                  indicatorSize: 20,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: myColor,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: -1);
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: myColor,
                  size: 36,
                ),
                onPressed: () {
                  _changeImage(delta: 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeImage({int delta}) {
    var newTabIndex = _tabController.index + delta;
    if (newTabIndex >= mainTypes.length) {
      newTabIndex = 0;
    } else if (newTabIndex < 0) {
      newTabIndex = mainTypes.length - 1;
    }
    _tabController.animateTo(
      newTabIndex,
    );
  }
}
