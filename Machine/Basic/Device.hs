module Machine.Sky.Device where

import CLaSH.Prelude

import Machine.Sky.Types

data Device =
    Device
    { deviceIn :: Nibble -- Supports up to 16 pins on a device
    , deviceOut :: Nibble
    } deriving (Show)