import 'package:angelschein_lernen/app/app.dart';
import 'package:angelschein_lernen/bootstrap.dart';
import 'package:angelschein_lernen/environment.dart';

void main() {
  bootstrap(
    () => const App(),
    environment: Environment.production,
  );
}
