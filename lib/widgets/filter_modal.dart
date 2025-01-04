import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_trainings_app/widgets/filter_selection.dart';
import 'package:my_trainings_app/widgets/training_card.dart';
import '../controller/training_controller.dart';
import 'package:get/get.dart';

void showFilterModal(BuildContext context, TrainingController controller) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      String query = '';
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for the keyboard
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8.0, left: 16, right: 16, top: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Sort and Filters",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              height: 1,
            ),
            FilterSelection(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed:() {
                    controller.applyFilters();
                    Navigator.pop(context);
                  },
                  child: Text("Apply Filters"),
                ),

                Spacer(),
                ElevatedButton(
                  onPressed: controller.resetFilters,
                  child: Text("Reset Filters"),
                ),
                Spacer(),
              ],
            ),

            SizedBox(
              height: 15,
            )
            // Reset Filters Button
        /*   ,*/

          ],
        ),
      );
    },
  );
}
