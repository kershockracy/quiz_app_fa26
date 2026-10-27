import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        final questionIndex = (data['question_index'] as int) + 1;
        final question = data['question'] as String;
        final userAnswer = data['user_answer'] as String;
        final correctAnswer = data['correct_answer'] as String;
        final isCorrect = userAnswer == correctAnswer;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: isCorrect ? Colors.green : Colors.red,
                child: Text(
                  questionIndex.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Your answer: $userAnswer',
                      style: TextStyle(
                        color: isCorrect
                            ? Colors.lightGreenAccent
                            : Colors.redAccent,
                      ),
                    ),
                    Text(
                      'Correct answer: $correctAnswer',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
