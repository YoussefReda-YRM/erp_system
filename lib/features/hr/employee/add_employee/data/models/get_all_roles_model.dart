class GetAllRolesResponse {
  final String? roleId;
  final String? roleName;

  GetAllRolesResponse({
    this.roleId,
    this.roleName,
  });

  factory GetAllRolesResponse.fromJson(Map<String, dynamic> json) =>
      GetAllRolesResponse(
        roleId: json['id'],
        roleName: json['name'],
      );
}
