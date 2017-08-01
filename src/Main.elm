module Main exposing (..)

import Markdown
import Html


main : Html.Html msg
main =
    Markdown.toHtml [] markdown


markdown : String
markdown =
    """
# This is Markdown

[Markdown](https://daringfireball.net/projects/markdown) lets you write content
in a really natural way.

    * You can have lists, like this one
    * Make things **bold** or _italic_
    * Embed snippets of `code`
    * Create [links](/)
    * ...

The [elm-markdown][] package parses all this content, allowing you easily
to generate content blocks of `Element` or `HTML`.

[elm-markdown]: http://package.elm-lang.org/packages/evancz/elm-markdown/latest
"""
