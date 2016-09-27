module Dialog exposing (confirm, alert, prompt)

{-| Provides access to native `window` methods for prompting users.

# Window Dialogs
@docs alert, confirm, prompt

-}

import Task exposing (Task)
import Native.Dialog


{-|

    type Msg = AlertResponse

    alert "Warning!" AlertResponse
-}
alert : String -> msg -> Cmd msg
alert message msg =
    message
        |> Native.Dialog.alert
        |> Task.succeed
        |> Task.perform (always msg) (always msg)


{-|

    type Msg = ConfirmResponse Bool

    confirm "Continue?" ConfirmResponse
-}
confirm : String -> (Bool -> msg) -> Cmd msg
confirm prompt constructor =
    prompt
        |> Native.Dialog.confirm
        |> Task.succeed
        |> Task.perform constructor constructor


{-|

    type Msg = PromptResponse String

    prompt "Name:" PromptResponse
-}
prompt : String -> (String -> msg) -> Cmd msg
prompt message constructor =
    message
        |> Native.Dialog.prompt
        |> Task.succeed
        |> Task.perform constructor constructor
