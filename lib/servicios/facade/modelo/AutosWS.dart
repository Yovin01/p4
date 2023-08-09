import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:ui';

/*class Estado {
  static const String vendido = 'VENDIDO';
  static const String disponible = 'DISPONIBLE';
  static const String reparacion = 'REPARACION';
}*/

class AutosWS {
  String modelo = '';
  String external_id = '';
  String placa = '';
  String color = '';
  //String duenio = '';
  String imagen = '';
  String marca = '';
  double precio = 0.0;
  //String estado = Estado.disponible;
  AutosWS();

  AutosWS.fromMap(Map<dynamic, dynamic> mapa){
    modelo = mapa ['modelo'];
    external_id = mapa ['external_id'];
    imagen = mapa ['imagen'];
    placa = mapa ['placa'];
    color = mapa ['color'];
    marca = mapa ['marca']['nombre'];
    precio = double.parse(mapa ['precio'].toString());
  }

  static Map<String, dynamic> toMap(AutosWS model) =>
      <String, dynamic> {
        "modelo": model.modelo,
        "external_id": model.external_id,
        "precio": model.precio,
        "marca": model.marca,
        "placa": model.placa,
        "imagen": model.imagen,
        "color": model.color
      };

  static String serialize(AutosWS model) =>
      json.encode(AutosWS.toMap(model));
}