class TitleValidator {
  static String? validate(String? value) {
    final isValid = value != null && value.trim().isNotEmpty;
    return isValid ? null : 'Insira um título válido';
  }
}
