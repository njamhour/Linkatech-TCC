class APIPath {
  static String usuario(String uid, String usuarioId) =>
      'linkatech/$uid/usuarios/$usuarioId';
  static String usuarios(String uid) => 'linkatech/$uid/usuarios';
  static String piezos(String uid, String piezoId) =>
      '/linkatech/$uid/piezos/$piezoId/piezos';
}
