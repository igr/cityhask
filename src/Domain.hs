module Domain(
    Configuration(..),
    InputPath(..),
    OutputPath(..),
    unInputPath,
    City(..),
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
    country :: String
    } deriving (Show)