{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
module Advent19
    ( advent19_1, advent19_2
    ) where

import Text.Heredoc

-- Answers

advent19_1 = 0

advent19_2 = 0

-- Input

input2 = [here|#ip 0
seti 5 0 1
seti 6 0 2
addi 0 1 0
addr 1 2 3
setr 1 0 0
seti 8 0 4
seti 9 0 5
|]

input = [here|#ip 3
addi 3 16 3
seti 1 8 4
seti 1 4 5
mulr 4 5 1
eqrr 1 2 1
addr 1 3 3
addi 3 1 3
addr 4 0 0
addi 5 1 5
gtrr 5 2 1
addr 3 1 3
seti 2 1 3
addi 4 1 4
gtrr 4 2 1
addr 1 3 3
seti 1 3 3
mulr 3 3 3
addi 2 2 2
mulr 2 2 2
mulr 3 2 2
muli 2 11 2
addi 1 3 1
mulr 1 3 1
addi 1 17 1
addr 2 1 2
addr 3 0 3
seti 0 3 3
setr 3 0 1
mulr 1 3 1
addr 3 1 1
mulr 3 1 1
muli 1 14 1
mulr 1 3 1
addr 2 1 2
seti 0 8 0
seti 0 9 3
|]