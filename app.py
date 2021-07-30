from flask import Flask, render_template, request, redirect, url_for
from forms import AddAutorForm
app = Flask(__name__)
app.config['SECRET_KEY'] = '7110c8ae51a4b5af97be6534caef90e4bb9bdcb3380af008f90b23a5d1616bf319bc298105da20fe'

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

@app.route("/admin/addautor",  methods=["GET", "POST"])
def add_autor():
    form = AddAutorForm()
    if form.validate_on_submit():
        Nombres = form.name.data
        Apellidos = form.apellidos.data
        fecha_nac = form.fechanac.data
        #fecha_muerte= request.form['fecham'] #TODO de forms.py validate
        Nacionalidad= form.nac.data
        next = request.args.get('next', None)
        if next:
            return redirect(next)
        return redirect(url_for('index')) #TODO: Modificar la redirección para el formulario de Lista de Autores
    return render_template("admin/addautor.html", form=form)