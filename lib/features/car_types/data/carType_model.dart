

class CartypeModel{
  final String name;
  final String image;
  final String premium;
  final String deluxe;
  final String standard;
  
  
 
  

  CartypeModel( {required this.name, required this.image,
  required this.deluxe,
   required this.standard ,
  required this.premium,
  
 
  });
  factory CartypeModel.fromJson(jsonData,){
    return CartypeModel(
      name:jsonData['name'] , 
      image:jsonData['image'],
      deluxe:jsonData['deluxe'],
       standard:jsonData['standard'],
       premium:jsonData['Premium'],
      
       
       );
  }
}