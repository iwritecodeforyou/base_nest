class NetworkConfig {
  static const String baseUrl = 'https://reqres.in';

  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'x-api-key': 'reqres-free-v1',

  };
}
