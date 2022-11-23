module Domain(
    Configuration(..),
    InputPath(..),
    OutputPath(..),
    unInputPath,
    City(..),
    Country,
    parseCountry
) where

newtype InputPath = InputPath String deriving (Show, Eq)

unInputPath :: InputPath -> String
unInputPath (InputPath s) = s

newtype OutputPath = OutputPath String deriving (Show, Eq)

data Configuration = Configuration {
    inPath :: InputPath,
    outPath :: OutputPath
    }

data City = City {
    name :: String,
    country :: Country
    } deriving (Show)

data Country = USA | JAPAN deriving (Enum, Show)

parseCountry :: String -> Country
parseCountry "US" = USA
parseCountry "JP" = JAPAN
parseCountry _ = error "Invalid country"
