{-# LANGUAGE BinaryLiterals #-}
module Machine.Basic.CPU where

import CLaSH.Prelude

import Machine.Basic.Types

type CpuIn = (Switches, Buttons)
type CpuOut = (Address, MayWrite)


data CpuState = 
  CpuState
  { pc :: Address
  } deriving Show

initial :: CpuState
initial = CpuState 0


cpuHardware :: Signal CpuIn -> Signal CpuOut
cpuHardware = mealy cpu initial


cpu :: CpuState -> CpuIn -> (CpuState, CpuOut)
cpu s i@(sw, btn) = (s', (currAddr, maywrite))
  where
    pc' = addressSelector (pc s) btn
    s' = s { pc = pc' }
    maywrite = case testBit btn 0 of
        True -> Just (pc', sw)
        False -> Nothing


addressSelector :: Address -> Buttons -> Address
addressSelector a btn = newAddr
  where
    newAddr = case (testBit btn 3, testBit btn 2) of
          (True, False)  -> a - 1
          (False, True)  -> a + 1
          _       -> a