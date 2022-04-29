/// coord : {"lon":9.19,"lat":45.4642}
/// listed : [{"main":{"aqi":3},"components":{"co":337.12,"no":0.46,"no2":5.48,"o3":144.48,"so2":1.88,"pm2_5":24.62,"pm10":26.92,"nh3":9.25},"dt":1651237200}]

class CurrentAir {
  Coord? coord;
  List<Listed>? listed;

  CurrentAir({
      this.coord, 
      this.listed,});

  CurrentAir.fromJson(dynamic json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['list'] != null) {
      listed = [];
      json['list'].forEach((v) {
        listed?.add(Listed.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (coord != null) {
  //     map['coord'] = coord?.toJson();
  //   }
  //   if (listed != null) {
  //     map['listed'] = listed?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }

}

/// main : {"aqi":3}
/// components : {"co":337.12,"no":0.46,"no2":5.48,"o3":144.48,"so2":1.88,"pm2_5":24.62,"pm10":26.92,"nh3":9.25}
/// dt : 1651237200

class Listed {
  Listed({
      this.main, 
      this.components, 
      this.dt,});

  Listed.fromJson(dynamic json) {
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    components = json['components'] != null ? Components.fromJson(json['components']) : null;
    dt = json['dt'];
  }
  Main? main;
  Components? components;
  int? dt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (main != null) {
      map['main'] = main?.toJson();
    }
    if (components != null) {
      map['components'] = components?.toJson();
    }
    map['dt'] = dt;
    return map;
  }

}

/// co : 337.12
/// no : 0.46
/// no2 : 5.48
/// o3 : 144.48
/// so2 : 1.88
/// pm2_5 : 24.62
/// pm10 : 26.92
/// nh3 : 9.25

class Components {
  Components({
      this.co, 
      this.no, 
      this.no2, 
      this.o3, 
      this.so2, 
      this.pm2_5,
      this.pm10, 
      this.nh3,});

  Components.fromJson(dynamic json) {
    co = json['co'];
    no = json['no'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm2_5 = json['pm2_5'];
    pm10 = json['pm10'];
    nh3 = json['nh3'];
  }
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  double? pm2_5;
  double? pm10;
  double? nh3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['co'] = co;
    map['no'] = no;
    map['no2'] = no2;
    map['o3'] = o3;
    map['so2'] = so2;
    map['pm2_5'] = pm2_5;
    map['pm10'] = pm10;
    map['nh3'] = nh3;
    return map;
  }

}

/// aqi : 3

class Main {
  Main({
      this.aqi,});

  Main.fromJson(dynamic json) {
    aqi = json['aqi'];
  }
  int? aqi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aqi'] = aqi;
    return map;
  }

}

/// lon : 9.19
/// lat : 45.4642

class Coord {
  Coord({
      this.lon, 
      this.lat,});

  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }

}