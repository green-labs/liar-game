// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function Index$default(Props) {
  return React.createElement("div", {
              className: "flex flex-col justify-center items-center text-center text-white m-8"
            }, React.createElement("h3", {
                  className: "text-4xl daimonion"
                }, "Let the games Begin"), React.createElement("form", {
                  className: "w-32 flex m-2 flex-col gap-y-2",
                  onSubmit: (function (e) {
                      e.preventDefault();
                      var target = e.target;
                      var value = target.nickname.value;
                      console.log(value);
                      
                    })
                }, React.createElement("input", {
                      className: "daimonion",
                      name: "nickname",
                      placeholder: "nickname",
                      type: "text"
                    }), React.createElement("button", {
                      className: "daimonion"
                    }, "Enter!")));
}

var $$default = Index$default;

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
