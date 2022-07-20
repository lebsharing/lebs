import 'package:event_bus/event_bus.dart';

final EventBus leEventBus = EventBus();

class CommonEvent {
  String eventType;
  dynamic data;
  CommonEvent(this.eventType, {this.data});
}
