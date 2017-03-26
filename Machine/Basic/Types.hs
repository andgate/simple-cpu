module Machine.Sky.Types where

import CLaSH.Prelude

type Nibble = BitVector 4
type Byte = BitVector 8

type Address = Byte
type Value = Byte

type MayWrite = Maybe (Address, Value)


type Switches = Byte
type Buttons = Nibble

type Annodes = Nibble
type Segments = Byte