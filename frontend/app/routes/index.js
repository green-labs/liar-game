// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Lottie from "../../bindings/Lottie.js";
import * as JsCookie from "js-cookie";
import * as React$1 from "@remix-run/react";

function Index$default(Props) {
  var navigate = React$1.useNavigate();
  return React.createElement("div", {
              className: "flex flex-col justify-center items-center text-center text-white mx-12 gap-y-4"
            }, React.createElement(Lottie.LoaderComponent.make, {
                  jsonUrl: "/animation/theater-masks.json",
                  className: "w-48",
                  loop: true,
                  useIntersection: true,
                  name: "check"
                }), React.createElement("h3", {
                  className: "text-2xl daimonion"
                }, "Let the games Begin"), React.createElement("p", {
                  className: "text-xs"
                }, "누군가는 ", React.createElement("span", {
                      className: "blod text-rose-500"
                    }, "거짓말"), "을 하고 있다"), React.createElement("form", {
                  className: "w-48 flex m-2 flex-col gap-y-1",
                  onSubmit: (function (e) {
                      e.preventDefault();
                      var target = e.target;
                      var value = target.nickname.value;
                      JsCookie.default.set("id", value);
                      return Curry._2(navigate, "/lobby", undefined);
                    })
                }, React.createElement("input", {
                      className: "daimonion text-xs text-black px-2 py-1 rounded-md outline-0 caret-rose-800",
                      name: "nickname",
                      placeholder: "nickname",
                      type: "text"
                    }), React.createElement("button", {
                      className: "daimoniontext-4xl w-full flex items-center justify-center\n          px-2 py-1 border border-transparent text-base font-medium rounded-md\n          text-white bg-rose-800 hover:bg-rose-900\n          hover:ring-2 hover:ring-white ring-inset"
                    }, "Enter!")), React.createElement("p", {
                  className: "text-xs text-left first-letter:text-xl max-w-xs"
                }, "로비에 입장하여 모든 참여자가 주제와 제시어를 제출하면, 3초 내로 게임이 시작한다."), React.createElement("p", {
                  className: "text-xs text-left max-w-xs"
                }, "참가자들 중 한명은 ", React.createElement("span", {
                      className: "blod text-lg text-rose-500 underline underline-offset-3 decoration-rose-500"
                    }, "라이어"), "이다. 순서대로 라이어가 눈치채지 못하도록 제시어를 다른 참가자들에게 설명하라. 참가자들이 제시한 설명을 듣고 제시어를 유추하여, 자신이 제시어를 알고 있다고 믿게하며 최후 투표에서 지목될 경우 제시어를 맞추면 되는 게임이다."));
}

var $$default = Index$default;

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
