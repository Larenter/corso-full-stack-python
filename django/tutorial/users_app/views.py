from django.shortcuts import render
from .models import User


def create_user(request):

    # primo modo per fare una create
    new_user = User.objects.create(
        name='giovanni',
        surname='pippo',
        age=34,
        hobby='disco'
    )

    # # secondo modo per fare una create
    # new_user = User()
    # new_user.name='giovanni'
    # new_user.surname='pippo'
    # new_user.age=34
    # new_user.hobby='disco'

    # new_user.save()

    # terzo modo per fare una create
    # user3 = User.objects.get_or_create(
    #     name='leonardo', 
    #     surname='mazzoleni',
    #     defaults={'name': 'simone', 'surname': 'gigino', 'age': 34, 'hobby': 'ciao'}
    # )

    return render(request, 'users/create.html', {'user': new_user})


def update_user(request):

    # User.objects.update_or_create(
    #     name='leonardo', 
    #     surname='mazzoleni',
    #     defaults={'name': 'simone', 'age': 34, 'hobby': 'ciao'}
    # )

    # primo modo per fare una update
    user = User.objects.filter(id=1)

    user.update(
        name='leonardo', 
        surname='mazzoleni',
    )

    # # secondo modo per fare una update
    # user2 = User.objects.get(id=2)

    # user2.name = 'gianni'
    # user2.surname = 'previtali'
    # user2.save()

    return render(request, 'users/update.html', {'user': user})
