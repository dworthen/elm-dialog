# Elm-Dialog

Provides access to native `window` methods for prompting users.

## Install

This package uses native modules so please use [https://github.com/gdotdesign/elm-github-install](elm-github-install).

## Example

Prompting a user for confirmation:

```
import Html exposing (..)
import Dialog
import Task


-- MAIN


main : Program Never
main =
    Html.program 
        { init = ( "Waiting", Task.perform processConfirmationResponse <| Dialog.confirm "Do you wish to continue?" )
        , update = update
        , subscriptions = (\_ -> Sub.none)
        , view = view 
        }


-- UPDATE


type Msg
    = ErrorResponse Dialog.Error
    | ConfirmResponse Bool


processConfirmationResponse : Result Dialog.Error Bool -> Msg
processConfirmationResponse result =
    case result of
        Err error ->
            ErrorResponse error

        Ok bool ->
            ConfirmResponse bool


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
     case msg of
        ErrorResponse _ -> 
            ("Error", Cmd.none)

        ConfirmResponse True -> 
            ( "Thank you for your confirmation.", Cmd.none )

        ConfirmResponse False ->
            ( "You may leave now.", Cmd.none )


-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model ]
```