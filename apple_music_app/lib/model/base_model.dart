class BaseModel {
  int intValueCheck(dynamic value) {
    if (value == null) {
      return 0;
    } else {
      return value is int ? value : int.parse(value) ?? 0;
    }
  }

  double doubleValueCheck(dynamic value) {
    if (value == null) {
      return 0.0;
    } else {
      return value is double
          ? value
          : value is int
              ? value.toDouble()
              : 0;
    }
  }
}
