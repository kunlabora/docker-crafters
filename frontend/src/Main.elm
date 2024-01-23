-- Make a GET request to load a book called "Public Opinion"
--
-- Read how it works:
--   https://guide.elm-lang.org/effects/http.html
--
module Main exposing(..)

import Browser
import Html exposing (Html, div, button, text, pre)
import Html.Events exposing (onClick)
import Http exposing (..)
import Json.Decode exposing (Decoder, int, string, succeed, field, map)



-- MAIN


main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



-- MODEL


type Model
  = Failure
  | Loading
  | Success WelcomeMessage

type alias WelcomeMessage =
  { message: String }

emptyModel = Success <| WelcomeMessage "" 


init : () -> (Model, Cmd Msg)
init _ =
  ( emptyModel,
    Cmd.none
  )


-- UPDATE


type Msg
  = ButtonClicked
  | GotMessage (Result Http.Error WelcomeMessage)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ButtonClicked -> (Loading, fetchMessageCmd)
    GotMessage result ->
      case result of
        Ok message -> (Success message, Cmd.none)
        Err _ -> (Failure, Cmd.none)


-- HTTP

fetchMessageCmd : Cmd Msg
fetchMessageCmd = 
    Http.get
        { url = "/api/greet" -- Replace with your API endpoint
        , expect = Http.expectJson GotMessage fetchDataResponse
        }

fetchDataResponse : Decoder WelcomeMessage
fetchDataResponse =
    map WelcomeMessage (field "message" string)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ div [] [ button [ onClick ButtonClicked ] [ text "Click to fetch message." ] ]
    , div [] [ viewMessage model ]
    ]

viewMessage model =
  case model of
    Failure ->
      text "Something went wrong trying to fetch the welcome message"

    Loading ->
      text "Loading..."

    Success welcomeMsg ->
      pre [] [ text welcomeMsg.message ]
