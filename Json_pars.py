import json
import smtplib


j = '{"name": "Сергей Тетерин", "email": "pavlooovich@gmail.com", "result": "6.9"}'


def read_json(x):
    d = json.loads(x)
    return [d['name'], d['result'], d['email']]


email_adress = read_json(j)[2]
someString = "Привет, " + read_json(j)[0] + ", твой результат: " + read_json(j)[1]
email_text = someString.encode('utf-8')


smtpObj = smtplib.SMTP('smtp.mail.ru', 587)
smtpObj.starttls()
smtpObj.login('someemail@bk.ru', 'somepassword')
smtpObj.sendmail("someemail@bk.ru", email_adress, email_text)
