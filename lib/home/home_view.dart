import 'package:flutter/material.dart';
import 'package:flutter_test1/data.dart';

import 'package:get/get.dart';

import '../components/components.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeModelView>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 100),
            child: MyAppBar(
              title: controller.title,
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: Get.width,
                height: Get.height * 0.73,
                child: ListView(
                  children: [
                    StatefulBuilder(builder: (context, setState) {
                      return Toggle(
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius: BorderRadius.circular(25)),
                        selectedIndex: controller.currentItem,
                        items: const [
                          'صدور بیمه بدنه',
                          'اعلام خسارت',
                          'بازدید بدنه',
                        ],
                        onItemSelected: (index) => controller.updateItem(index),
                        margin: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 50, right: 50),
                      );
                    }),
                    SizedBox(
                      width: Get.width,
                      height: 60,
                      child: Stack(
                        children: [
                          TextFormField(
                            controller: controller.txtController,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              filled: true,
                              fillColor: Colors.white,
                              suffix: const SizedBox(
                                width: 40,
                                height: 40,
                              ),
                              hintText: 'شناسه پرونده را وارد نمایید',
                              hintStyle: const TextStyle(color: Colors.grey),
                              contentPadding: const EdgeInsets.all(8),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          Positioned(
                              top: 8,
                              left: 2,
                              child: IconButton(
                                icon: image('assets/icons/search-normal.svg'),
                                /*  const Icon(
                             Icons.search,
                            color: Colors.black,
                          ), */
                                onPressed: controller.dev,
                              ))
                        ],
                      ),
                    ).paddingOnly(left: 10, right: 10),
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 250),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(children: [
                              const SizedBox(
                                height: 20,
                              ),
                              ListItem(
                                label: 'شناسه پرونده',
                                value: Data().user.id,
                              ),
                              ListItem(
                                label: 'نام مشتری',
                                value: Data().user.name,
                              ),
                              ListItem(
                                label: 'تلفن همراه',
                                value: Data().user.phone,
                              ),
                              ListItem(
                                label: 'محل بازدید',
                                value: Data().user.local,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                                child: Column(children: [
                                  ListItem(
                                    icon:
                                        image('assets/icons/document-text.svg'),
                                    label: 'وضعیت پرونده',
                                    value: Data().case1.id,
                                  ),
                                  ListItem(
                                    icon: image('assets/icons/clock.svg'),
                                    label: 'زمان بازدید',
                                    value: Data().case1.visittedTime.toString(),
                                  ),
                                ]).paddingAll(10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 2,
                                            color: Theme.of(context)
                                                    .appBarTheme
                                                    .backgroundColor ??
                                                Colors.red)),
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: controller.dev,
                                      child: const Center(
                                          child: Text(
                                        'ورود به پرونده',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                    ),
                                  ).paddingAll(20),
                                  Column(
                                    children: [
                                      Stack(
                                        children: [
                                          image('assets/icons/Polygon 2.svg'),
                                          Positioned(
                                              top: 10,
                                              right: 15,
                                              child: image(
                                                  'assets/icons/tick-circle.svg')),
                                        ],
                                      ),
                                      const Text('انجام شد')
                                    ],
                                  ),
                                ],
                              ),
                            ]),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: image('assets/icons/bookmark.svg'),
                          ),
                          const Positioned(
                            top: 8,
                            left: 10,
                            child: Text(
                              'خودم',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: image('assets/icons/search-normal.svg'),
          ),
          BottomNavigationBarItem(
            label: '2',
            icon: image('assets/icons/search-normal.svg'),
          ),
        ]),
      );
    });
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key? key, this.icon, this.label, this.value})
      : super(key: key);
  final String? label;
  final String? value;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon ?? image('assets/icons/Ellipse 1.svg'),
              const SizedBox(
                width: 10,
              ),
              Text(label ?? ''),
            ],
          ),
          Text(value ?? ''),
        ],
      ),
    );
  }
}
