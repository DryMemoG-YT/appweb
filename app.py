from flask import Flask, render_template
app = Flask(__name__)

prestamos=[]

@app.route('/')
def index():
    return render_template("index.html",num_prestamos=len(prestamos))
    
@app.route("/p/<string:slug>/")
def show_prestamo(slug):
    return render_template("prestamo_view.html",slug_title=slug)

@app.route("/admin/prestamo/")
@app.route("/admin/prestamo/<int:idPrestamo>")
def prestamo_form(idPrestamo=None):
    return render_template("admin/prestamo_form.html", idPrestamo=idPrestamo )

@app.route("/admin/addautor")
def add_autor():
    return render_template("admin/addautor.html")