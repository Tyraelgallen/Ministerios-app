import 'package:ministerios/screens/screen_dependencies.dart';

SnackBar customSnack(String text) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}

SnackBar customSnackCapture() {
  return SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Captura Guardada en Galería",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}

SnackBar customSnackCapture2() {
  return SnackBar(
    content: Row(
      children: const [
        CircularProgressIndicator(),
        SizedBox(width: 10),
        Text(
          "Capturando...",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(milliseconds: 500),
  );
}

SnackBar customSnackCaptureWindows() {
  return SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Captura Guardada en Escritorio",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}

SnackBar customSnackLimpiar() {
  return SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Formulario Limpiado",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}

SnackBar customSnackCompleto() {
  return SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Formulario Completado y Enviado",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}

SnackBar customSnackDeleteRegistro() {
  return SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Elemento Borrado",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}

SnackBar customSnackDeleteTotal() {
  return SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.add_a_photo_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 10),
        Text(
          "Todos los Datos han sido Borrados",
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  );
}
