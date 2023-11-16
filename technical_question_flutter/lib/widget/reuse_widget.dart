import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenerateWidget {
  Widget createSimpleButton(String textButton, VoidCallback functionCallBack) {
    return ElevatedButton(
      onPressed: functionCallBack,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      child: Text(
        textButton,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget createListTile(String title, String subtitle, double fontSize) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Widget createTextFormField(
    TextEditingController controller,
    String labelText,
    String hintText,
    Function(String) functionCallBack,
    List<TextInputFormatter>? inputFormatters,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.5),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
        controller: controller,
        onFieldSubmitted: (value) {
          functionCallBack(value);
        },
        keyboardType: keyboardType,
        inputFormatters: inputFormatters ?? null,
      ),
    );
  }
}
