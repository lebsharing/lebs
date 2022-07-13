import 'package:event_bus/event_bus.dart';

final EventBus leEventBus = EventBus();

class CommentEvent {
  String eventType;
  dynamic data;
  CommentEvent(this.eventType, {this.data});
}
