"""FastAPI file """

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def welcome():
    return "WELCOME TO APPLICATION"
