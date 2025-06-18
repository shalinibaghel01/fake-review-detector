from flask import Flask, render_template, request

app = Flask(__name__)

def is_fake_review(review):
    fake_keywords = ['free', 'guaranteed', 'discount', 'sponsored']
    return any(word in review.lower() for word in fake_keywords)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    review = request.form['review']
    if is_fake_review(review):
        result = "❌ Fake Review Detected!"
        status = "danger"
    else:
        result = "✅ Genuine Review Detected!"
        status = "success"
    return render_template('result.html', review=review, result=result, status=status)

if __name__ == '__main__':
    app.run(debug=True)
