import 'package:splashtest/components/splash/singleimage.dart';

class ImagesList {
  List<SingleImage> images = [];

  ImagesList(this.images);

  ImagesList.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(new SingleImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images.map((v) => v.toJson()).toList();

    return data;
  }
}
