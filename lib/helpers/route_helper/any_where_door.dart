import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AnywhereDoor {
  static void push(BuildContext context,
          {required PageRouteInfo path, dynamic arguments}) =>
      Future<void>.microtask(() {
        context.router.push(path);
      });

  static void pushReplaceAll(BuildContext context,
          {required PageRouteInfo path, dynamic arguments}) =>
      Future<void>.microtask(() {
        context.router.replaceAll([path]);
      });
  static void pushReplacementNamed(BuildContext context,
          {required String path, dynamic arguments}) =>
      Future<void>.microtask(() {
        context.router.navigateNamed(path);
      });

  static void pushNamed(BuildContext context,
          {required String path, dynamic arguments}) =>
      Future<void>.microtask(() {
        context.router.pushNamed(path);
      });

  static void pop(BuildContext context, {dynamic result}) =>
      Future<void>.microtask(() {
        context.router.pop();
      });

  static void popUntil(BuildContext context, {required String path}) =>
      Future<void>.microtask(() {
        context.router.popUntil((route) => route.settings.name == path);
      });

  static void pushNamedAndRemoveUntil(BuildContext context,
          {required String path, dynamic arguments}) =>
      Future<void>.microtask(() {
        context.router.popUntilRouteWithName(path);
      });
}
