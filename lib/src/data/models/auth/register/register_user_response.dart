class RegisterUserResponse {
  RegisterUserResponse({
    this.data,
    this.description,
    this.status,
  });

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    description = json['description'] as String?;
    status = json['status'] as String?;
  }

  Data? data;
  String? description;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['description'] = description;
    map['status'] = status;
    return map;
  }
}

class Data {
  Data({
    this.addationalTable,
    this.appPermissions,
    this.clientPlatform,
    this.clientType,
    this.environmentId,
    this.loginTableSlug,
    this.permissions,
    this.resourceId,
    this.role,
    this.sessions,
    this.tables,
    this.token,
    this.user,
    this.userFound,
    this.userId,
  });

  Data.fromJson(Map json) {
    addationalTable = json['addational_table'] != null
        ? AddationalTable.fromJson(json['addational_table'])
        : null;
    if (json['app_permissions'] != null) {
      appPermissions = [];
      json['app_permissions'].forEach((v) {
        appPermissions?.add(AppPermissions.fromJson(v));
      });
    }
    clientPlatform = json['client_platform'] != null
        ? ClientPlatform.fromJson(json['client_platform'])
        : null;
    clientType = json['client_type'] != null
        ? ClientType.fromJson(json['client_type'])
        : null;
    environmentId = json['environment_id'] as String?;
    loginTableSlug = json['login_table_slug'] as String?;
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(Permissions.fromJson(v));
      });
    }
    resourceId = json['resource_id'] as String?;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    if (json['sessions'] != null) {
      sessions = [];
      json['sessions'].forEach((v) {
        sessions?.add(Sessions.fromJson(v));
      });
    }
    if (json['tables'] != null) {
      tables = [];
      json['tables'].forEach((v) {
        tables?.add(Tables.fromJson(v));
      });
    }
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userFound = json['user_found'] as bool?;
    userId = json['user_id'] as String?;
  }

  AddationalTable? addationalTable;
  List<AppPermissions>? appPermissions;
  ClientPlatform? clientPlatform;
  ClientType? clientType;
  String? environmentId;
  String? loginTableSlug;
  List<Permissions>? permissions;
  String? resourceId;
  Role? role;
  List<Sessions>? sessions;
  List<Tables>? tables;
  Token? token;
  User? user;
  bool? userFound;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addationalTable != null) {
      map['addational_table'] = addationalTable?.toJson();
    }
    if (appPermissions != null) {
      map['app_permissions'] = appPermissions?.map((v) => v.toJson()).toList();
    }
    if (clientPlatform != null) {
      map['client_platform'] = clientPlatform?.toJson();
    }
    if (clientType != null) {
      map['client_type'] = clientType?.toJson();
    }
    map['environment_id'] = environmentId;
    map['login_table_slug'] = loginTableSlug;
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    map['resource_id'] = resourceId;
    if (role != null) {
      map['role'] = role?.toJson();
    }
    if (sessions != null) {
      map['sessions'] = sessions?.map((v) => v.toJson()).toList();
    }
    if (tables != null) {
      map['tables'] = tables?.map((v) => v.toJson()).toList();
    }
    if (token != null) {
      map['token'] = token?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['user_found'] = userFound;
    map['user_id'] = userId;
    return map;
  }
}

class User {
  User({
    this.active,
    this.clientPlatformId,
    this.clientTypeId,
    this.companyId,
    this.email,
    this.expiresAt,
    this.id,
    this.language,
    this.login,
    this.name,
    this.password,
    this.phone,
    this.photoUrl,
    this.projectId,
    this.roleId,
    this.timezone,
  });

  User.fromJson(Map json) {
    active = json['active'] as num?;
    clientPlatformId = json['client_platform_id'] as String?;
    clientTypeId = json['client_type_id'] as String?;
    companyId = json['company_id'] as String?;
    email = json['email'] as String?;
    expiresAt = json['expires_at'] as String?;
    id = json['id'] as String?;
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    login = json['login'] as String?;
    name = json['name'] as String?;
    password = json['password'] as String?;
    phone = json['phone'] as String?;
    photoUrl = json['photo_url'] as String?;
    projectId = json['project_id'] as String?;
    roleId = json['role_id'] as String?;
    timezone =
        json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
  }

  num? active;
  String? clientPlatformId;
  String? clientTypeId;
  String? companyId;
  String? email;
  String? expiresAt;
  String? id;
  Language? language;
  String? login;
  String? name;
  String? password;
  String? phone;
  String? photoUrl;
  String? projectId;
  String? roleId;
  Timezone? timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = active;
    map['client_platform_id'] = clientPlatformId;
    map['client_type_id'] = clientTypeId;
    map['company_id'] = companyId;
    map['email'] = email;
    map['expires_at'] = expiresAt;
    map['id'] = id;
    if (language != null) {
      map['language'] = language?.toJson();
    }
    map['login'] = login;
    map['name'] = name;
    map['password'] = password;
    map['phone'] = phone;
    map['photo_url'] = photoUrl;
    map['project_id'] = projectId;
    map['role_id'] = roleId;
    if (timezone != null) {
      map['timezone'] = timezone?.toJson();
    }
    return map;
  }
}

class Timezone {
  Timezone({
    this.id,
    this.name,
    this.text,
  });

  Timezone.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    text = json['text'];
  }

  String? id;
  String? name;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['text'] = text;
    return map;
  }
}

class Language {
  Language({
    this.id,
    this.name,
    this.nativeName,
    this.shortName,
  });

  Language.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nativeName = json['native_name'];
    shortName = json['short_name'];
  }

  String? id;
  String? name;
  String? nativeName;
  String? shortName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['native_name'] = nativeName;
    map['short_name'] = shortName;
    return map;
  }
}

class Token {
  Token({
    this.accessToken,
    this.createdAt,
    this.expiresAt,
    this.refreshInSeconds,
    this.refreshToken,
    this.updatedAt,
  });

  Token.fromJson(dynamic json) {
    accessToken = json['access_token'];
    createdAt = json['created_at'];
    expiresAt = json['expires_at'];
    refreshInSeconds = json['refresh_in_seconds'];
    refreshToken = json['refresh_token'];
    updatedAt = json['updated_at'];
  }

  String? accessToken;
  String? createdAt;
  String? expiresAt;
  num? refreshInSeconds;
  String? refreshToken;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['created_at'] = createdAt;
    map['expires_at'] = expiresAt;
    map['refresh_in_seconds'] = refreshInSeconds;
    map['refresh_token'] = refreshToken;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Tables {
  Tables({
    this.objectId,
    this.tableSlug,
  });

  Tables.fromJson(dynamic json) {
    objectId = json['object_id'];
    tableSlug = json['table_slug'];
  }

  String? objectId;
  String? tableSlug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['object_id'] = objectId;
    map['table_slug'] = tableSlug;
    return map;
  }
}

class Sessions {
  Sessions({
    this.clientPlatformId,
    this.clientTypeId,
    this.createdAt,
    this.data,
    this.envId,
    this.expiresAt,
    this.id,
    this.integrationId,
    this.ip,
    this.isChanged,
    this.projectId,
    this.roleId,
    this.updatedAt,
    this.userId,
  });

  Sessions.fromJson(dynamic json) {
    clientPlatformId = json['client_platform_id'];
    clientTypeId = json['client_type_id'];
    createdAt = json['created_at'];
    data = json['data'];
    envId = json['env_id'];
    expiresAt = json['expires_at'];
    id = json['id'];
    integrationId = json['integration_id'];
    ip = json['ip'];
    isChanged = json['is_changed'];
    projectId = json['project_id'];
    roleId = json['role_id'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  String? clientPlatformId;
  String? clientTypeId;
  String? createdAt;
  String? data;
  String? envId;
  String? expiresAt;
  String? id;
  String? integrationId;
  String? ip;
  bool? isChanged;
  String? projectId;
  String? roleId;
  String? updatedAt;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_platform_id'] = clientPlatformId;
    map['client_type_id'] = clientTypeId;
    map['created_at'] = createdAt;
    map['data'] = data;
    map['env_id'] = envId;
    map['expires_at'] = expiresAt;
    map['id'] = id;
    map['integration_id'] = integrationId;
    map['ip'] = ip;
    map['is_changed'] = isChanged;
    map['project_id'] = projectId;
    map['role_id'] = roleId;
    map['updated_at'] = updatedAt;
    map['user_id'] = userId;
    return map;
  }
}

class Role {
  Role({
    this.clientPlatformId,
    this.clientTypeId,
    this.id,
    this.name,
    this.projectId,
  });

  Role.fromJson(dynamic json) {
    clientPlatformId = json['client_platform_id'];
    clientTypeId = json['client_type_id'];
    id = json['id'];
    name = json['name'];
    projectId = json['project_id'];
  }

  String? clientPlatformId;
  String? clientTypeId;
  String? id;
  String? name;
  String? projectId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_platform_id'] = clientPlatformId;
    map['client_type_id'] = clientTypeId;
    map['id'] = id;
    map['name'] = name;
    map['project_id'] = projectId;
    return map;
  }
}

class Permissions {
  Permissions({
    this.clientTypeId,
    this.delete,
    this.id,
    this.read,
    this.roleId,
    this.tableSlug,
    this.update,
    this.write,
  });

  Permissions.fromJson(dynamic json) {
    clientTypeId = json['client_type_id'];
    delete = json['delete'];
    id = json['id'];
    read = json['read'];
    roleId = json['role_id'];
    tableSlug = json['table_slug'];
    update = json['update'];
    write = json['write'];
  }

  String? clientTypeId;
  String? delete;
  String? id;
  String? read;
  String? roleId;
  String? tableSlug;
  String? update;
  String? write;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_type_id'] = clientTypeId;
    map['delete'] = delete;
    map['id'] = id;
    map['read'] = read;
    map['role_id'] = roleId;
    map['table_slug'] = tableSlug;
    map['update'] = update;
    map['write'] = write;
    return map;
  }
}

class ClientType {
  ClientType({
    this.confirmBy,
    this.id,
    this.name,
    this.projectId,
    this.selfRecover,
    this.selfRegister,
    this.tables,
  });

  ClientType.fromJson(dynamic json) {
    confirmBy = json['confirm_by'];
    id = json['id'];
    name = json['name'];
    projectId = json['project_id'];
    selfRecover = json['self_recover'];
    selfRegister = json['self_register'];
    if (json['tables'] != null) {
      tables = [];
      json['tables'].forEach((v) {
        tables?.add(Tables.fromJson(v));
      });
    }
  }

  num? confirmBy;
  String? id;
  String? name;
  String? projectId;
  bool? selfRecover;
  bool? selfRegister;
  List<Tables>? tables;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['confirm_by'] = confirmBy;
    map['id'] = id;
    map['name'] = name;
    map['project_id'] = projectId;
    map['self_recover'] = selfRecover;
    map['self_register'] = selfRegister;
    if (tables != null) {
      map['tables'] = tables?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Fields {
  Fields({
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  });

  Fields.fromJson(dynamic json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  dynamic additionalProp1;
  dynamic additionalProp2;
  dynamic additionalProp3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['additionalProp1'] = additionalProp1;
    map['additionalProp2'] = additionalProp2;
    map['additionalProp3'] = additionalProp3;
    return map;
  }
}

class ClientPlatform {
  ClientPlatform({
    this.id,
    this.name,
    this.projectId,
    this.subdomain,
  });

  ClientPlatform.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    projectId = json['project_id'];
    subdomain = json['subdomain'];
  }

  String? id;
  String? name;
  String? projectId;
  String? subdomain;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['project_id'] = projectId;
    map['subdomain'] = subdomain;
    return map;
  }
}

class AppPermissions {
  AppPermissions({
    this.clientTypeId,
    this.delete,
    this.id,
    this.read,
    this.roleId,
    this.tableSlug,
    this.update,
    this.write,
  });

  AppPermissions.fromJson(dynamic json) {
    clientTypeId = json['client_type_id'];
    delete = json['delete'];
    id = json['id'];
    read = json['read'];
    roleId = json['role_id'];
    tableSlug = json['table_slug'];
    update = json['update'];
    write = json['write'];
  }

  String? clientTypeId;
  String? delete;
  String? id;
  String? read;
  String? roleId;
  String? tableSlug;
  String? update;
  String? write;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_type_id'] = clientTypeId;
    map['delete'] = delete;
    map['id'] = id;
    map['read'] = read;
    map['role_id'] = roleId;
    map['table_slug'] = tableSlug;
    map['update'] = update;
    map['write'] = write;
    return map;
  }
}

class AddationalTable {
  AddationalTable({
    this.fields,
  });

  AddationalTable.fromJson(dynamic json) {
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Fields? fields;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (fields != null) {
      map['fields'] = fields?.toJson();
    }
    return map;
  }
}
