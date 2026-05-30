import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel extends ShippingAddressEntity {  // ✅

  ShippingAddressModel({
    super.name,
    super.address,
    super.city,
    super.phoneNumber,
  });

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      address: entity.address,
      city: entity.city,
      phoneNumber: entity.phoneNumber,
    );
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      address: json['address'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'phoneNumber': phoneNumber,
    };
  }
}