enum ApiType {
  local(id: 0),
  config(id: 1);

  const ApiType({required this.id});

  static ApiType getType(int id) {
    return switch (id) {
      0 => ApiType.local,
      1 => ApiType.config,
      int() => ApiType.local,
    };
  }

  final int id;
}
