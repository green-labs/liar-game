// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Ky from "ky";
import Swr from "swr";
import * as React from "react";
import LottieWeb from "lottie-web";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import * as CustomHooks from "../app/util/CustomHooks.js";

var Loop = {};

var AnimationItem = {};

function Lottie$Component(Props) {
  var className = Props.className;
  var animationData = Props.animationData;
  var loop = Props.loop;
  var autoplayOpt = Props.autoplay;
  var rendererOpt = Props.renderer;
  var useIntersectionOpt = Props.useIntersection;
  var isClickableOpt = Props.isClickable;
  var nameOpt = Props.name;
  var autoplay = autoplayOpt !== undefined ? autoplayOpt : false;
  var renderer = rendererOpt !== undefined ? rendererOpt : "svg";
  var useIntersection = useIntersectionOpt !== undefined ? useIntersectionOpt : false;
  var isClickable = isClickableOpt !== undefined ? isClickableOpt : false;
  var name = nameOpt !== undefined ? nameOpt : "";
  var match = React.useState(function () {
        
      });
  var setAnimationItem = match[1];
  var animationItem = match[0];
  var ref = React.useRef(null);
  var isIntersecting = CustomHooks.useIntersectionObserverSimple(undefined, ref, 0.5, "0px 0px 0px 0px", undefined);
  React.useLayoutEffect((function () {
          if (useIntersection && isIntersecting) {
            Belt_Option.map(animationItem, (function (item) {
                    item.goToAndPlay(0, false);
                    
                  }));
          }
          
        }), [isIntersecting]);
  React.useEffect((function () {
          Belt_Option.map(Caml_option.nullable_to_opt(ref.current), (function (current$p) {
                  var config = {
                    container: current$p,
                    renderer: renderer,
                    animationData: animationData,
                    loop: loop,
                    autoplay: autoplay,
                    name: name
                  };
                  return setAnimationItem(function (param) {
                              return LottieWeb.loadAnimation(config);
                            });
                }));
          return (function (param) {
                    Belt_Option.map(animationItem, (function (item) {
                            LottieWeb.destroy(item.name);
                            
                          }));
                    
                  });
        }), []);
  var tmp = {
    ref: ref,
    onClick: (function (param) {
        if (isClickable) {
          Belt_Option.map(animationItem, (function (item) {
                  item.goToAndPlay(0, false);
                  
                }));
          return ;
        }
        
      })
  };
  if (className !== undefined) {
    tmp.className = Caml_option.valFromOption(className);
  }
  return React.createElement("figure", tmp);
}

var Component = {
  make: Lottie$Component
};

function fetcher(url) {
  return Ky.default.get(url).then(function (res) {
              return res.json();
            });
}

function Lottie$LoaderComponent(Props) {
  var jsonUrl = Props.jsonUrl;
  var className = Props.className;
  var loop = Props.loop;
  var autoplayOpt = Props.autoplay;
  var rendererOpt = Props.renderer;
  var useIntersectionOpt = Props.useIntersection;
  var isClickableOpt = Props.isClickable;
  var nameOpt = Props.name;
  var autoplay = autoplayOpt !== undefined ? autoplayOpt : false;
  var renderer = rendererOpt !== undefined ? rendererOpt : "svg";
  var useIntersection = useIntersectionOpt !== undefined ? useIntersectionOpt : false;
  var isClickable = isClickableOpt !== undefined ? isClickableOpt : false;
  var name = nameOpt !== undefined ? nameOpt : "";
  var match = Swr(jsonUrl, fetcher);
  var data = match.data;
  if (data === undefined) {
    return null;
  }
  var tmp = {
    animationData: Caml_option.valFromOption(data),
    loop: loop,
    autoplay: autoplay,
    renderer: renderer,
    useIntersection: useIntersection,
    isClickable: isClickable,
    name: name
  };
  if (className !== undefined) {
    tmp.className = Caml_option.valFromOption(className);
  }
  return React.createElement(Lottie$Component, tmp);
}

var LoaderComponent = {
  make: Lottie$LoaderComponent
};

export {
  Loop ,
  AnimationItem ,
  Component ,
  fetcher ,
  LoaderComponent ,
  
}
/* ky Not a pure module */