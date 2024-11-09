from django.db import models
from django.utils import timezone

# Create your models here.

class Category(models.Model):
    title = models.CharField(max_length=255, unique=True),
    imgUrl = models.ImageField(blank=False) 
    
    def __str__(self) -> str:
        return self.title
    
class Brand(models.Model):
    title = models.CharField(max_length=255, unique=True),
    imgUrl = models.ImageField(blank=False) 

    def __str__(self) -> str:
        return self.title


 