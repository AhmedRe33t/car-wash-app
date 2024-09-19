class ServicesTypes{
  final String title;
  final String dis1;
  final String dis2;
  final String dis3;
  final String dis4;

  ServicesTypes({required this.title, required this.dis1, required this.dis2, required this.dis3, required this.dis4});
factory ServicesTypes.fromJson(jsonDate){
  return ServicesTypes(
    title:jsonDate['title'] ,
     dis1: jsonDate['dis1'],
      dis2: jsonDate['dis2'],
       dis3: jsonDate['dis3'],
        dis4: jsonDate['dis4'],
        
        );
}
}
