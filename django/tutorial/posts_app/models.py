from django.db import models
from datetime import datetime
from users_app.models import User
 

class Post(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()
    create_date = models.DateField(default=datetime.today().strftime('%Y-%m-%d'))
    user_id = models.ForeignKey(User, on_delete=models.DO_NOTHING, related_name='posts')
    image = models.CharField(null=True, blank=True)
