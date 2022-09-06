let home =
  <html>
  <body>
    <script>

    var socket = new WebSocket("ws://" + window.location.host + "/ws");

    socket.onopen = function () {
      socket.send(JSON.stringify({"event":"enter", "message": JSON.stringify({"nickname": "Ryan Yang"})}));
    };

    socket.onmessage = function (e) {
      alert(e.data);
    };
    test = function () {
      socket.send(JSON.stringify({"event":"enter", "message": JSON.stringify({"nickname": "2Paradise"})}));
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


type enter_event = {
    nickname: string;
} [@@deriving yojson]

type enter_result = {
  id: string;
  nickname: string;
} [@@deriving yojson]

(* Map.Make *)

(* open Base *)

(* let empty = Map.empty (module String) *)

let handle_event client ws_key event message =
  let json = message |> Yojson.Safe.from_string in
  match event with
  | "enter" ->  
    let json_enter = json |> enter_event_of_yojson in 
    let result = {id= ws_key; nickname= json_enter.nickname} in
    let return = Yojson.Safe.to_string (yojson_of_enter_result result) in
    let _ = Dream.send client return in
    ()
  | "ready" -> ()
  | _ -> ()

let handle_client client ws_key =  
  let rec loop () = 
    match%lwt Dream.receive client with 
    | Some(message') ->
      let json = message' |> Yojson.Safe.from_string |> message_object_of_yojson in            
      let _ = handle_event client ws_key json.event json.message  in 
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
    

    
    
