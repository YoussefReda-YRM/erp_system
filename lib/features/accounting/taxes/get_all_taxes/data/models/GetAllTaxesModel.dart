class GetAllTaxesModel {
  GetAllTaxesModel({
      this.id, 
      this.taxName, 
      this.taxValue, 
      this.taxType,});

  GetAllTaxesModel.fromJson(dynamic json) {
    id = json['id'];
    taxName = json['taxName'];
    taxValue = json['taxValue'];
    taxType = json['taxType'];
  }
  int? id;
  String? taxName;
  int? taxValue;
  int? taxType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['taxName'] = taxName;
    map['taxValue'] = taxValue;
    map['taxType'] = taxType;
    return map;
  }

}