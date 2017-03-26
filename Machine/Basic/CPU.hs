{-# LANGUAGE BinaryLiterals #-}
module Machine.Sky.CPU where

import CLaSH.Prelude

import Machine.Sky.Types

type CpuIn = (Switches, Buttons)
type CpuOut = (Address, MayWrite)


data CpuState = 
  CpuState
  { addr :: Address
  } deriving Show

initial :: CpuState
initial = CpuState 0


cpuHardware :: Signal CpuIn -> Signal CpuOut
cpuHardware = mealy cpu initial


cpu :: CpuState -> CpuIn -> (CpuState, CpuOut)
cpu s i@(sw, btn) = (s', (currAddr, maywrite))
  where
    currAddr = addressSelector (addr s) btn
    s' = s { addr = currAddr }
    maywrite = case testBit btn 0 of
        True -> Just (currAddr, sw)
        False -> Nothing


addressSelector :: Address -> Buttons -> Address
addressSelector prevAddr btn = newAddr
  where
    newAddr = case (testBit btn 3, testBit btn 2) of
          (True, False)  -> prevAddr - 1
          (False, True)  -> prevAddr + 1
          _       -> prevAddr