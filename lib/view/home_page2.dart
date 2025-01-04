import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/training_controller.dart';
import '../widgets/training_card.dart';
import '../widgets/filter_modal.dart';
import 'detail_page.dart';

class HomePageA extends StatelessWidget {
  final TrainingController controller = Get.put(TrainingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe3e3e3),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Trainings',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(icon: Icon(Icons.menu,color: Colors.white,), onPressed: () {})],
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [

            Container(
              color: Colors.white,
              height: Get.height * 0.43,
            ),
            Container(
              color: Colors.red,
              height: Get.height * 0.25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Highlights Carousel
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Highlight",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200,
                  child: Row(
                    children: [

                      Container(
                        color: Colors.black45,
                        width: 35,
                        height: 80,
                        child: IconButton(onPressed: controller.nextCard, icon:Icon( Icons.chevron_left,color: Colors.white,
                        size: 25,)),
                      ),
                      Expanded(
                        child: Obx(() {
                          return CarouselSlider(

                            carouselController: controller.carouselSliderController,
                            items: controller.trainings.map((training) {
                              return Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(training.imageUrl, fit: BoxFit.cover),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.5),
                                            // Black with 80% opacity
                                            Colors.black.withOpacity(0.5),
                                            // Fully transparent
                                          ],
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            training.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "${training.location} - ${training.date}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: RichText(
                                                  text: new TextSpan(
                                                    text: '',
                                                    children: <TextSpan>[
                                                      new TextSpan(
                                                        text: training.price,
                                                        style: new TextStyle(
                                                            color: Colors.red,
                                                            decoration: TextDecoration
                                                                .lineThrough,
                                                            fontSize: 12),
                                                      ),
                                                      new TextSpan(
                                                        text:
                                                            " ${training.discountprice}",
                                                        style: new TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(DetailPage(
                                                    training: training,
                                                  ));
                                                },
                                                child: Text(
                                                  "View Details",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_right_alt,
                                                color: Colors.white,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                            options: CarouselOptions(
                                autoPlay: false,
                                viewportFraction: 0.9,
                                enlargeFactor: 0.5,
                                enlargeCenterPage: true,
                                aspectRatio: 2.2),
                          );
                        }),
                      ),

                      Container(
                        color: Colors.black45,
                        width: 35,
                        height: 80,
                        child: IconButton(onPressed: controller.prevCard, icon:Icon( Icons.chevron_right,color: Colors.white,
                          size: 25,)),
                      ),
                    ],
                  ),
                ),
                // Filter Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.filter_alt),
                          label: Text('Filter'),

                          onPressed: () => showFilterModal(context, controller),
                        ),
                      ),
                    ],
                  ),
                ),
                // Training List
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.filteredTrainings.isEmpty
                          ? controller.trainings.length
                          : controller.filteredTrainings.length,
                      itemBuilder: (context, index) {
                        final training = controller.filteredTrainings.isEmpty
                            ? controller.trainings[index]
                            : controller.filteredTrainings[index];
                        return GestureDetector(
                            onTap: () {
                              Get.to(DetailPage(
                                training: training,
                              ));
                            },

                            child: TrainingCard(training: training));
                      },
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
