let home =
  <html>
  <body>
    <script>

    var socket = new WebSocket("ws://" + window.location.host + "/ws");

    socket.onopen = function () {
      socket.send(JSON.stringify({"event":"Hell", "message": "Low"}));
    };

    socket.onmessage = function (e) {
      alert(e.data);
    };
    test = function () {
      socket.send(JSON.stringify({"event":"Hell", "message": "Low"}));
    }

    </script>

    <button onClick="test();">
    Test Button
    </button>
  </body>
  </html>

type message_object = {
    event: string;
    message: string;
} [@@deriving yojson]
(* Map.Make *)

(* open Base *)

(* let empty = Map.empty (module String) *)


let handle_client client _ =  
  let rec loop () = 
    match%lwt Dream.receive client with 
    | Some(message') ->
      let json = message' |> Yojson.Safe.from_string |> message_object_of_yojson in            
      let _ = Dream.send client json.message in 
      loop ()
    | _ -> 
      client|>Dream.close_websocket
  in
  loop ()

let () =
  Dream.run 
    @@ Dream.logger
    @@ Dream.router [
      Dream.get "/" (fun _ -> Dream.html home);
      Dream.get "ws"
      (fun req -> 
        (* Sec-WebSocket-Key 가 없으면 뱉기 *)
        
        let websocket_key = Dream.header req "Sec-WebSocket-Key" in 
        let id = Dream.cookie req "id" in 
        let _ = match id with 
        | Some(id') -> Dream.log "%s" id'
        | None -> () in
        
        match websocket_key with
        | Some(ws_key) -> Dream.websocket (fun x -> handle_client x ws_key)
        | None -> Dream.websocket Dream.close_websocket
        );
    ]
    

    
    
