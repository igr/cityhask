module Main(main) where

import System.Directory
import System.Environment ( getEnvironment )
import Domain
import Parse

loadEnvs :: IO (Either String Configuration)
loadEnvs = do
    envs <- getEnvironment
    let inPaths = lookup "IN_PATH" envs
    let outPaths = lookup "OUT_PATH" envs
    case (inPaths, outPaths) of
        (Just i, Just o) -> return $ Right (Configuration (InputPath i) (OutputPath o))
        _ -> return $ Left "Missing environment variables"

collectInputs :: InputPath -> IO [String]
collectInputs i = do
    let path = unInputPath i
    files <- listDirectory path
    return $ map ((path ++) "/" ++) files

readJson :: String -> IO String
readJson fileName = do
    contents <- Prelude.readFile fileName
    return contents


main :: IO ()
main = do
    cfg <- loadEnvs
    -- read all jsons
    jsons <- case cfg of
        Left err -> return $ Left err
        Right c -> do
            files <- collectInputs (inPath c)
            contents <- mapM readJson files
            return (Right contents)
    -- process all jsons
    cities <- case jsons of
        Left err -> return $ Left err
        Right list -> do
            return (Right (map parse list))
    -- time to print
    _ <- case cities of
        Left err -> print err
        Right c -> do
            print c
    return ()
