class DescriptionValidator {
  static String? validate(String? value) {
    final isValid = value != null && value.trim().isNotEmpty;
    return isValid ? null : 'Insira uma descrição válida';
  }
}
