class ChattUser {
  ChattUser({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.pushToken,
    required this.email,
    required this.image,
    required this.about,
    required this.lastActive,
    required this.isOnline,
  });
  late final String id;
  late final String name;
  late final String createdAt;
  late final String pushToken;
  late final String email;
  late final String image;
  late final String about;
  late final String lastActive;
  late final bool isOnline;
  
  ChattUser.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    pushToken = json['push_token'] ?? '';
    email = json['email'] ?? '';
    image = json['image'] ?? '';
    about = json['about'] ?? '';
    lastActive = json['last_active'] ?? '';
    isOnline = json['is_online'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['push_token'] = pushToken;
    data['email'] = email;
    data['image'] = image;
    data['about'] = about;
    data['last_active'] = lastActive;
    data['is_online'] = isOnline;
    return data;
  }
}