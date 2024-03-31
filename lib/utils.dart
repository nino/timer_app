DateTime? parseNullableDateTime(String? input) {
  if (input == null) {
    return null;
  }
  return DateTime.parse(input);
}
