from django.shortcuts import render
from .models import User


def index(request):
    utenti = User.objects.all()

    utente_singolo = User.objects.get(id=1)

    utente_filtrato = list(User.objects.filter(age__gt=20).filter(hobby='pesca').only('name'))

    utente_esempio = User.objects.raw('SELECT * FROM app_user WHERE age > 20')

    return render(request, 'index.html', {'users': utenti, 'singolo': utente_singolo, 'filtrato': utente_filtrato, 'utenti_raw': utente_esempio})
