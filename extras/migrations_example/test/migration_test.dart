import 'package:migrations_example/database.dart';
import 'package:test/test.dart';
import 'package:moor_generator/api/migrations.dart';

// Import the generated schema helper to instantiate databases at old versions.
import 'generated/schema.dart';

void main() {
  SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('upgrade from v1 to v2', () async {
    final connection = await verifier.startAt(1);
    final db = Database(2, connection);

    await verifier.migrateAndValidate(db, 2);
  });
}
