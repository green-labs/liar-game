// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

var user1 = {
  id: "user1",
  nickname: "nickname1",
  profile: "https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/78848672_107601907402235_75891505184636928_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=4cIiZSc3xL0AX_QFvWj&_nc_ht=scontent-ssn1-1.xx&oh=00_AT-yLPr8iWd8cEIxqskbsmrqCSmHGdvX8rdwePcExe0ZXA&oe=632D464D"
};

var test_users = [user1];

function Lobby$default(Props) {
  var socket = new WebSocket("ws://localhost:8080/ws");
  var users = [];
  socket.addEventListener("open", (function (param) {
          var dict = {};
          dict["event"] = "Hell";
          dict["message"] = "Low";
          var dict2 = JSON.stringify(dict);
          socket.send(dict2);
          
        }));
  socket.addEventListener("message", (function ($$event) {
          console.log("Message from server ", $$event.data);
          console.log("Current users", users);
          
        }));
  return React.createElement("div", undefined, React.createElement("form", {
                  onSubmit: (function (e) {
                      e.preventDefault();
                      
                    })
                }, React.createElement("input", {
                      className: "daimonion text-xs text-black px-2 py-1 rounded-md outline-0 caret-rose-800",
                      name: "subject",
                      placeholder: "subject",
                      type: "text"
                    }), React.createElement("input", {
                      className: "daimonion text-xs text-black px-2 py-1 rounded-md outline-0 caret-rose-800",
                      name: "answer",
                      placeholder: "answer",
                      type: "text"
                    }), React.createElement("button", {
                      className: "daimoniontext-4xl w-full flex items-center justify-center\n          px-2 py-1 border border-transparent text-base font-medium rounded-md\n          text-white bg-rose-800 hover:bg-rose-900\n          hover:ring-2 hover:ring-white ring-inset"
                    }, "Ready!")));
}

var $$default = Lobby$default;

export {
  user1 ,
  test_users ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
