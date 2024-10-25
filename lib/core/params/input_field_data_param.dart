// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class InputFieldDataParam extends Equatable {
  String? parameter;
  String? value;

  InputFieldDataParam({this.parameter, this.value});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[parameter!] = value;
    return data;
  }

  @override
  List<Object?> get props => [parameter, value];
}
