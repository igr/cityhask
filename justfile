set dotenv-load

# just displays the receipes
default:
    @just --list

# builds the project
build:
    stack build

run:
    stack run