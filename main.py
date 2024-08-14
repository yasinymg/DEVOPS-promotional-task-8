from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Welcome to my app"}

@app.get("/about")
def read_about():
    return {"about": "This is my application."}











