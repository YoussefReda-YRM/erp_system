class AddTaxesRequest {
  AddTaxesRequest({
      this.taxName, 
      this.taxValue, 
      this.taxType,});

  AddTaxesRequest.fromJson(dynamic json) {
    taxName = json['taxName'];
    taxValue = json['taxValue'];
    taxType = json['taxType'];
  }
  String? taxName;
  String? taxValue;
  String? taxType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['taxName'] = taxName;
    map['taxValue'] = taxValue;
    map['taxType'] = taxType;
    return map;
  }

}