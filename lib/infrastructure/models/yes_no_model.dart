// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

YesNoModel yesNoModelFromJson(String str) =>
    YesNoModel.fromJson(json.decode(str));

String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

const Map<String, String> answersTypes = {
  'yes': 'Si',
  'no': 'No',
  'maybe': 'Tal vez',
};

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  YesNoModel copyWith({
    String? answer,
    bool? forced,
    String? image,
  }) =>
      YesNoModel(
        answer: answer ?? this.answer,
        forced: forced ?? this.forced,
        image: image ?? this.image,
      );

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      text: answersTypes[answer] ?? 'Espera un momento',
      fromWho: FromWho.other,
      imageUrl: image);
}
