module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Task
import Dialog


-- MAIN


main : Program Never
main =
    App.program { init = ( "Waiting", Task.perform ErrorResponse NewMsg (Dialog.prompt "Do you wish to continue") ), update = update, subscriptions = (\_ -> Sub.none), view = view }



-- MODEL


type alias Model =
    String



-- UPDATE


type Msg
    = ErrorResponse Dialog.Error
    | AlertResponse ()
    | Update Bool
    | NewMsg (Maybe String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ErrorResponse _ -> 
            ("Error", Cmd.none)

        AlertResponse _ -> 
            ("Alerted", Cmd.none)

        Update True ->
            -- if val then
            ( "Yes", Cmd.none )
            -- else
        
        Update False ->
            ( "No", Cmd.none )

        NewMsg Nothing ->
            ( "No Response", Cmd.none )

        NewMsg (Just val) ->
            ( val, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text model ]
