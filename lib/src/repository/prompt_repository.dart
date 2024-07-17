import 'dart:convert';

import 'package:ecosense/src/gemini_api/gemini_api.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class PromptRepository {
  final geminiAPI = GeminiAPI();

  Future<List<String>?> generateClimateActionIdeas() async {
    var res = await geminiAPI.responseFromTextOnly(
        "suggest 5 easy actions users can take to reduce their carbon footprint",
        genarationConfig: GenerationConfig(
            responseMimeType: 'application/json',
            responseSchema: Schema.array(items: Schema.string())));
    if (res != null) {
      return jsonDecode(res);
    }
    return [];
  }
}
