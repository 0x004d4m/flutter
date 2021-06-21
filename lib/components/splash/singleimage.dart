class SingleImage {
  bool pirate = true;
  String url = '';

  SingleImage({this.pirate = true, this.url = ''});

  SingleImage.fromJson(Map<String, dynamic> json) {
    pirate = json['pirate'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pirate'] = this.pirate;
    data['url'] = this.url;
    return data;
  }
}
