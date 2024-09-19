class CarPrices{
final String price;

  CarPrices( {required this.price,});
  factory CarPrices.fromJson(jsonDate){
    return CarPrices(price:jsonDate['price']
    );
  }
}