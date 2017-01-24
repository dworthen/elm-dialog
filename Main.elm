module Main exposing (..)

import Html exposing (..)
import Task
import Dialog


-- MAIN


main : Program Never String Msg
main =
    Html.program
        { init = ( "Waiting", Task.attempt processConfirmationResponse (Dialog.confirm "Do you wish to continue") )
        , update = update
        , subscriptions = (\_ -> Sub.none)
        , view = view
        }



-- MODEL


type alias Model =
    String



-- UPDATE


type Msg
    = ErrorResponse Dialog.Error
    | AlertResponse
    | Update Bool
    | NewMsg (Maybe String)


processConfirmationResponse : Result Dialog.Error Bool -> Msg
processConfirmationResponse result =
    case result of
        Err error ->
            ErrorResponse error

        Ok bool ->
            Update bool


processAlertResponse : Result Dialog.Error () -> Msg
processAlertResponse result =
    case result of
        Err error ->
            ErrorResponse error

        Ok _ ->
            AlertResponse


processPromptResponse : Result Dialog.Error (Maybe String) -> Msg
processPromptResponse result = 
    case result of
        Err error ->
            ErrorResponse error
        
        Ok message -> 
            NewMsg message            


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ErrorResponse _ ->
            ( "Error", Cmd.none )

        AlertResponse ->
            ( "Alerted", Cmd.none )

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
