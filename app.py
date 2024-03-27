from flask import Flask, render_template
from blueprints.products_bp import products_bp

app = Flask(__name__)

# Register Blueprints
app.register_blueprint(blueprint=products_bp)


@app.get("/")
def home():
    return render_template("home.jinja")
