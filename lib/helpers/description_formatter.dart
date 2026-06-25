String descriptionFormatter(String description) {
  return description
      .replaceAll('\n', ' ')
      .replaceAll('\f', ' ')
      .replaceAll('\\', ' ');
}
