module Machine.Sky.Code.Template where

import CLaSH.Prelude


type Prog = [Template]
type Template = (Arity, App, [App])
type Arity = Int
type App = [Atom]

data Atom =
    FUN Arity Int
  | ARG Int
  | VAR Int
  | CON Arity Int
  | INT Int
  | PRI String
  | TAB String
  deriving (Show)
