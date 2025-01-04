import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/training_controller.dart';

class FilterSelection extends StatefulWidget {
  const FilterSelection({super.key});

  @override
  State<FilterSelection> createState() => _FilterSelectionState();
}

class _FilterSelectionState extends State<FilterSelection> {
  final TrainingController controller = Get.put(TrainingController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.trainingSort.length,
                itemBuilder: (context, index) {
                  print(controller.trainingSort.length);
                  return GestureDetector(
                    onTap: () {
                      controller.onItemClick(index);
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 30),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xffe1e1e1),
                        border: controller.trainingSort[index].isSelected
                            ? Border(
                                left: BorderSide(
                                  color: Colors.red, // Border color
                                  width: 3.0, // Border width
                                ),
                              )
                            : null,
                      ),
                      child: Text(
                        controller.trainingSort[index].title,
                        style: TextStyle(
                            fontWeight:
                                controller.trainingSort[index].isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          controller.trainingSort[0].isSelected
              ? Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Location",
                            suffixIcon:
                                controller.locationController.text.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () {
                                          controller.locationController
                                              .clear(); // Clear text
                                          FocusScope.of(context)
                                              .unfocus(); // Close the keyboard
                                        },
                                      )
                                    : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          onChanged: (value) {
                            controller.locationSearchQuery.value = value;
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          controller.trainingSort[1].isSelected
              ? Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: controller.locationController,
                          decoration: InputDecoration(
                            hintText: "Search Location",
                            suffixIcon: controller
                                    .locationController.text.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      controller.locationController.text =
                                          ""; // Clear text
                                      controller.locationSearchQuery.value = "";
                                      FocusScope.of(context)
                                          .unfocus(); // Close the keyboard
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          onChanged: (value) {
                            controller.locationSearchQuery.value = value;
                            controller.locationController.text = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: Obx(() => ListView(
                              children: controller
                                  .getFilteredLocations()
                                  .map((location) => CheckboxListTile(
                                        title: Text(location),
                                        value: controller.selectedLocations
                                            .contains(location),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        onChanged: (value) {
                                          controller
                                              .toggleLocationFilter(location);
                                        },
                                      ))
                                  .toSet() // Removes duplicate locations
                                  .toList(),
                            )),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          controller.trainingSort[2].isSelected
              ? Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: controller.speakerController,
                          decoration: InputDecoration(
                            hintText: "Search Speaker",
                            suffixIcon: controller
                                    .speakerController.text.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      controller.speakerController.text =
                                          ""; // Clear text
                                      controller.speakerSearchQuery.value = "";
                                      FocusScope.of(context)
                                          .unfocus(); // Close the keyboard
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          onChanged: (value) {
                            controller.speakerSearchQuery.value = value;
                            controller.speakerController.text = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: Obx(() => ListView(
                              children: controller
                                  .getFilteredSpeakers()
                                  .map((speaker) => CheckboxListTile(
                                        title: Text(speaker),
                                        value: controller.selectedSpeakers
                                            .contains(speaker),
                                        onChanged: (value) {
                                          controller
                                              .toggleSpeakerFilter(speaker);
                                        },
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                      ))
                                  .toSet() // Removes duplicate locations
                                  .toList(),
                            )),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          controller.trainingSort[3].isSelected
              ? Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: controller.userNameController,
                          decoration: InputDecoration(
                            hintText: "Search Trainer",
                            suffixIcon: controller
                                    .userNameController.text.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      controller.userNameController.text =
                                          ""; // Clear text
                                      controller.speakerSearchQuery.value = "";
                                      FocusScope.of(context)
                                          .unfocus(); // Close the keyboard
                                    },
                                  )
                                : null,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          onChanged: (value) {
                            controller.speakerSearchQuery.value = value;
                            controller.userNameController.text = value;
                            setState(() {});
                          },
                        ),
                      ),
                      Expanded(
                        child: Obx(() => ListView(
                              children: controller
                                  .getFilteredUserNames()
                                  .map((userName) => CheckboxListTile(
                                        title: Text(userName),
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        value: controller.selectedUserNames
                                            .contains(userName),
                                        onChanged: (value) {
                                          controller
                                              .toggleUserNameFilter(userName);
                                        },
                                      ))
                                  .toSet() // Removes duplicate locations
                                  .toList(),
                            )),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
