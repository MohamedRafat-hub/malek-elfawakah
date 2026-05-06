import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phoneNumber;
  String? addressDetails;

  ShippingAddressModel({ this.name,
    this.email,
    this.address,
    this.city,
    this.phoneNumber,
    this.addressDetails});

  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
        name: entity.name,
        email: entity.email,
        address: entity.address,
        city: entity.city,
        phoneNumber: entity.phoneNumber,
        addressDetails: entity.addressDetails);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phoneNumber': phoneNumber,
      'addressDetails': addressDetails,
    };
  }
}