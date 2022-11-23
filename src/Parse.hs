module Parse(
    parse
) where

import Data.List ( findIndex, isPrefixOf, tails )
import Domain ( City(City), Country )

findString :: (Eq a) => [a] -> [a] -> Maybe Int
findString search str = findIndex (isPrefixOf search) (tails str)

parse :: String -> City
parse city = do
    let index = findString "name" city
    let name = case index of
                    Just i -> takeWhile (/= '"') (drop (i + 8) city)
                    Nothing -> "n/a"
    let index2 = findString "country" city
    let country = case index2 of
                    Just i -> takeWhile (/= '"') (drop (i + 11) city)
                    Nothing -> "n/a"
    City name (read country :: Country)
