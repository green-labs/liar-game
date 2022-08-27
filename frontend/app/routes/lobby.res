type user = {
  id: string,
  nickname: string,
  profile: string,
}

type data = {
  event: string,
  message: user,
}

// test data
let user1 = {
  id: "user1",
  nickname: "nickname1",
  profile: "https://scontent-ssn1-1.xx.fbcdn.net/v/t1.6435-9/78848672_107601907402235_75891505184636928_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=4cIiZSc3xL0AX_QFvWj&_nc_ht=scontent-ssn1-1.xx&oh=00_AT-yLPr8iWd8cEIxqskbsmrqCSmHGdvX8rdwePcExe0ZXA&oe=632D464D",
}

// test data
let test_users = [user1]

@react.component
let default = () => {
  open Webapi
  let socket = WebSocket.make("ws://localhost:8080/ws")
  let users = []

  socket->WebSocket.addOpenListener(_ => {
    let dict = Js.Dict.empty()
    dict->Js.Dict.set("event", "Hell"->Js.Json.string)
    dict->Js.Dict.set("message", "Low"->Js.Json.string)
    let dict2 = dict->Js.Json.object_->Js.Json.stringify
    socket->WebSocket.sendText(dict2)
  })

  socket->WebSocket.addMessageListener(event => {
    Js.log2("Message from server ", event.data)
    // 여기에 users 입장할 때 추가 / 나갈 때 삭제 해줘야함
    Js.log2("Current users", users)
  })
  <div>
    // <div> {users->Array.map(user => user.nickname->React.string)} </div> 이 코드가 타입이 안맞는데 잘 모르겠음
    <form
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
