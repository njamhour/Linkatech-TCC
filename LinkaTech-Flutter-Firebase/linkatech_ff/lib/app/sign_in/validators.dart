abstract class StringValidator {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email não pode estar vazio';
  final String invalidPasswordErrorText = 'Senha não pode estar vazio';
}

// XUXU XAXA SHOSTAKE ME MAMA
// Xuxuxu Xaxaxa Tricolor vai acabar
// LELELELLE
// Sonic é nois