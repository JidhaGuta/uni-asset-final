import '../../domain/entities/device.dart';

class DeviceModel extends Device {
  DeviceModel({
    required String id,
    required String name,
    required String model,
    required String serialNumber,
    required String imageUrl,
    required String status,
  }) : super(
          id: id,
          name: name,
          model: model,
          serialNumber: serialNumber,
          imageUrl: imageUrl,
          status: status,
        );

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      serialNumber: json['serialNumber'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'serialNumber': serialNumber,
      'imageUrl': imageUrl,
      'status': status,
    };
  }
}