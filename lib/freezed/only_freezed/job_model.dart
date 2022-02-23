import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.freezed.dart'; //For freezed class
part 'job_model.g.dart'; //For json serializable

@freezed
class Job with _$Job {
  const factory Job(
      {@Default("Software Engineer") String title, required int level}) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
