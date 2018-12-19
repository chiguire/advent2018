module Lib
  ( execLib
  ) where

import Advent1
import Advent2
import Advent3
import Advent4
import Advent5
import Advent6
import Advent7
import Advent8
import Advent9
import Advent10
import Advent11
import Advent12
import Advent13
import Advent14
import Advent15
import Advent16
import Advent17
import Advent18
import Advent19
import Advent20
import Advent21
import Advent22
import Advent23
import Advent24


execLib :: String -> String
execLib x = case x of "advent1_1" -> show advent1_1
                      "advent1_2" -> show advent1_2
                      "advent2_1" -> show advent2_1
                      "advent2_2" -> show advent2_2
                      "advent3_1" -> show advent3_1
                      "advent3_2" -> show advent3_2
                      "advent4_1" -> show advent4_1
                      "advent4_2" -> show advent4_2
                      "advent5_1" -> show advent5_1
                      "advent5_2" -> show advent5_2
                      "advent6_1" -> show advent6_1
                      "advent6_2" -> show advent6_2
                      "advent7_1" -> show advent7_1
                      "advent7_2" -> show advent7_2
                      "advent8_1" -> show advent8_1
                      "advent8_2" -> show advent8_2
                      "advent9_1" -> show advent9_1
                      "advent9_2" -> show advent9_2
                      "advent10_1" -> show advent10_1
                      "advent10_2" -> show advent10_2
                      "advent11_1" -> show advent11_1
                      "advent11_2" -> show advent11_2
                      "advent12_1" -> show advent12_1
                      "advent12_2" -> show advent12_2
                      "advent13_1" -> show advent13_1
                      "advent13_2" -> show advent13_2
                      "advent14_1" -> show advent14_1
                      "advent14_2" -> show advent14_2
                      "advent15_1" -> show advent15_1
                      "advent15_2" -> show advent15_2
                      "advent16_1" -> show advent16_1
                      "advent16_2" -> show advent16_2
                      "advent17_1" -> show advent17_1
                      "advent17_2" -> show advent17_2
                      "advent18_1" -> show advent18_1
                      "advent18_2" -> show advent18_2
                      "advent19_1" -> show advent19_1
                      "advent19_2" -> show advent19_2
                      "advent20_1" -> show advent20_1
                      "advent20_2" -> show advent20_2
                      "advent21_1" -> show advent21_1
                      "advent21_2" -> show advent21_2
                      "advent22_1" -> show advent22_1
                      "advent22_2" -> show advent22_2
                      "advent23_1" -> show advent23_1
                      "advent23_2" -> show advent23_2
                      "advent24_1" -> show advent24_1
                      "advent24_2" -> show advent24_2
                      otherwise -> "Failed!"
