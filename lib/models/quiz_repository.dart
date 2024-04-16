import 'package:tinBudget_app/models/answer_model.dart';
import 'package:tinBudget_app/models/question_model.dart';
import 'package:tinBudget_app/models/quiz_model.dart';

final List<QuizModel> quizRepository = [
  QuizModel(
    quiz: 'Additional features and improvements',
    date: '16 May, 2023',
    questions: [
      QuestionModel(
        isOpen: false,
        userName: 'Buster',
        question:
            'What additional features or services would you like to see in your bank\'s mobile application?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'The ability to manage personal investments and securities portfolio directly through the application.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'The option to connect and manage additional financial products such as insurance or retirement planning.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'Integration with budgeting systems and expense tracking for better financial control.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Emma',
        question:
            'Do you feel that the mobile application fully meets your needs for financial management, or is there something you feel is lacking?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'The application more than satisfies my needs, but adding support for cryptocurrency investments would be fantastic.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'The core functionality is good, but built-in tools for budget planning and tracking are missing.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'The mobile application largely meets my needs, but enhanced analysis capabilities for income and expenses would be useful.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Dylan',
        question:
            'How would you feel about adding functionality for investment management or financial goals to the application?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'I definitely welcome the ability to manage investments and set financial goals directly through the mobile application.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'Adding functionality for automatic investment of surplus funds into investment goals would be great.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'I believe that integrating with investment platforms and tools for investment planning would make the application more comprehensive.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Rachel',
        question:
            'Are there any aspects of the mobile banking application that could be improved to increase your interest or engagement?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'It would be great if the application provided more personalized financial recommendations and advice based on my spending and goals.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'Adding financial courses or articles would make the application more appealing and informative.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'Increased interactivity and the ability to participate in financial literacy games could significantly enhance the user experience.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Bruno',
        question:
            'What changes or enhancements in the application could make your experience of using it more convenient or enjoyable?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'I would like to see improved tools for analyzing my financial transactions and transparent reports on expenses and incomes.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'Adding functionality for quick creation of investment portfolios and tracking their performance could make using the application more convenient.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'Improving the interface and adding personalized notifications about my financial assets would make my experience of using the application more convenient and enjoyable.',
              date: '16 May, 2023'),
        ],
      ),
    ],
  ),
  QuizModel(
    quiz: 'Convenience of using the mobile banking application',
    date: '16 May, 2023',
    questions: [
      QuestionModel(
        isOpen: false,
        userName: 'Buster',
        question:
            'How do you rate the overall convenience of using the mobile banking application for conducting financial transactions?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'I rate the convenience of using the application as high due to its intuitive interface and fast navigation.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'The overall convenience is good, but I would like to have more personalized features tailored to my needs.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'The convenience of using the application is generally satisfactory, but could be improved to optimize the process of conducting operations.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Emma',
        question:
            'Are there any features or operations that you find inconvenient or in need of improvement in the mobile application?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'Some features, such as setting up recurring payments, require too many steps to configure.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'Currency conversion operations between accounts are challenging due to unclear exchange rates.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'The ability to scan and add checks in the application does not always work reliably and requires improvements.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Dylan',
        question:
            'What is your opinion on the authentication process and security in the mobile application?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'The authentication process and security in the application are quite satisfactory and inspire confidence.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'User authentication could be more convenient, possibly using biometric data.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'Adding additional authentication methods, such as two-factor authentication, would enhance the level of security.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Rachel',
        question:
            'How do you rate the time it takes to perform basic operations in the application, such as transfers, bill payments, and account management?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'The time it takes to perform operations in the application is quite satisfactory and meets my expectations.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'Transfers between accounts could be executed more quickly for user convenience.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'The overall time it takes to perform operations is acceptable, although processing payments between different banks requires improvement.',
              date: '16 May, 2023'),
        ],
      ),
      QuestionModel(
        isOpen: false,
        userName: 'Bruno',
        question:
            'What additional features or improvements would you like to see in the mobile banking application to enhance its convenience of use?',
        date: '16 May, 2023',
        answers: [
          AnswerModel(
              userName: 'Emma Campbell',
              answer:
                  'I would like to see more intuitive analytical tools for tracking financial goals and expenses.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Dylan Johnson',
              answer:
                  'Adding the ability to view and pay bills from a photo would make account management even more convenient.',
              date: '16 May, 2023'),
          AnswerModel(
              userName: 'Rachel Turner',
              answer:
                  'Expanding the options for setting transaction alerts and notifications would increase control and convenience of use.12:51',
              date: '16 May, 2023'),
        ],
      ),
    ],
  ),
];
