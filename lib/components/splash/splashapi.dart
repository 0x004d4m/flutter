import 'package:splashtest/components/splash/imageslist.dart';

class SplashAPI {
  ImagesList data = new ImagesList([]);

  SplashAPI(this.data);

  SplashAPI.fromJson(Map<String, dynamic> json) {
    data = new ImagesList.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toJson();

    return data;
  }
}
