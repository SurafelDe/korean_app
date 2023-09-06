import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: Get.put(HomeController()),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                title: Row(
                  children: [
                    Image.asset('assets/icons/btcon_28.png'),
                    Text(
                      '목이길어슬픈기린님의 새로운 스팟',
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
                actions: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 25,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageIcon(
                            AssetImage('assets/icons/star.png'),
                            color: Colors.pink,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text('323,233')
                        ],
                      ),
                    ),
                  ),
                  Image.asset('assets/icons/btcon_40.png')
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Stack(children: [
                  controller.isLoading
                      ? loadingWidget()
                      : controller.users.isEmpty
                          ? emptyWidget()
                          : CarouselSlider(
                              items: List.generate(
                                controller.users.length,
                                (index) => Draggable(
                                  onDragEnd: (drag) {
                                    if (drag.velocity.pixelsPerSecond.dx <
                                        -50 || drag.velocity.pixelsPerSecond.dy > 50) {
                                      controller.nextItem(index);
                                    }
                                  },
                                  feedback: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: (controller.users[index].images?[
                                            controller
                                                .currentImageIndex].startsWith("http") ?? true) ?
                                            CachedNetworkImageProvider(
                                                controller.users[index].images?[
                                                        controller
                                                            .currentImageIndex] ??
                                                    "") : MemoryImage(
                                                Uri.parse(controller.users[index].images?[controller.currentImageIndex] ?? "").data!.contentAsBytes()
                                            ) as ImageProvider ,
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.6),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    width: 300,
                                    height: 500,
                                  ),
                                  childWhenDragging: Container(),
                                  child: Stack(children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: (controller.users[index].images?[
                                              controller
                                                  .currentImageIndex].startsWith("http") ?? true) ?
                                              CachedNetworkImageProvider(
                                                  controller.users[index].images?[
                                                  controller
                                                      .currentImageIndex] ??
                                                      "") : MemoryImage(
                                                  Uri.parse(controller.users[index].images?[controller.currentImageIndex] ?? "").data!.contentAsBytes()
                                              ) as ImageProvider ,
                                              fit: BoxFit.cover),
                                          border: Border.all(
                                              color: Colors.grey.shade600,
                                              width: 0.5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            border: Border.all(
                                                color: Colors.grey.shade600,
                                                width: 0.5),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.black,
                                                  Colors.transparent,
                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.center,
                                                stops: [0.0, 1.0],
                                                tileMode: TileMode.clamp),
                                          ),
                                          // padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .leftClicked(),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      height: 250,
                                                      width: Get.width / 3,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .rightClicked(),
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      height: 250,
                                                      width: Get.width / 3,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 15, 20, 0),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              height: 25,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(3),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          10),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  const ImageIcon(
                                                                    AssetImage(
                                                                        'assets/icons/star.png'),
                                                                    color: Colors
                                                                        .redAccent,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  Text(
                                                                    (controller.users[index].likeCount ??
                                                                            0)
                                                                        .toString(),
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            RichText(
                                                              text: TextSpan(
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                                children: [
                                                                  TextSpan(
                                                                    text: controller
                                                                        .users[
                                                                            index]
                                                                        .name, // '잭과분홍콩나물'
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            24,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        ' ${controller.users[index].age}',
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            controller.currentImageIndex ==
                                                                    0
                                                                ? Text(
                                                                    controller
                                                                            .users[index]
                                                                            .location ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                : controller.currentImageIndex ==
                                                                        1
                                                                    ? Container(
                                                                        width: Get.width -
                                                                            190,
                                                                        margin: EdgeInsets.only(
                                                                            right:
                                                                                2),
                                                                        child:
                                                                            Text(
                                                                          controller.users[index].description ??
                                                                              "",
                                                                          maxLines:
                                                                              3,
                                                                          style: TextStyle(
                                                                              // fontSize: 20,
                                                                              color: Colors.white),
                                                                        ),
                                                                      )
                                                                    : Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.symmetric(vertical: 5),
                                                                            padding:
                                                                                EdgeInsets.all(10),
                                                                            decoration: BoxDecoration(
                                                                                color: Color(0xff621133),
                                                                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                                                                border: Border.all(color: Colors.pink)),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Image.asset('assets/icons/heart.png'),
                                                                                SizedBox(
                                                                                  width: 4,
                                                                                ),
                                                                                Text(
                                                                                  controller.users[index].tags?.first ?? "", //'진지한 연애를 찾는 중'
                                                                                  style: TextStyle(color: Colors.white),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                Get.width - 200,
                                                                            margin:
                                                                                const EdgeInsets.only(right: 2),
                                                                            child:
                                                                                Wrap(
                                                                              alignment: WrapAlignment.start,
                                                                              direction: Axis.horizontal,
                                                                              children: List.generate(controller.users[index].tags?.length ?? 0, (j) {
                                                                                return j != 0
                                                                                    ? Container(
                                                                                        margin: EdgeInsets.only(bottom: 4, right: 4),
                                                                                        padding: EdgeInsets.all(5),
                                                                                        decoration: BoxDecoration(
                                                                                            color: Colors.black,
                                                                                            borderRadius: const BorderRadius.all(
                                                                                              Radius.circular(15),
                                                                                            ),
                                                                                            border: Border.all(color: Colors.black12)),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          children: [
                                                                                            // const ImageIcon(
                                                                                            //   AssetImage(
                                                                                            //       'assets/icons/star.png'),
                                                                                            //   color: Colors.grey,
                                                                                            // ),
                                                                                            // const SizedBox(
                                                                                            //   width: 4,
                                                                                            // ),
                                                                                            Text(
                                                                                              controller.users[index].tags![j] ?? "",
                                                                                              style: const TextStyle(color: Colors.white),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      )
                                                                                    : Container();
                                                                              }),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Image.asset(
                                                                'assets/icons/btcon_48.png'))
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: Colors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                        Container(
                                            margin:
                                                const EdgeInsets.only(top: 8.0),
                                            height: 4,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List.generate(
                                                  controller.users[index].images
                                                          ?.length ??
                                                      0, (k) {
                                                return Container(
                                                  width: (Get.width - 110) /
                                                      (controller.users[index]
                                                              .images?.length ??
                                                          1),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2),
                                                  decoration: BoxDecoration(
                                                      color: k ==
                                                              controller
                                                                  .currentImageIndex
                                                          ? Color(0xffFF006B)
                                                          : Color(0xff202020),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  2))),
                                                );
                                              }),
                                            ),
                                          )
                                  ]),
                                ),
                              ),
                              disableGesture: true,
                              options: CarouselOptions(
                                  height: Get.height - 200,
                                  aspectRatio: 2.0,
                                  // enlargeCenterPage: true,
                                  // autoPlayInterval: const Duration(seconds: 6),
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                  viewportFraction: 0.9,
                                  enableInfiniteScroll:
                                      controller.users.length > 1,
                                  onPageChanged: (index, reason) {
                                    controller.currentIndex = index;
                                    controller.update();
                                  }),
                            ),
                ]),
              ));
        });
  }

  Widget emptyWidget() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          '추천 드릴 친구들을 준비 중이에요',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          '매일 새로운 친구들을 소개시켜드려요',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    ));
  }

  Widget loadingWidget() {
    return Center(
        child: CircularProgressIndicator(
      color: Colors.pink,
    ));
  }
}
