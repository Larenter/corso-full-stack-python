from django.urls import path
from . import views

urlpatterns = [
    path('users/create/', views.create_user, name="create-user"),
    path('users/update/', views.update_user, name="update-user")
]
