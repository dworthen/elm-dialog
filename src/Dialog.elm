module Dialog exposing (Error(..), confirm, alert, prompt)

{-| Provides access to native `window` modal methods (alert, confirm and prompt).

# Window Dialogs
@docs Error, alert, confirm, prompt

-}


import Task exposing (Task)
import Native.Dialog


{-| Modals (alert, prompt and confirm) can be disabled due to "prevent this page from creating additional dialogs".
-}
type Error
    = Disabled


{-| Alerts user!
-}
alert : String -> Task Error ()
alert =
    Native.Dialog.alert


{-| Prompt for confirmation!
-}
confirm : String -> Task Error Bool
confirm =
    Native.Dialog.confirm


{-| Ask for input. If user leaves input blank or selects 'Cancel' then `Nothing` is returned.
-}
prompt : String -> Task Error (Maybe String)
prompt =
    Native.Dialog.prompt
