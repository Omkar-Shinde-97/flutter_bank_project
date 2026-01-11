import 'DashboardScreen.dart';
import 'LoginScreen.dart';
import 'ProfileScreen.dart';
import 'RegisterScreen.dart';
import 'TransactionScreen.dart';

final routes = {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/dashboard': (context) => const DashboardScreen(),
  '/transactions': (context) => const TransactionScreen(),
  '/profile': (context) => const ProfileScreen(),
};
