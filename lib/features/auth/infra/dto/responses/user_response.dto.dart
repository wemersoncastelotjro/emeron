class UserResponseDTO {
  final String token;
  final int expiresAt;

  UserResponseDTO(this.token, this.expiresAt);

  factory UserResponseDTO.fromJson(Map<String, dynamic> json) => UserResponseDTO(
        json['token'] as String,
        json['expires_at'] as int,
      );
}
