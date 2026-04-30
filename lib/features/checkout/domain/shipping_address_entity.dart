class ShippingAddressEntity {
  final String name;
  final String email;
  final String address;
  final String city;
  final String phoneNumber;
  final String addressDetails;

  ShippingAddressEntity(
      {required this.name,
      required this.email,
      required this.address,
      required this.city,
      required this.phoneNumber,
      required this.addressDetails});
}
