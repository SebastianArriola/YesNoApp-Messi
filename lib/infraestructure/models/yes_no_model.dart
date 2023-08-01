class YesNoModel {

  final String answer;
  final bool forced;
  final String image;

  YesNoModel({required this.answer,required this.image,required this.forced});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) =>

    YesNoModel(answer: json['answer'], image: json['image'], forced: json['forced']);

  

}