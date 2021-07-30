from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, DateField
from wtforms.validators import DataRequired, Email, Length


class AddAutorForm(FlaskForm):
    name = StringField('Nombres', validators=[DataRequired(), Length(max=100)])
    apellidos = StringField('Apellidos', validators=[DataRequired(), Length(max=100)])
    fechanac = DateField('Fecha de Nacimiento', validators=[DataRequired()])
    #TODO fecham = DateField('Fecha de Muerte', validator=Tendría que ser mayor a fechanac)
    nac = StringField('Nacionalidad', validators=[DataRequired(), Length(max=40)])
    submit = SubmitField('Guardar')