import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

import '../../../foundations/app_constants.dart';

@singleton
class SignalRConnection {
  HubConnection? _hubConnection;

  Future<void> initializeSignalRConnection(
      Function(List<dynamic>?) handleIncomingMessage) async {
    const hubUrl =
        "https://neurotumapi-cqf9e4f7ahaxdwbt.uaenorth-01.azurewebsites.net/chatHub";

    _hubConnection = HubConnectionBuilder()
        .withUrl(
          hubUrl,
          options: HttpConnectionOptions(
            accessTokenFactory: () async {
              return AppConstants.accessToken;
            },
          ),
        )
        .withAutomaticReconnect()
        .build();

    _hubConnection?.onclose(({error}) {
      print("Connection closed. Error: $error");
    });

    _hubConnection?.on("ReceiveMessage", (arguments) {
      handleIncomingMessage(arguments);
    });

    try {
      await _hubConnection?.start();
      print("SignalR connected");
    } catch (e) {
      print("Failed to connect to SignalR: $e");
    }
  }

  void disposeSignalR() {
    _hubConnection?.stop();
    _hubConnection = null;
  }
}
