from flask import Flask, render_template, request

app = Flask(__name__)

def compound_interest(principal, rate, time):
    amount = principal * (1 + rate/100)**time
    interest = amount - principal
    return interest

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/compound_interest', methods=['POST'])
def calculate_interest():
    principal = float(request.form['principal'])
    rate = float(request.form['rate'])
    time = float(request.form['time'])
    interest = compound_interest(principal, rate, time)
    return f'The compound interest is: {interest:.2f}'

if __name__ == '__main__':
    app.run(debug=True)
