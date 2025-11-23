from django.db import models

# Create your models here.
class User(models.Model):       
    name = models.CharField(max_length=200)
    surname = models.CharField(max_length=200)
    age = models.IntegerField()
    hobby = models.CharField(max_length=200, null=True)

    def __str__(self):
        return f'nome: {self.name} cognome: {self.surname} age: {self.age}'
