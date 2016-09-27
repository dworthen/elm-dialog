# Elm-Dialog

Provides access to native `window` methods for prompting users.

## Install

```
elm-package install dworthen/elm-dialog
```

## Example

Prompting a user for confirmation:

```
import Html exposing (..)
import Html.App as App
import Dialog


-- MAIN


main : Program Never
main =
    App.program { init = ( "Waiting", Dialog.confirm "Do you wish to continue?" ConfirmResponse), update = update, subscriptions = (\_ -> Sub.none), view = view }


-- UPDATE


type Msg
    = ConfirmResponse Bool


update : Msg -> Model -> ( Model, Cmd Msg )
update (ConfirmResponse val) model =
    if val then
        ( "Thank you for your confirmation.", Cmd.none )
    else
        ( "You may leave now.", Cmd.none )


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model ]
```