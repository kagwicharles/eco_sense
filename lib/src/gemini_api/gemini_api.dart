import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiAPI {
  GenerativeModel loadModel() {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      debugPrint('No \$API_KEY environment variable');
    }
    return GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey ?? "");
  }

  Future<String?> responseFromTextOnly(String prompt,
      {GenerationConfig? genarationConfig}) async {
    final content = [Content.text(prompt)];
    final response = await loadModel()
        .generateContent(content, generationConfig: genarationConfig);
    return response.text;
  }

  Future<String?> responseFromTextAndImage(
      String prompt, List<File> images) async {
    List<Uint8List> imageByteData = [];
    List<DataPart> imageParts = [];
    for (var image in images) {
      imageByteData.add(await image.readAsBytes());
    }
    if (imageByteData.isNotEmpty) {
      for (var imageByte in imageByteData) {
        imageParts.add(DataPart('image/jpeg', imageByte));
      }
    }
    final textPrompt = TextPart(prompt);
    final response = await loadModel().generateContent([
      Content.multi([textPrompt, ...imageParts])
    ]);
    return response.text;
  }
}
