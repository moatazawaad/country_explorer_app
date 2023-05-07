
// class NativeNameModel {
//   final NativeNameDetailsModel nativeNameDetails;
//
//   const NativeNameModel({required this.nativeNameDetails});
//
//   factory NativeNameModel.fromJson(Map<String, dynamic> json) =>
//       NativeNameModel(nativeNameDetails: NativeNameDetailsModel.fromJson(json.entries.first.value));
// }

import 'native_name_details_model.dart';

class NativeNameModel {
  NativeNameDetailsModel? nativeNameDetails;

  NativeNameModel({this.nativeNameDetails});

  factory NativeNameModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return NativeNameModel(nativeNameDetails: null);
    }

    return NativeNameModel(
      nativeNameDetails: json.entries.first.value != null
          ? NativeNameDetailsModel.fromJson(json.entries.first.value)
          : null,
    );
  }
}

// class NativeNameModel {
//   NativeNameDetailsModel nativeNameDetails;
//
//   NativeNameModel({NativeNameDetailsModel? nativeNameDetails})
//       : nativeNameDetails =
//       nativeNameDetails ?? NativeNameDetailsModel(errorMessage: 'Sorry, error', name: 'null error');
//
//   factory NativeNameModel.fromJson(Map<String, dynamic>? json) {
//     if (json == null) {
//       return NativeNameModel(nativeNameDetails: null);
//     }
//
//     return NativeNameModel(
//       nativeNameDetails: json.entries.first.value != null
//           ? NativeNameDetailsModel.fromJson(json.entries.first.value)
//           : null,
//     );
//   }
// }
//
// class NativeNameDetailsModel {
//   final String name;
//   final String? errorMessage;
//
//   NativeNameDetailsModel({required this.name, this.errorMessage});
//
//   factory NativeNameDetailsModel.fromJson(Map<String, dynamic> json) {
//     String? name = json['name'];
//
//     if (name == null) {
//       return NativeNameDetailsModel(errorMessage: 'Invalid JSON', name: 'lol error');
//     }
//
//     return NativeNameDetailsModel(name: name);
//   }
// }