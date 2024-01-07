class Country{
  String? id;
  String name;
  String? capital;



  Country(this.name,this.capital);

  Country.fromMap(this.id,Map<String,dynamic> map)
    :
     name=map["name"] ?? "nan",
     capital=map["capital"] ?? "nan";


  Map<String,dynamic> toMap()
  {
    return 
    {
      "name" : name,
      "capital" : capital,
    };
  }


}