from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
from flask_mail import Mail
import json
import os
import math

# Implementation of code to fetch the params in the form of json from config file
with open('config.json', 'r') as c:
    params = json.load(c)["params"]
local_server = True

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
# app.config.update(
#     MAIL_SERVER = 'smtp.gmail.com',
#     MAIL_PORT = '465',
#     MAIL_USE_SSL = True,
#     MAIL_USERNAME = params['gmail-user'],
#     MAIL_PASSWORD = params['gmail-password']
# )

# mail = Mail(app)

if (local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params['local_uri']
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params['prod_uri']
db = SQLAlchemy(app)

# Implementation of code to connect the contacts page to the database
class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(30), nullable=False)

# Implementation of code to connect the posts page to the database
class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    posted_by = db.Column(db.String(80), nullable=False)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(40), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    sub_title = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(30), nullable=True)

@app.route('/')
def home():
    #Logic for the implementation of Pagination ----> 1) First --  prev = #, next = page+1  2) Middle --- prev = page-1, next - page+1, 3) Last --- prev = page-1, next = #
    error = ''
    try:
        posts = Posts.query.filter_by().all()
        last = math.ceil(len(posts)/int(params['no_of_posts']))
        #[0:params['no_of_posts']]
        page = request.args.get('page')
        if(not str(page).isnumeric()):
            page = 1
        page = int(page)
        posts = posts[(page-1)*int(params['no_of_posts']) : (page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
        #Implementation of the logic for Pagination
        if (page==1):
            prev = "#"
            next = "/?page="+str(page+1)
        elif (page==last):
            prev = "/?page="+str(page-1)
            next = "#"
        else:
            prev = "/?page="+str(page-1)
            next = "/?page="+str(page+1)
        return render_template('index.html', params=params, posts=posts, prev= prev, next=next)
    except Exception as e:
        return render_template('index.html', error=error)

# Implementation of the code to fetch the posts from the database
@app.route('/post/<string:post_slug>', methods=["GET"])
def post(post_slug):
    error = ''
    try:
        post = Posts.query.filter_by(slug=post_slug).first()
        return render_template('post.html', params=params, post=post)
    except Exception as e:
        return render_template('post.html', error=error)

@app.route('/about')
def about():
    error = ''
    try:
        return render_template('about.html', params=params)
    except Exception as e:
        return render_template('about.html', error=error)

@app.route('/dashboard', methods = ["GET","POST"])
def dashboard():
    #Code to implement the user-id and password validation of the admin login dashboard
    error = ''
    try:
        #Code to implement if user is already in session or user in session matches with the admin (username)
        if ('user' in session and session['user'] == params['admin_user']):
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)

        if request.method == "POST":
            username = request.form.get('uname')
            userpass = request.form.get('pass')
            if (username == params['admin_user'] and userpass == params['admin_password']):
                # Set the session variable
                session['user'] = username
                posts = Posts.query.all()
                return render_template('dashboard.html', params=params, posts=posts)
        else:
            return render_template('login.html', params=params)
    except Exception as e:
        return render_template('login.html', error=error)

@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    error = ''
    try:
        if ('user' in session and session['user'] == params['admin_user']):
            if request.method == "POST":
                box_title = request.form.get('title')
                sub_title = request.form.get('subtitle')
                slug = request.form.get('slug')
                content = request.form.get('content')
                img_file = request.form.get('img_file')
                posted_by = request.form.get('posted_by')
                date = datetime.now()
                if sno == '0':
                    post = Posts(title=box_title, sub_title=sub_title, slug=slug, content=content, img_file=img_file,
                                 date=date, posted_by=posted_by)
                    db.session.add(post)
                    db.session.commit()
                else:
                    post = Posts.query.filter_by(sno=sno).first()
                    post.title = box_title
                    post.slug = slug
                    post.content = content
                    post.img_file = img_file
                    post.posted_by = posted_by
                    db.session.commit()
                    return redirect('/edit/' + sno)
            post = Posts.query.filter_by(sno=sno).first()
            return render_template('edit.html', params=params, post=post, sno=sno)
    except Exception as e:
        return render_template('edit.html', error=error)


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
        if ('user' in session and session['user'] == params['admin_user']):
            if request.method == "POST":
                f = request.files['file1']
                f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))  # Joines upload folder with the name of file
                return "Uploaded Successfully !!"

@app.route('/logout')
def logout():
    error = ''
    try:
        session.pop('user')
        return redirect('/dashboard')
    except Exception as e:
        return render_template('dashboard.html', params=params)

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

# Implementation of router for contact page
@app.route('/contact', methods=['GET', 'POST'])
def contact():
    # To Add entry to the database
    error = ''
    try:
        if (request.method == 'POST'):
            name = request.form.get('name')
            email = request.form.get('email')
            phone = request.form.get('phone')
            message = request.form.get('message')
            entry = Contacts(name=name, phone_num=phone, msg=message, date=datetime.now(), email=email)
            db.session.add(entry)
            db.session.commit()
            # Implementation of code for sending automated email using SMTP protocol of flask-email module
            # mail.send_message('New message from '+name,
            #                   sender = email, recipients = [params['gmail-user']],
            #                   body = message + "\n" + phone
            #                   )
        return render_template('contact.html', params=params)
    except Exception as e:
        return render_template('contact.html', error=error)

if __name__ == '__main__':
    app.run(debug=True, threaded=True)