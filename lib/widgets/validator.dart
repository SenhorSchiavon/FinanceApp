class Validator {
  Validator._();

  static String? validateName(value) {
    final condition = RegExp(r"\b([A-ZÀ-Ý][-a-zÀ-ÿ.']+[ ]*)+");

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Esse campo deve conter apenas letras sendo uma delas Maiúscula!";
    }
    return null;
  }

  static String? validateMail(value) {
    final condition = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Email inválido!";
    }
    return null;
  }

  static String? validatePassword(value) {
    final condition = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");

    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && !condition.hasMatch(value)) {
      return "A senha deve ter no mínimo 8 caracteres, incluindo uma letra maiúscula, uma minúscula, um número e um caractere especial.";
    }
    return null;
  }
  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (password != confirmPassword) {
      return "As senhas não coincidem!";
    }
    return null;
  }
}
