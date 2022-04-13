

class Ink {
  String? name;
  String? image;
  String? buyUrl;
  List<Benefits>? benefits;

  Ink({this.name, this.image, this.buyUrl, this.benefits});

  Ink.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    buyUrl = json['buy-url'];
    if (json['benefits'] != null) {
      benefits = <Benefits>[];
      json['benefits'].forEach((v) {
        benefits!.add(new Benefits.fromJson(v));
      });
    }
  }

  
}

class Benefits {
  String? name;
  String? icon;

  Benefits({this.name, this.icon});

  Benefits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

 
}