from django.db import models


class UserQuerySet(models.QuerySet):
    # WHERE age >= 18
    def get_adult_users(self):
        return self.filter(age__gte=18)
    

    # WHERE hobby IS NOT NULL
    def has_hobby(self):
        return self.filter(hobby__isnull=False)
    