{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
module Advent7
    ( advent7_1, advent7_2
    ) where

import Text.Heredoc
import Data.Ord

import Text.Parsec
import Text.Parsec.Char
import Text.Parsec.String
import Data.Char
import Text.Parsec.Combinator (many1)

-- Parse text into tree

data Step = Step Char Char

data Tree = Tree Char [Tree] deriving (Show)

stepLine :: Parser Step
stepLine = do
    string "Step "
    precede <- letter
    string " must be finished before step "
    item <- letter
    string " can begin."
    endOfLine
    return Step precede item

stepList :: Parser [Step]
stepList = do 
    l <- many stepLine
    eof
    return l

parseSteps i = parse stepList "" i

-- Assemble list of steps into tree

-- sortSteps l = sortBy (cmp) $ nub $ mapConcat (\(Step c d) -> [c, d]) l
--    where cmp a b = 

-- Answers

advent7_1 = 0

advent7_2 = 0

-- Input

input2 = [here|Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
|]

input = [here|Step S must be finished before step B can begin.
Step B must be finished before step Y can begin.
Step R must be finished before step E can begin.
Step H must be finished before step M can begin.
Step C must be finished before step F can begin.
Step K must be finished before step A can begin.
Step V must be finished before step W can begin.
Step W must be finished before step L can begin.
Step J must be finished before step L can begin.
Step Q must be finished before step A can begin.
Step U must be finished before step L can begin.
Step Y must be finished before step M can begin.
Step T must be finished before step F can begin.
Step D must be finished before step A can begin.
Step I must be finished before step M can begin.
Step O must be finished before step P can begin.
Step A must be finished before step L can begin.
Step P must be finished before step N can begin.
Step X must be finished before step Z can begin.
Step G must be finished before step N can begin.
Step M must be finished before step F can begin.
Step N must be finished before step L can begin.
Step F must be finished before step Z can begin.
Step Z must be finished before step E can begin.
Step E must be finished before step L can begin.
Step O must be finished before step X can begin.
Step B must be finished before step V can begin.
Step H must be finished before step Q can begin.
Step T must be finished before step M can begin.
Step A must be finished before step G can begin.
Step R must be finished before step H can begin.
Step S must be finished before step C can begin.
Step N must be finished before step Z can begin.
Step Z must be finished before step L can begin.
Step Q must be finished before step Z can begin.
Step R must be finished before step G can begin.
Step P must be finished before step Z can begin.
Step U must be finished before step M can begin.
Step W must be finished before step D can begin.
Step F must be finished before step L can begin.
Step D must be finished before step P can begin.
Step I must be finished before step E can begin.
Step M must be finished before step E can begin.
Step H must be finished before step N can begin.
Step F must be finished before step E can begin.
Step D must be finished before step L can begin.
Step C must be finished before step E can begin.
Step H must be finished before step Z can begin.
Step W must be finished before step Q can begin.
Step X must be finished before step E can begin.
Step G must be finished before step M can begin.
Step X must be finished before step M can begin.
Step Y must be finished before step P can begin.
Step S must be finished before step I can begin.
Step P must be finished before step X can begin.
Step S must be finished before step T can begin.
Step I must be finished before step N can begin.
Step P must be finished before step L can begin.
Step C must be finished before step X can begin.
Step I must be finished before step G can begin.
Step O must be finished before step F can begin.
Step I must be finished before step X can begin.
Step C must be finished before step Z can begin.
Step B must be finished before step K can begin.
Step T must be finished before step P can begin.
Step Q must be finished before step X can begin.
Step M must be finished before step N can begin.
Step H must be finished before step O can begin.
Step Q must be finished before step M can begin.
Step U must be finished before step F can begin.
Step Y must be finished before step O can begin.
Step D must be finished before step O can begin.
Step R must be finished before step T can begin.
Step A must be finished before step E can begin.
Step A must be finished before step M can begin.
Step C must be finished before step N can begin.
Step G must be finished before step E can begin.
Step C must be finished before step Y can begin.
Step A must be finished before step Z can begin.
Step S must be finished before step X can begin.
Step V must be finished before step Z can begin.
Step Q must be finished before step I can begin.
Step P must be finished before step E can begin.
Step D must be finished before step F can begin.
Step M must be finished before step Z can begin.
Step U must be finished before step N can begin.
Step Q must be finished before step L can begin.
Step O must be finished before step Z can begin.
Step N must be finished before step E can begin.
Step S must be finished before step W can begin.
Step S must be finished before step O can begin.
Step U must be finished before step T can begin.
Step A must be finished before step P can begin.
Step J must be finished before step I can begin.
Step A must be finished before step F can begin.
Step U must be finished before step D can begin.
Step W must be finished before step X can begin.
Step O must be finished before step L can begin.
Step J must be finished before step D can begin.
Step R must be finished before step Z can begin.
Step O must be finished before step N can begin.
|]