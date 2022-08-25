@module("js-cookie") @scope("default")
@val external setCookie: (string, string) => unit = "set"

@react.component
let default = () => {
  let navigate = Remix.useNavigate()

  <div className="flex flex-col justify-center items-center text-center text-white mx-12 gap-y-4">
    <Lottie.LoaderComponent
      className="w-48"
      jsonUrl="/animation/theater-masks.json"
      name="check"
      loop={Lottie.Loop.ofBool(true)}
      useIntersection=true
    />
    <h3 className="text-2xl daimonion"> {"Let the games Begin"->React.string} </h3>
    <p className="text-xs">
      {`누군가는 `->React.string}
      <span className="blod text-rose-500"> {`거짓말`->React.string} </span>
      {`을 하고 있다`->React.string}
    </p>
    <form
      className="w-48 flex m-2 flex-col gap-y-1"
      onSubmit={e => {
        e->ReactEvent.Synthetic.preventDefault
        let target = e->ReactEvent.Synthetic.target
        let value = target["nickname"]["value"]
        Js.Console.log(`id=${value}`)

        setCookie("id", `${value}`)
        navigate("/lobby", None)

        // TODO: 다른 페이지 만들어서 거기서 처리하도록 옮겨야함
        open Webapi
        let socket = WebSocket.make("ws://localhost:8080/ws")
        
        socket->WebSocket.addOpenListener(_ => {
          let dict = Js.Dict.empty()
          dict->Js.Dict.set("event", "Hell"->Js.Json.string) 
          dict->Js.Dict.set("message", "Low"->Js.Json.string) 
          let dict2 = dict->Js.Json.object_->Js.Json.stringify
          socket->WebSocket.sendText(dict2)
        })

        socket->WebSocket.addMessageListener(event => {
          Js.log2("Message from server ", event.data)
        })
      }}>
      <input
        name="nickname"
        type_="text"
        placeholder="nickname"
        className="daimonion text-xs text-black px-2 py-1 rounded-md outline-0 caret-rose-800"
      />
      <button
        className="daimoniontext-4xl w-full flex items-center justify-center
          px-2 py-1 border border-transparent text-base font-medium rounded-md
          text-white bg-rose-800 hover:bg-rose-900
          hover:ring-2 hover:ring-white ring-inset">
        {"Enter!"->React.string}
      </button>
    </form>
    <p className="text-xs text-left first-letter:text-xl max-w-xs">
      {`로비에 입장하여 모든 참여자가 주제와 제시어를 제출하면, 3초 내로 게임이 시작한다.`->React.string}
    </p>
    <p className="text-xs text-left max-w-xs">
      {`참가자들 중 한명은 `->React.string}
      <span className="blod text-lg text-rose-500 underline underline-offset-3 decoration-rose-500">
        {`라이어`->React.string}
      </span>
      {`이다. 순서대로 라이어가 눈치채지 못하도록 제시어를 다른 참가자들에게 설명하라. 참가자들이 제시한 설명을 듣고 제시어를 유추하여, 자신이 제시어를 알고 있다고 믿게하며 최후 투표에서 지목될 경우 제시어를 맞추면 되는 게임이다.`->React.string}
    </p>
  </div>
}
