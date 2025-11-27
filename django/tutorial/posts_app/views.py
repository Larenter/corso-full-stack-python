from django.shortcuts import render
from .models import User


def posts(request):
    # prefetch_related precarica le relazioni direttamente con una query sql
    users = User.objects.prefetch_related('posts')

    return render(request, 'posts.html', {'users': users})
