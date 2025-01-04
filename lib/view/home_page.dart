import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/training_controller.dart';
import '../widgets/training_card.dart';
import '../widgets/filter_modal.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  final TrainingController controller = Get.put(TrainingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Trainings'),
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: Column(
        children: [
          // Highlights Carousel
          Container(
            height: 200,
            child: Obx(() {
              return
                CarouselSlider(
                  items: controller.trainings.map((training) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(training.imageUrl, fit: BoxFit.cover),


                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8), // Black with 80% opacity
                                  Colors.black.withOpacity(0.0), // Fully transparent
                                ],
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  training.title,
                                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${training.location} - ${training.date}",
                                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
                                ),

                                Row(

                                  children: [

                                    Expanded(
                                      child: RichText(
                                        text: new TextSpan(
                                          text: '',
                                          children: <TextSpan>[
                                            new TextSpan(
                                              text:   training.price,
                                              style: new TextStyle(
                                                color: Colors.red,
                                                decoration: TextDecoration.lineThrough,
                                                  fontSize: 12
                                              ),
                                            ),
                                            new TextSpan(
                                              text:    " ${training.discountprice}",
                                              style: new TextStyle(
                                                color: Colors.red,
                                               fontSize: 15,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),


                                    GestureDetector(
                                      onTap: (){

                                        Get.to(DetailPage(training: training,));
                                      },
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                    Icon(Icons.arrow_right_alt,color: Colors.white,)


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
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1.95


                  ),
                );
            }),
          ),
          // Filter Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text("Coming Up",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.bold
                ),)),
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
                  return TrainingCard(training: training);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
