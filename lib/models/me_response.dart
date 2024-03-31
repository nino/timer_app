class MeResponse {
  final String apiToken;
  final int id;
  final String title;

  const MeResponse({
    required this.apiToken,
    required this.id,
    required this.title,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'api_token': String apiToken,
        'id': int id,
        'title': String title,
      } =>
        MeResponse(
          apiToken: apiToken,
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load Me response.'),
    };
  }
}
