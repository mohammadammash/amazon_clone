import 'package:amazon_clone/models/rating.dart';

double calculateRatingAverage(List<Rating> ratings) {
  double totalRating = 0;
  for (int i = 0; i < ratings.length; i++) {
    totalRating += ratings[i].rating;
  }

  if (totalRating != 0) {
    return totalRating / ratings.length.toDouble();
  }
  return 0;
}
