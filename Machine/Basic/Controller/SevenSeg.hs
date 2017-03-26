{-# LANGUAGE BinaryLiterals #-}
module Machine.Basic.Controller.SevenSeg where

import CLaSH.Prelude
import Machine.Basic.Device


sevenSegsDevice :: Device
sevenSegsDevice = Device 0 4

segmentsDevice :: Device
segmentsDevice = Device 0 8

sevenSeg :: Signal (BitVector 16) -> Signal (BitVector 4, BitVector 8)
sevenSeg = mealy multiplex 0


multiplex :: BitVector 2 -> BitVector 16 -> (BitVector 2, (BitVector 4, BitVector 8))
multiplex an v = (an+1, (anode an, segs))
  where
    iv = sh an
    segs = nibbleToSeg . resize $ v `shiftR` (sh an)
  

anode :: BitVector 2 -> BitVector 4
anode 0 = 0b0111
anode 1 = 0b1011
anode 2 = 0b1101
anode 3 = 0b1110


sh :: BitVector 2 -> Int
sh 0 = 0
sh 1 = 4
sh 2 = 8
sh 3 = 12


{-
   A
   _
 F| |B
   - G
 E|_|C .H
   D
-}

nibbleToSeg :: BitVector 4 -> BitVector 8
nibbleToSeg v =
  case v of
      0x0 -> 0b01000000
      0x1 -> 0b01111001
      0x2 -> 0b00100100
      0x3 -> 0b00110000
      0x4 -> 0b00011001
      0x5 -> 0b00010010
      0x6 -> 0b00000010
      0x7 -> 0b01111000
      0x8 -> 0b00000000
      0x9 -> 0b00010000
      0xa -> 0b00001000
      0xb -> 0b00000011
      0xc -> 0b01000110
      0xd -> 0b00100001
      0xe -> 0b00000110
      0xf -> 0b00001110