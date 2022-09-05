type event_data = {
  event: string,
  message: Atom.user,
}

@scope("JSON") @val
external parseWsData: string => event_data = "parse"

// test data
let user1 = {
  Atom.id: "user1",
  nickname: "nickname1",
  profile: "https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/78848672_107601907402235_75891505184636928_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=4cIiZSc3xL0AX_QFvWj&_nc_ht=scontent-ssn1-1.xx&oh=00_AT-yLPr8iWd8cEIxqskbsmrqCSmHGdvX8rdwePcExe0ZXA&oe=632D464D",
}

// test data
let test_users = [user1]

@react.component
let default = () => {
  React.useEffect0(_ => {
    let socket = Webapi.WebSocket.make("ws://localhost:8080/ws")
    let users = []

    socket->Webapi.WebSocket.addOpenListener(_ => {
      let nickname = Cookie.getCookie("nickname")
      let userDict = Js.Dict.empty()

      userDict->Js.Dict.set("nickname", nickname->Js.Json.string)
      let containerDict = Js.Dict.empty()
      containerDict->Js.Dict.set("event", "enter"->Js.Json.string)
      containerDict->Js.Dict.set(
        "message",
        userDict->Js.Json.object_->Js.Json.stringify->Js.Json.string,
      )
      let reqDict = containerDict->Js.Json.object_->Js.Json.stringify
      socket->Webapi.WebSocket.sendText(reqDict)
    })

    socket->Webapi.WebSocket.addMessageListener(event => {
      let parsed_data = parseWsData(Js.Json.stringify(event.data))

      Js.log2("Message from server ", event.data)
      Js.log2("Current users", users)
      // 입장할 때
      let setValue = Jotai.Utils.useUpdateAtom(Atom.users_atom)
      switch parsed_data.event {
        // enter 와 exit을 polymorphic variants로 합시다!!
      | "enter" => {
          setValue(users => Array.concat(users, [parsed_data.message]))
        }
      | "exit" => {
        setValue(users => Array.keep(users, (user) => user.id != parsed_data.message.id))
      }
      | _ => ()
      }
    })
    None
  })

  <div className="m-8">
    // <div> {users->Array.map(user => user.nickname->React.string)} </div> 이 코드가 타입이 안맞는데 잘 모르겠음
    <form
      className="flex flex-col gap-y-4"
      onSubmit={e => {
        e->ReactEvent.Synthetic.preventDefault
        // ready할 때 문제 전송
      }}>
      <input
        name="subject"
        type_="text"
        placeholder="subject"
        className="daimonion text-xs text-black px-2 py-1 rounded-md outline-0 caret-rose-800"
      />
      <input
        name="answer"
        type_="text"
        placeholder="answer"
        className="daimonion text-xs text-black px-2 py-1 rounded-md outline-0 caret-rose-800"
      />
      <button
        className="daimoniontext-4xl w-full flex items-center justify-center
          px-2 py-1 border border-transparent text-base font-medium rounded-md
          text-white bg-rose-800 hover:bg-rose-900
          hover:ring-2 hover:ring-white ring-inset">
        {"Ready!"->React.string}
      </button>
    </form>
  </div>
}
