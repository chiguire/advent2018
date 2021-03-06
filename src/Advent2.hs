{-# LANGUAGE TemplateHaskell, QuasiQuotes #-}
module Advent2
    ( advent2_1, advent2_2
    ) where

import Text.Heredoc
import qualified Data.HashMap.Strict as HashMap

histogram :: String -> HashMap.HashMap Char Int
histogram s = histogram' s HashMap.empty
            where histogram' [] hm = hm
                  histogram' (x:xs) hm = histogram' xs $ histogram'' x hm
                  histogram'' x hm = HashMap.insert x (1 + HashMap.lookupDefault 0 x hm) hm
-- Answers

advent2_1 = (countFilter contains2) * (countFilter contains3)
          where countFilter f = length $ filter (f) allHistograms
                containsN n hm = 0 < (length $ HashMap.filter (== n) hm)
                contains2 hm = containsN 2 hm
                contains3 hm = containsN 3 hm
                allHistograms = map (histogram) input

advent2_2 = snd $ head $ filter ((== 1) . fst) lengthsWithDiffs
         where cartesianProd = [zip a b| a <- input, b <- input, a /= b]
               nonMatchingLettersLength = map (length . (filter $ uncurry (/=))) cartesianProd
               matchingLetters = map (filter $ uncurry (==)) cartesianProd
               lengthsWithDiffs = zip nonMatchingLettersLength matchingLetters

-- Input

input = lines [here|tqzvwnogbarflkpcbdewsmjhxi
tqyvunogzarfckpcbdewsmzhci
tqyvunojzarflkpcbdcwsmyhxi
tqyvunogzarclkpcbdewmmjrxi
hqyvunogzarflkpcbczwsmjhxi
tqyvunogzarflppcudewsmjhei
tqrvunogzarflkpcbpewsmjhdi
aqyvunogzarflkpcbdewsjjsxi
tqyvtnogzarflkkcbdewymjhxi
tcyeunogzarfkkpcbdewsmjhxi
tqyvunozzarfvkpcbdewsqjhxi
tkyvuwjgzarflkpcbdewsmjhxi
tqevunogzarflkpnbdkwsmjhxi
tqyvunogqarflkpcppewsmjhxi
tqyvunsgzarflkpcbrewsmjhxk
tqyvunogzarffkpdbnewsmjhxi
tqyvunogvarflkpjbdewsojhxi
tqyvgnogzarflkpfbdswsmjhxi
tqyvunogzarfxkpcbtersmjhxi
tqyvukhgzarflupcbdewsmjhxi
tqyvdnoozyrflkpcbdewsmjhxi
tqyvunogzorflkpcbdewsvjhxd
tqyvunzqzarflkpcbdewxmjhxi
tqykunogzarulkpcbdhwsmjhxi
tqycdnogzarflkpcbdewsmjhxz
eqyvunogzarflkpcbdhwqmjhxi
cqyvunogzaralkpcbdewsmjvxi
vqyvunogzarflklcbeewsmjhxi
tqyvunogzarffkpcqdewlmjhxi
eqyvunogzarflkpcbdejsmahxi
tqyvunogjarflkocsdewsmjhxi
tqzvunogzanflkpcbdewsmjhxg
tqycunogzarflkpabdewsmkhxi
tqyvunogzarnlkpcbdewimjaxi
tqyvunogzarfzkpcbdepsyjhxi
gqykunogzarelkpcbdewsmjhxi
tqyvuwogzarflkpcbdrwsmjmxi
tqdqunogzarflkpcbdewsvjhxi
tqmvunbgzarflkpcbdewsvjhxi
tqyvunogzarflkpcbheesmjhdi
tqxvunogzarfxkpcbdewsmhhxi
tqyvunogzarflkpabdjosmjhxi
tqyvugogztrflkpybdewsmjhxi
tqyvundgzarflkxcbdewsmjhmi
tqyvunogzurfgkpcbdeksmjhxi
tqyvunokzarfckpcbdewsojhxi
tqyvufobzarflkpcldewsmjhxi
tqyvunogznrflkncbdeusmjhxi
tqyvuncgzarfxkpcmdewsmjhxi
oqyvunogzarflkpybdewbmjhxi
tqyvjnogqarfmkpcbdewsmjhxi
tqyvunogzacflkpcidewsmjhwi
tqyvunogzarflkpcbqlwxmjhxi
tqyvunogzarflkpnbhewsvjhxi
vqyiunogzarflkpcbdewsmjhqi
tbyvuncgzarfljpcbdewsmjhxi
tqylunogzarflkpcldexsmjhxi
tqyvulogzarflktcbdewsxjhxi
tqyvmnlgzarflkpcbxewsmjhxi
tqyvunogzartlkpcbdewsmihxp
nqyvunogzarflkpcbdewsmnwxi
tqyvunogzarflkpczdewsmjcxj
tzyvunogzariwkpcbdewsmjhxi
tqyiufogzarflipcbdewsmjhxi
oqyvunogzasflkpcbdewsmjhxv
tqyvunoqmarflkpcwdewsmjhxi
tqrvunogzarflkpqbdewnmjhxi
tqyvunogzarmlkocbdewsmjhri
tqyvunogzakflkpcbveasmjhxi
tqyvunorearflkpcbdewsmfhxi
tqynrnogzarflkpcbdewsmjhxp
tiyvueogzaeflkpcbdewsmjhxi
tqyrunogzarflkpccdewbmjhxi
tqtvunogzarflkpcbdewbnjhxi
tqyvfnogzarflhpcbdewsmjqxi
tqyjunoazarflkpcbdewssjhxi
tqyvunxizarflkpcbdewsmjnxi
tqyvunogzarfhkpobdewsmjhai
tqyaunogzanflkpcbxewsmjhxi
tqyvunogzarflkpsbuewsmjmxi
tqyvunogzarzlkwybdewsmjhxi
tqyvunogzarflkpibdawsmhhxi
tqyvunogzarflkycbdewamjwxi
tqyvunourarflkpcbdewsujhxi
tqyvnnogzirflkpcbdewsdjhxi
tayvunogzauflkpcqdewsmjhxi
tqyvunobzfrflkscbdewsmjhxi
tqygvnogzarflkpcbdewsmjnxi
oqyvunogzarflkpcbdewsmjsgi
tqyvunokzarflkpcbdewshjhii
tqyvunobzarflkvcbdewskjhxi
aqyvunogvarflkpcbdlwsmjhxi
tqyvunogzmrrlbpcbdewsmjhxi
tqyvunggzaqolkpcbdewsmjhxi
tqyvunogqarflkpybdewsmjaxi
tqyvunogzxrflkpcxsewsmjhxi
zqyvunogzarflppcbdewsmjhni
tqvvunogzakslkpcbdewsmjhxi
tqyrunogzarzlkpcbdewsmjtxi
tqyvhnogzarfxkpcbdewqmjhxi
tqyvunogzarflkecbdewgdjhxi
tqyvuwogzerfhkpcbdewsmjhxi
tqmvunogzarflkpcbddwsmdhxi
tqyvunogzarflcqcbdewsmihxi
tqyvunogzarvlkpcbdewsmjmxd
tqyvknogzarfllncbdewsmjhxi
tqyvunogzarflbpcbdrwsajhxi
tqyvunogzarfukpcbddwsmjhii
tqyvuvojzahflkpcbdewsmjhxi
tqyvunogzarfchpcbdeqsmjhxi
wqivueogzarflkpcbdewsmjhxi
tqyvunogzwrflkpcbdewstjhxz
tqyvunogzarfloscbdewsmjhxf
tqfbuiogzarflkpcbdewsmjhxi
tqyvfuogzarflkpcxdewsmjhxi
tqyvunogzarflkpcpdewsmgqxi
tqyvunogzdrflkpcbdewsmqhci
tqyvunogzartlkpcbdewsmjpxj
tqyfunogzarfwkpcbdewsmwhxi
tqyvuntgzarflkjcmdewsmjhxi
tqyvunqfzarflkpckdewsmjhxi
nqyvunogznrflkpcbiewsmjhxi
tqymunobzarflkccbdewsmjhxi
tqyvunogzaoflkprbdewzmjhxi
tqyvunogzaiflkpcvdewbmjhxi
tqwvunogzarfzkpcbdewsmjhxx
txhvunogzarflkpcbdewsijhxi
tqyeunogkarflkicbdewsmjhxi
tqylunogzarylkpcbdewsmkhxi
tqyvriogzarflkpcbdewsmohxi
tqyvunogzsrflkpcbdeasijhxi
tqyvunogzarflkpcbfewcmjhxh
tqyvunoozvrflkpcbdewimjhxi
tqyvunogqayflkpcidewsmjhxi
tqyounogzarflkpccdewsmjhxg
tqgvunogsarflkpcbdewqmjhxi
tqevunogzarflkpcbmewsmjhpi
tqivunogzarflkgcbdewqmjhxi
tqyuunogzlrflkgcbdewsmjhxi
xqyvbnogznrflkpcbdewsmjhxi
tqyvunogzarfjkpebdewsmnhxi
tqyvvnogzarfskpcxdewsmjhxi
thovunogzarflkpcbdewsmjhvi
tqyvunugzarflkpcpdewsmjrxi
tcyvvnogzarflkdcbdewsmjhxi
tqdfunogzarflkpbbdewsmjhxi
tqyvunogzarflkpcbdnwsejzxi
tqyvunivkarflkpcbdewsmjhxi
tqyvunogzawflopcbdewsmjhmi
tqyvunogzarflkpcbdkwsdjqxi
tqyvunodzarflkpcbdewlmjhei
oqyvunoozarflkpcbdemsmjhxi
tiyvunogzarjlkpcbdewfmjhxi
tqrvunogearflkpcbdewsojhxi
tqyvunkgzarflkpcbdcwtmjhxi
tqmvunogzarflkpcbdpwsmjtxi
tqyvunogzarflkpcydeptmjhxi
tqyvunkglarflkpcbdfwsmjhxi
tqyaunogzarflkpcbzeesmjhxi
tqyvunogzarrlkpcbdkwsmjhui
tpyvunogzarflkqcbdewsmjhxd
tvyvunogzarfkkpcbdewsajhxi
gqynunogzarflepcbdewsmjhxi
zqvvunogzarflkpcbdexsmjhxi
tqyyunogzawflkpcbdewsmjhxw
tfyvunogzarflkpcbdewomjrxi
tqyeunogzvrflrpcbdewsmjhxi
nqyvunogzarftkpabdewsmjhxi
tzyvunogzariwkpcbdewmmjhxi
tiyvunogzarflkpcbbewsmjhxa
tqydujoyzarflkpcbdewsmjhxi
tqyvunpgzarflkpcbdeysmjhwi
tqyvunogvarllkpcbdewsmshxi
tqyvunogzbrvlkpcbdewsmjhxp
tcyvueogzarflkacbdewsmjhxi
tqyvunogzrhflkpcbdetsmjhxi
tqavunogzrdflkpcbdewsmjhxi
tqyvunogzjrflkpcbdewstjhki
tqyqunolzarflkpcbdewbmjhxi
tqyvunogzarflkqczdgwsmjhxi
tqyvunogzqrfrkpcbrewsmjhxi
tqyvcnogzhrflkacbdewsmjhxi
tqyvunogzarflkpcbdewsmdhtk
tqyvunoggarftkpcbjewsmjhxi
tvyvunogzarfkkpcpdewsmjhxi
tqyvunogzawflkpcndedsmjhxi
tqyvunogzrrflkpcbdemsmmhxi
tqyvunogzarclkpcbrpwsmjhxi
tryvunogztrflkpcbbewsmjhxi
cqyvundgzarflkpcbdewgmjhxi
tqyvunogzarflktcbkewsmjqxi
tqyvjuogzarflkpcadewsmjhxi
tqyvunogzyrflkpcbbxwsmjhxi
ttyvunogzarflkpcbdewsnmhxi
tqyvunogzarflkpcbdeqsmlhki
fqyvugogzarflapcbdewsmjhxi
tqyvunogzartlkppbdewszjhxi
tqyvunfgztrflzpcbdewsmjhxi
tqyvunogmazflkpcbdewsmjhki
tqyvunzdzarflkpcbdewsmjhvi
tqyvunogzarflkpqbzewsujhxi
tqyvunogzarzlkpcbeewymjhxi
tqyounogzarflkpcbdewsnwhxi
tqysunogsaiflkpcbdewsmjhxi
tqdvunogdarflkpcboewsmjhxi
teyvunogzarflkscbdfwsmjhxi
tqyvunoazarflkpcbdvwsmjhpi
tqyvunooearflkpcbdewrmjhxi
tqyvunoszarflnrcbdewsmjhxi
tqyvunogzalflkpcblewsjjhxi
uqlvunkgzarflkpcbdewsmjhxi
tqyvunobzarflkpcidewsmjhvi
tnyvunogzarflkpcbdnwamjhxi
tqyoudogzarflkpcbdgwsmjhxi
tqyvunoggarflkpcbmewsmwhxi
tqykunogzazflkpcbddwsmjhxi
tfyvunogzarflkpcbdewsmjhgo
tqyvunogztrflkpcbdewoojhxi
tqyvunogzarflkpcbdewbmjoni
tmyvunogzalflkpabdewsmjhxi
tqyvunogzarflkpbbvewqmjhxi
tqyvunofzarflkpcwdexsmjhxi
tayvunogzasflkpcbdewsmhhxi
tqyvlnogzarflkpcbdewsmjwxd
tvyvunogzarflkpcbdewhmjrxi
tqyvunogzarplkpcsdewsmihxi
tqyvunogzarplklcbdewsmjtxi
rqbvunogzarhlkpcbdewsmjhxi
tqyvuxogzarftkpcbdewsmthxi
tqtvunogzarfikpczdewsmjhxi
tqyvunwgzarflkpcbdewsmjxxk
tqygunogzarzlkpnbdewsmjhxi
tqyvunogzarjlkpcbdbwswjhxi
tqyvunogzalfnkpcbdewsmjhxf
tqyucuogzarflkpcbdewsmjhxi
tzyvunogzvrflkpcbdewsmjaxi
tjyvunlgzarflkpcbdewgmjhxi
tqyvcnogzarklkpcbdewsmjhfi
tqyvunogzaaflkpsbaewsmjhxi
tsyvunogzarflkpctdewsmbhxi
tqyeunbgzarflkpcbdewrmjhxi
tqyvunogzcrflqpcbdeismjhxi
eqylunogzarflkpcbdewsmjhxy
tqyvundgzarflkpcbdewmmnhxi
tzyvunogzarflkpcndewsmjhxb
tkyvunogzxrflkpcbdewfmjhxi
tqyvunogzarflkxcbdzwsmjfxi
kqavunogzarflkycbdewsmjhxi
tqyvunogzarjlkpcbdxwkmjhxi
tqyvinogzarfqkpcbdewsmjpxi|]