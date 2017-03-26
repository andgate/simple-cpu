module Machine.Sky.Controller.Device ( devctrlHardware ) where

import CLaSH.Prelude
import Machine.Sky.Device
import Machine.Sky.Device.Input.Buttons
import Machine.Sky.Device.Input.Switches
import Machine.Sky.Device.Output.Leds
import Machine.Sky.Device.Output.SevenSeg
import Machine.Sky.Types

type Devices = Vec 5 Device
type DevicesIn = Vec 5 (BitVector 64)


data State =
  State
    { ctrl_devices :: Devices
    , currDevice :: Nibble
    } deriving (Show)



defState :: State
defState = State devList

devList :: Devices
devlist = buttonsDevice :> switchesDevice :> ledsDevice :> sevenSegDevice 

devctrlHardware :: Signal MemoryResponse -> Signal (MemoryRequest, DevOutputs)
devctrlHardware = mealy devctrl defState

devctrl :: State -> (DevicesIn, MemoryResponse) -> (State, (MemoryRequest, DevicesOut))
devcltr s rsp = (s' rqs)
  where
    s' = undefined
    rqs = undefined