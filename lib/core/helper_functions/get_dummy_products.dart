import '../entities/product_entity.dart';

List<ProductEntity> getDummyProducts()
{
  return List.generate(10, (_) => dummyProduct());
}

ProductEntity dummyProduct(){
  return ProductEntity(
    reviews: [],
    name: 'Orange',
    code: 'ORG001',
    description: 'Citrusy and refreshing oranges.',
    price: 1.49,
    imageUrl: 'https://static.vecteezy.com/system/resources/thumbnails/015/606/509/small/sweet-orange-fruit-photo.jpg',
    isFeatured: true,
    expirationMonths: 5,
    numberOfCalories: 47,
    unitAmount: 1,
    isOrganic: true,
  );
}