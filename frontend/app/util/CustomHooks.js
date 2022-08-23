// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";

function useIntersectionObserverSimple(root, target, threshold, rootMargin, param) {
  var match = React.useState(function () {
        return false;
      });
  var setIsIntersecting = match[1];
  React.useEffect((function () {
          var t = target.current;
          if (t == null) {
            return ;
          }
          var observer = new IntersectionObserver((function (interSectingEntryArray) {
                  return Curry._1(setIsIntersecting, (function (param) {
                                return Belt_Array.getExn(interSectingEntryArray, 0).isIntersecting;
                              }));
                }), {
                root: root,
                rootMargin: rootMargin,
                threshold: threshold
              });
          observer.observe(t);
          return (function (param) {
                    observer.unobserve(t);
                    
                  });
        }), [
        root,
        target,
        threshold,
        rootMargin
      ]);
  return match[0];
}

export {
  useIntersectionObserverSimple ,
  
}
/* react Not a pure module */
