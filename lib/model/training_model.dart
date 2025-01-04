import 'package:my_trainings_app/model/user_model.dart';

class Training {
  final String title;
  final String location;
  final String date;
  final String time;
  final String price;
  final String discountprice;
  final String speaker;
  final String imageUrl;
  final String description;
  final User user;

  Training({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.user,
    required this.price,
    required this.discountprice,
    required this.speaker,
    required this.imageUrl,
    required this.description,
  });
}