import 'dart:convert';

import 'package:ecosense/src/gemini_api/gemini_api.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class PromptRepository {
  final geminiAPI = GeminiAPI();

  Future<List<String>?> generateClimateActionIdeas() async {
    List<String> actionPoints = [];
    var res = await geminiAPI.responseFromTextOnly(
        "suggest 5 easy actions users can take to reduce their carbon footprint",
        genarationConfig: GenerationConfig(
            responseMimeType: 'application/json',
            responseSchema: Schema.array(items: Schema.string())));
    if (res != null) {
      var actions = jsonDecode(res);
      for (var action in actions) {
        actionPoints.add(action);
      }
    }
    return actionPoints;
  }

  Future<String?> learnMoreAboutClimateAction(String keywords) async {
    var res = await geminiAPI.responseFromTextOnly(
        "explain how $keywords would help reduce my carbon footprint",
        genarationConfig: GenerationConfig(
            responseMimeType: 'text/plain', responseSchema: Schema.string()));
    if (res != null) {
      return res;
    }
    return null;
  }
}
