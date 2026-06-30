class BasicPokemon {
  BasicPokemon({required this.id, required this.name, required this.url});

  final int id;
  final String name;
  final String url;

  factory BasicPokemon.fromJson(Map<String, dynamic> json) {
    final id = extractIdFromUrl(json['url']);
    final name = json['name'];
    final url = json['url'];

    return BasicPokemon(id: id, name: name, url: url);
  }
}

int extractIdFromUrl(String url) {
  final segments = url.split('/');
  return int.parse(segments[segments.length - 2]);
}
