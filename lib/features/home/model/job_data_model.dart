/*import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_data_model.freezed.dart';
part 'job_data_model.g.dart';

@freezed
class JobDataModel with _$JobDataModel {
  const JobDataModel._(); // 👈 Required for custom getters

  const factory JobDataModel({
    required List<JobUser> users,
    required int total,
    required int skip,
    required int limit,
  }) = _JobDataModel;

  factory JobDataModel.fromJson(Map<String, dynamic> json) =>
      _$JobDataModelFromJson(json);
}

@freezed
class JobUser with _$JobUser {
  const JobUser._(); // 👈 Required for custom getters

  const factory JobUser({
    required int id,
    @Default('') String firstName,
    @Default('') String lastName,
    @JsonKey(name: 'image') @Default('') String profilePic,
    @JsonKey(name: 'company') Company? company,
  }) = _JobUser;

  factory JobUser.fromJson(Map<String, dynamic> json) =>
      _$JobUserFromJson(json);

  /// LinkedIn-style mapping
  String get fullName => "$firstName $lastName";
  String get jobTitle => company?.title ?? '';
  String get description => company?.department ?? '';
}

@freezed
class Company with _$Company {
  const factory Company({
    @Default('') String department,
    @Default('') String name,
    @Default('') String title,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}*/

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'job_data_model.freezed.dart';

part 'job_data_model.g.dart';

@freezed
class JobDataModel with _$JobDataModel {
  const JobDataModel._(); // 👈 Required for custom getters

  const factory JobDataModel({required List<JobUser> users, required int total, required int skip, required int limit}) = _JobDataModel;

  factory JobDataModel.fromJson(Map<String, dynamic> json) => _$JobDataModelFromJson(json);
}

@freezed
@HiveType(typeId: 0, adapterName: "JobUserAdapter") // 👈 Hive ke liye
class JobUser with _$JobUser {
  const JobUser._(); // 👈 Required for custom getters

  const factory JobUser({
    @HiveField(0) required int id,
    @HiveField(1) @Default('') String firstName,
    @HiveField(2) @Default('') String lastName,
    // @HiveField(3) @Default('') String image,
    @HiveField(3) @JsonKey(name: 'image') @Default('') String image,
    @HiveField(4) @JsonKey(name: 'company') Company? company,
  }) = _JobUser;

  factory JobUser.fromJson(Map<String, dynamic> json) => _$JobUserFromJson(json);

  String get profilePic => image;

  /// LinkedIn-style mapping
  String get fullName => "$firstName $lastName";

  String get jobTitle => company?.title ?? '';

  String get description => company?.department ?? '';
}

@freezed
@HiveType(typeId: 1, adapterName: "CompanyAdapter") // 👈 Hive ke liye
class Company with _$Company {
  const factory Company({@HiveField(0) @Default('') String department, @HiveField(1) @Default('') String name, @HiveField(2) @Default('') String title}) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
