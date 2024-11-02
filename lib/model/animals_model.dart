class AnimalsModel {
  final int id;
  final DateTime importDate;
  final String nameCh;
  final String nameEn;
  final String nameLatin;
  final String phylum;
  final String classType;
  final String order;
  final String family;
  final String conservation;
  final String distribution;
  final String habitat;
  final String feature;
  final String behavior;
  final String diet;
  final String crisis;
  final String interpretation;
  final String themeName;
  final String themeUrl;
  final String adopt;
  final String code;
  final String pic01Alt;
  final String pic01Url;
  final String pic02Alt;
  final String pic02Url;
  final String pic03Alt;
  final String pic03Url;
  final String pic04Alt;
  final String pic04Url;
  final String pdf01Alt;
  final String pdf01Url;
  final String pdf02Alt;
  final String pdf02Url;
  final String voice01Alt;
  final String voice01Url;
  final String voice02Alt;
  final String voice02Url;
  final String voice03Alt;
  final String voice03Url;
  final String videoUrl;
  final String update;
  final String cid;

  AnimalsModel({
    required this.id,
    required this.importDate,
    required this.nameCh,
    required this.nameEn,
    required this.nameLatin,
    required this.phylum,
    required this.classType,
    required this.order,
    required this.family,
    required this.conservation,
    required this.distribution,
    required this.habitat,
    required this.feature,
    required this.behavior,
    required this.diet,
    required this.crisis,
    required this.interpretation,
    required this.themeName,
    required this.themeUrl,
    required this.adopt,
    required this.code,
    required this.pic01Alt,
    required this.pic01Url,
    required this.pic02Alt,
    required this.pic02Url,
    required this.pic03Alt,
    required this.pic03Url,
    required this.pic04Alt,
    required this.pic04Url,
    required this.pdf01Alt,
    required this.pdf01Url,
    required this.pdf02Alt,
    required this.pdf02Url,
    required this.voice01Alt,
    required this.voice01Url,
    required this.voice02Alt,
    required this.voice02Url,
    required this.voice03Alt,
    required this.voice03Url,
    required this.videoUrl,
    required this.update,
    required this.cid,
  });

  factory AnimalsModel.fromJson(Map<String, dynamic> json) {
    String formatUrl(String? url) {
      return (url != null) ? url.replaceFirst('http://', 'https://') : '';
    }

    return AnimalsModel(
      id: json['_id'],
      importDate: DateTime.parse(json['_importdate']['date']),
      nameCh: json['a_name_ch'],
      nameEn: json['a_name_en'],
      nameLatin: json['a_name_latin'],
      phylum: json['a_phylum'],
      classType: json['a_class'],
      order: json['a_order'],
      family: json['a_family'],
      conservation: json['a_conservation'],
      distribution: json['a_distribution'],
      habitat: json['a_habitat'],
      feature: json['a_feature'],
      behavior: json['a_behavior'],
      diet: json['a_diet'],
      crisis: json['a_crisis'],
      interpretation: json['a_interpretation'],
      themeName: json['a_theme_name'],
      themeUrl: json['a_theme_url'],
      adopt: json['a_adopt'],
      code: json['a_code'],
      pic01Alt: json['a_pic01_alt'],
      pic01Url: formatUrl(json['a_pic01_url']),
      pic02Alt: json['a_pic02_alt'],
      pic02Url: formatUrl(json['a_pic02_url']),
      pic03Alt: json['a_pic03_alt'],
      pic03Url: formatUrl(json['a_pic03_url']),
      pic04Alt: json['a_pic04_alt'],
      pic04Url: formatUrl(json['a_pic04_url']),
      pdf01Alt: json['a_pdf01_alt'],
      pdf01Url: json['a_pdf01_url'],
      pdf02Alt: json['a_pdf02_alt'],
      pdf02Url: json['a_pdf02_url'],
      voice01Alt: json['a_voice01_alt'],
      voice01Url: json['a_voice01_url'],
      voice02Alt: json['a_voice02_alt'],
      voice02Url: json['a_voice02_url'],
      voice03Alt: json['a_voice03_alt'],
      voice03Url: json['a_voice03_url'],
      videoUrl: json['a_vedio_url'],
      update: json['a_update'],
      cid: json['a_cid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      '_importdate': {'date': importDate.toIso8601String()},
      'a_name_ch': nameCh,
      'a_name_en': nameEn,
      'a_name_latin': nameLatin,
      'a_phylum': phylum,
      'a_class': classType,
      'a_order': order,
      'a_family': family,
      'a_conservation': conservation,
      'a_distribution': distribution,
      'a_habitat': habitat,
      'a_feature': feature,
      'a_behavior': behavior,
      'a_diet': diet,
      'a_crisis': crisis,
      'a_interpretation': interpretation,
      'a_theme_name': themeName,
      'a_theme_url': themeUrl,
      'a_adopt': adopt,
      'a_code': code,
      'a_pic01_alt': pic01Alt,
      'a_pic01_url': pic01Url,
      'a_pic02_alt': pic02Alt,
      'a_pic02_url': pic02Url,
      'a_pic03_alt': pic03Alt,
      'a_pic03_url': pic03Url,
      'a_pic04_alt': pic04Alt,
      'a_pic04_url': pic04Url,
      'a_pdf01_alt': pdf01Alt,
      'a_pdf01_url': pdf01Url,
      'a_pdf02_alt': pdf02Alt,
      'a_pdf02_url': pdf02Url,
      'a_voice01_alt': voice01Alt,
      'a_voice01_url': voice01Url,
      'a_voice02_alt': voice02Alt,
      'a_voice02_url': voice02Url,
      'a_voice03_alt': voice03Alt,
      'a_voice03_url': voice03Url,
      'a_vedio_url': videoUrl,
      'a_update': update,
      'a_cid': cid,
    };
  }
}
