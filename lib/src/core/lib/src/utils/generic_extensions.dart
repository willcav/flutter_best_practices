/// Provides a [staticType] getter on all non-`dynamic` objects.
extension StaticTypeExtension<T> on T {
  /// Returns the static type of this object.
  ///
  /// This can be used to report the static type of an object (which might not
  /// always be obvious due to inference or when dealing with generics), which
  /// might be different from [Object.runtimeType].
  ///
  /// Example:
  ///
  /// ```dart
  /// void doSomething(T value) {
  ///   print(value.staticType);
  /// }
  ///
  /// doSomething("text"); // Prints String
  /// doSomething({}); // Prints Map
  /// ```
  Type get staticType => T;
}
