port module Cart exposing (..)

import Html exposing (program, nav, h2, text, p, ul, li)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { products : List Product
    }


type alias Product =
    { product : String, price : Float }


init : ( Model, Cmd Msg )
init =
    ( Model [], Cmd.none )


view : Model -> Html.Html Msg
view model =
    nav []
        [ h2 []
            [ text "Cart" ]
        , p []
            [ if List.length model.products == 0 then
                text "Your cart is empty"
              else
                ul [] (List.map cartItem model.products)
            ]
        ]


cartItem : Product -> Html.Html Msg
cartItem product =
    li []
        [ text <| product.product ++ " - $" ++ (toString product.price)
        ]


type Msg
    = AddToCart Product


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddToCart product ->
            ( { model | products = model.products ++ [ product ] }, Cmd.none )


port addToCartEvents : (Product -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    addToCartEvents AddToCart
