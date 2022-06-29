// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'dart:isolate' as _i2;
import 'package:build_runner/build_runner.dart' as _i3;
import 'dart:io' as _i4;

final _builders = <_i1.BuilderApplication>[];
void main(List<String> args, [_i2.SendPort? sendPort]) async {
  var result = await _i3.run(args, _builders);
  sendPort?.send(result);
  _i4.exitCode = result;
}
