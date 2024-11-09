from django.db import models
from django.utils import timezone

# Create your models here.

class Category(models.Model):
    title = models.CharField(max_length=255, unique=True)
    imgUrl = models.ImageField(blank=False) 
    
    def __str__(self) -> str:
        return self.title
    
class Brand(models.Model):
    title = models.CharField(max_length=255, unique=True)
    imgUrl = models.ImageField(blank=False) 

    def __str__(self) -> str:
        return self.title

class Product(models.Model):
    title = models.CharField(max_length=255)
    price = models.FloatField(default=0, blank=False)
    description = models.TextField(max_length=550)
    is_featured = models.BooleanField(default=False)
    clothesType = models.FloatField(max_length=255, default='unisex')
    routing = models.FloatField(default=1.0, blank=False)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    brand = models.ForeignKey(Brand, on_delete=models.CASCADE)
    colors = models.JSONField(blank=True)
    sizes = models.JSONField(blank=True)
    imgageUrls = models.JSONField(blank=True)
    sizes = models.JSONField(blank=True)
    created_at = models.DateTimeField(default=timezone.now, blank=False)
    
    def __str__(self) -> str:
        return self.title
    

 