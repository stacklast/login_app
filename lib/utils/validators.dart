bool validarEmail(String email) {
  String patron = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = RegExp(patron);
  return regExp.hasMatch(email);
}
