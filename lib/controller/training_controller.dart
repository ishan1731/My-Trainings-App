import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/model/training_sort_model.dart';
import 'package:my_trainings_app/model/user_model.dart';
import '../model/training_model.dart';

class TrainingController extends GetxController {
  var trainings = <Training>[
    Training(
      title: "Safe Scrum Master",
      location: "West Des Moines, IA",
      date: "Oct 30 - 31",
      time: "05:00 pm - 08:30 pm",
      price: "\$925",
      discountprice: "\$825",
      speaker: 'Keynote Speaker',
      imageUrl: "assets/images/tranning1.jpg",
      description: "Comprehensive training for Safe Scrum Master. This course covers "
          "advanced principles of Agile methodologies and their application in enterprise-level projects. "
          "Learn the necessary tools and techniques to successfully implement the SAFe framework for Scrum teams.",
      user: User(
        name: 'Helen Gribble',
        image: "assets/images/profile1.jpg",
        speaker: 'Keynote Speaker',
      ),
    ),
    Training(
      title: "Agile Fundamentals",
      location: "New York, NY",
      date: "Nov 5 - 6",
      time: "09:00 am - 01:00 pm",
      price: "\$750",
      discountprice: "\$700",
      speaker: 'Certified Agile Trainer',
      imageUrl: "assets/images/tranning2.jpg",
      description: "Learn the basics of Agile methodology. This course is designed for professionals looking to understand the "
          "core principles of Agile frameworks such as Scrum and Kanban. Learn how to increase project efficiency and improve team collaboration.",
      user: User(
        name: 'John Smith',
        image: "assets/images/profile2.jpg",
        speaker: 'Certified Agile Trainer',
      ),
    ),
    Training(
      title: "DevOps Essentials",
      location: "San Francisco, CA",
      date: "Nov 10 - 11",
      time: "10:00 am - 02:00 pm",
      price: "\$850",
      discountprice: "\$800",
      speaker: 'DevOps Consultant',
      imageUrl: "assets/images/tranning3.jpg",
      description: "Introduction to DevOps practices and tools. This training covers continuous integration and continuous deployment (CI/CD) "
          "systems, automation of the software delivery process, and the role of collaboration between development and operations teams.",
      user: User(
        name: 'Emily Brown',
        image: "assets/images/profile3.jpg",
        speaker: 'DevOps Consultant',
      ),
    ),
    Training(
      title: "Product Owner Certification",
      location: "Seattle, WA",
      date: "Nov 15 - 16",
      time: "03:00 pm - 06:00 pm",
      price: "\$950",
      discountprice: "\$900",
      speaker: 'Product Owner Expert',
      imageUrl: "assets/images/tranning4.webp",
      description: "Certification course for aspiring product owners. Understand the role of a Product Owner in Agile frameworks, "
          "master techniques to prioritize features, and learn to work with Scrum teams to deliver high-value products.",
      user: User(
        name: 'Michael Davis',
        image: "assets/images/profile4.jpg",
        speaker: 'Product Owner Expert',
      ),
    ),
    Training(
      title: "Kanban Workshop",
      location: "Austin, TX",
      date: "Nov 20 - 21",
      time: "11:00 am - 02:30 pm",
      price: "\$800",
      discountprice: "\$750",
      speaker: 'Agile Practitioner',
      imageUrl: "assets/images/tranning5.webp",
      description: "Hands-on workshop on Kanban practices. Learn how to apply Kanban in your teams to manage workflows more effectively, "
          "reduce cycle times, and increase productivity. Practical sessions with real-life scenarios and case studies.",
      user: User(
        name: 'Laura Wilson',
        image: "assets/images/profile5.jpg",
        speaker: 'Agile Practitioner',
      ),
    ),
    Training(
      title: "Agile Leadership",
      location: "Denver, CO",
      date: "Nov 25 - 26",
      time: "01:00 pm - 04:00 pm",
      price: "\$1,000",
      discountprice: "\$950",
      speaker: 'Leadership Coach',
      imageUrl: "assets/images/tranning6.jpg",
      description: "Develop leadership skills for Agile teams. This course is designed for leaders and managers to adopt an Agile mindset, "
          "develop collaborative skills, and enhance team performance using Agile principles.",
      user: User(
        name: 'Chris Johnson',
        image: "assets/images/profile6.jpg",
        speaker: 'Leadership Coach',
      ),
    ),
    Training(
      title: "Scrum for Developers",
      location: "Chicago, IL",
      date: "Dec 1 - 2",
      time: "09:30 am - 12:30 pm",
      price: "\$900",
      discountprice: "\$850",
      speaker: 'Scrum Master',
      imageUrl: "assets/images/tranning7.jpg",
      description: "Scrum practices tailored for development teams. Learn how developers can apply Scrum methodologies to enhance "
          "productivity and improve the development cycle with sprint planning, backlog refinement, and sprint reviews.",
      user: User(
        name: 'Karen Lee',
        image: "assets/images/profile7.jpg",
        speaker: 'Scrum Master',
      ),
    ),
    Training(
      title: "Agile Retrospectives",
      location: "Boston, MA",
      date: "Dec 5 - 6",
      time: "08:00 am - 11:30 am",
      price: "\$700",
      discountprice: "\$650",
      speaker: 'Team Coach',
      imageUrl: "assets/images/tranning8.jpg",
      description: "Enhance team performance with effective retrospectives. Learn how to conduct retrospectives that drive continuous "
          "improvement and create action plans that lead to better team dynamics, performance, and collaboration.",
      user: User(
        name: 'David Miller',
        image: "assets/images/profile8.webp",
        speaker: 'Team Coach',
      ),
    ),
    Training(
      title: "Agile Coaching Masterclass",
      location: "Los Angeles, CA",
      date: "Dec 10 - 11",
      time: "06:00 pm - 09:00 pm",
      price: "\$1,200",
      discountprice: "\$1,100",
      speaker: 'Agile Transformation Coach',
      imageUrl: "assets/images/tranning9.jpg",
      description: "Advanced coaching techniques for Agile transformation. This course dives deep into the strategies used to coach "
          "organizations through Agile transformations, with a focus on leadership, organizational change, and team coaching.",
      user: User(
        name: 'Sophia Green',
        image: "assets/images/profile9.webp",
        speaker: 'Agile Transformation Coach',
      ),
    ),
    Training(
      title: "Lean Principles",
      location: "Portland, OR",
      date: "Dec 15 - 16",
      time: "04:00 pm - 07:00 pm",
      price: "\$850",
      discountprice: "\$800",
      speaker: 'Lean Consultant',
      imageUrl: "assets/images/tranning10.jpg",
      description: "Implement Lean principles in your organization. Learn how to eliminate waste, improve flow, and increase efficiency "
          "using Lean tools and techniques to enhance business processes and achieve operational excellence.",
      user: User(
        name: 'Andrew White',
        image: "assets/images/profile10.jpg",
        speaker: 'Lean Consultant',
      ),
    ),
  ].obs;


  var trainingSort =<TrainingSortModel>[
    TrainingSortModel(title: "Sort by",isSelected: true),
    TrainingSortModel(title: "Location",isSelected: false),
    TrainingSortModel(title: "Training Name",isSelected: false),
    TrainingSortModel(title: "Trainer",isSelected: false)



  ].obs;


  TextEditingController locationController = TextEditingController();
  TextEditingController speakerController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  var locationSearchQuery = ''.obs;
  var speakerSearchQuery = ''.obs;
  var userNameSearchQuery = ''.obs;

  void onItemClick(int index) {

      for (int i = 0; i < trainingSort.length; i++) {
        trainingSort[i].isSelected = i == index; // Only the clicked item is selected
      }
      update();

  }


  var filteredTrainings = <Training>[].obs;

  void filterTrainings(String query) {
    filteredTrainings.value = trainings
        .where((training) => training.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }


  var selectedLocations = <String>[].obs;
  var selectedSpeakers = <String>[].obs;
  var selectedUserNames = <String>[].obs;

  void onSortItemClick(int index) {
    for (int i = 0; i < trainingSort.length; i++) {
      trainingSort[i].isSelected = i == index;
    }
    update();
  }

  void toggleLocationFilter(String location) {
    if (selectedLocations.contains(location)) {
      selectedLocations.remove(location);
    } else {
      selectedLocations.add(location);
    }
    update();
  }

  void toggleSpeakerFilter(String speaker) {
    if (selectedSpeakers.contains(speaker)) {
      selectedSpeakers.remove(speaker);
    } else {
      selectedSpeakers.add(speaker);
    }
    update();
  }

  void toggleUserNameFilter(String userName) {
    if (selectedUserNames.contains(userName)) {
      selectedUserNames.remove(userName);
    } else {
      selectedUserNames.add(userName);
    }
    update();
  }

  void applyFilters() {
    filteredTrainings.value = trainings.where((training) {
      bool matchesLocation = selectedLocations.isEmpty || selectedLocations.contains(training.location);
      bool matchesSpeaker = selectedSpeakers.isEmpty || selectedSpeakers.contains(training.speaker);
      bool matchesUserName = selectedUserNames.isEmpty || selectedUserNames.contains(training.user.name);
      return matchesLocation && matchesSpeaker && matchesUserName;
    }).toList();
    update();
  }




  void resetFilters() {
    selectedLocations.clear();
    selectedSpeakers.clear();
    selectedUserNames.clear();
    locationSearchQuery.value = '';
    speakerSearchQuery.value = '';
    userNameSearchQuery.value = '';
    filteredTrainings.value = trainings;
    update();
  }

  List<String> getFilteredLocations() {
    return trainings
        .map((training) => training.location)
        .toSet()
        .where((location) => location.toLowerCase().contains(locationSearchQuery.value.toLowerCase()))
        .toList();
  }

  List<String> getFilteredSpeakers() {
    return trainings
        .map((training) => training.speaker)
        .toSet()
        .where((speaker) => speaker.toLowerCase().contains(speakerSearchQuery.value.toLowerCase()))
        .toList();
  }

  List<String> getFilteredUserNames() {
    return trainings
        .map((training) => training.user.name)
        .toSet()
        .where((userName) => userName.toLowerCase().contains(userNameSearchQuery.value.toLowerCase()))
        .toList();
  }
}
