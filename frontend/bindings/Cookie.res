@module("js-cookie") @scope("default") @val external setCookie: (string, string) => unit = "set"

@module("js-cookie") @scope("default") @val external getCookie: string => string = "get"
