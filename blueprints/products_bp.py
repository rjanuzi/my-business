from flask import Blueprint, redirect

products_bp = Blueprint("products", __name__, url_prefix="/products")


# TODO - Remove mock
mocked_products = [
    {
        "name": "Shampoo Treseme",
        "description": "Shampoo para cabelos feminino",
        "unit_of_measure": "Liter",
        "price": 29.90,
    },
    {
        "name": "Condicionador Treseme",
        "description": "Condicionador para cabelos feminino",
        "unit_of_measure": "Liter",
        "price": 27.90,
    },
]


@products_bp.get("/")
def get_products():
    return mocked_products


@products_bp.post("/")
def create_product():
    mocked_products.append(
        {
            "name": "Pomada modeladora",
            "description": "Pomada modeladora para cabelo masculino.",
            "unit_of_measure": "Kilogram",
            "price": 15.99,
        }
    )

    return redirect("/products")
