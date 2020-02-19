from flask import Flask, Markup, request, render_template
import p3_impl
import subprocess
import string

app = Flask(__name__)

@app.route('/', methods=['GET','POST'])
def home():
    if request.method == 'POST':
        input = request.form['input']
    else:
        input = ''

    err = "no error (yet)"
    output = input or "no input at this time"

    return render_template("display.html", err = err, input = input, output = output)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
