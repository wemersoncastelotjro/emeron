class CPFValidator {
  static bool validate(String cpf) {
    // Remove caracteres não numéricos
    cpf = cpf.replaceAll(RegExp(r'[^\d]'), '');

    // Verifica se tem 11 dígitos
    if (cpf.length != 11) return false;

    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cpf)) return false;

    // Calcula primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int digito1 = 11 - (soma % 11);
    if (digito1 > 9) digito1 = 0;

    // Calcula segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    int digito2 = 11 - (soma % 11);
    if (digito2 > 9) digito2 = 0;

    // Verifica se os dígitos calculados são iguais aos informados
    return (digito1 == int.parse(cpf[9]) && digito2 == int.parse(cpf[10]));
  }
}
