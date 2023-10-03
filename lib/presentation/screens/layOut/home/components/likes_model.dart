import 'package:task/presentation/screens/layOut/home/components/home_imports.dart';

class HomeLikesModel {
  final String title;
  bool value;
  HomeLikesModel({
    required this.value,required this.title
  });
}
final List<HomeLikesModel> homeLikesList = [
  HomeLikesModel(
      title: AppStrings.sampleText1,
      value: false
  ),
  HomeLikesModel(
      title: AppStrings.sampleText2,
      value: false
  ),
  HomeLikesModel(
      title: AppStrings.sampleText2,
      value: false
  )
];